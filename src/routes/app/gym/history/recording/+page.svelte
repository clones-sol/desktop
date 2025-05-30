<script lang="ts">
  import { onMount, onDestroy } from 'svelte';
  import Card from '$lib/components/Card.svelte';
  import Button from '$lib/components/form/Button.svelte';
  import EventTimestamp from '$lib/components/gym/EventTimestamp.svelte';
  import AxTreeOverlay from '$lib/components/gym/AxTreeOverlay.svelte';
  import {
    Copy,
    ExternalLink,
    Asterisk,
    Equal,
    EyeOff,
    Eye,
    ChevronUp,
    ChevronDown,
    Trash2
  } from 'lucide-svelte';
  import { convertFileSrc, invoke } from '@tauri-apps/api/core';
  import { writeText } from '@tauri-apps/plugin-clipboard-manager';
  import type { ApiRecording } from '$lib/types/gym';
  import { getPlatform } from '$lib/utils';
  import type { SubmissionStatus } from '$lib/types/forge';
  import { walletAddress } from '$lib/stores/wallet';
  import { listSubmissions } from '$lib/api/endpoints/forge';
  import UploadConfirmModal from '$lib/components/modals/UploadConfirmModal.svelte';
  import { uploadManager } from '$lib/stores/misc';
  import { JsonView } from '@zerodevx/svelte-json-view';

  let platform: Awaited<ReturnType<typeof getPlatform>> = 'windows';
  let submissions: SubmissionStatus[] = [];
  let showDetails = false;

  const recordingId = new URLSearchParams(window.location.search).get('id');
  let selectedView: 'raw' | 'sft' | 'grpo' = 'sft';
  let privateRanges: { start: number; end: number; count: number }[] = [];

  // Function to save private ranges to disk
  async function savePrivateRanges() {
    if (!recordingId) return;

    try {
      await invoke('write_recording_file', {
        recordingId,
        filename: 'private_ranges.json',
        content: JSON.stringify(privateRanges)
      });
      console.log('Private ranges saved successfully');
    } catch (error) {
      console.error('Failed to save private ranges:', error);
    }
  }

  // Function to delete a range
  async function deleteRange(range: { start: number; end: number; count: number }) {
    privateRanges = privateRanges.filter((r) => r.start !== range.start || r.end !== range.end);

    // Update processed data with new ranges
    if (sftJson) {
      processedSftData = processSftJsonWithPrivateRanges(sftJson, privateRanges);
    }

    // Save changes to disk
    await savePrivateRanges();
  }

  // Function to add a range around a message
  async function addRangeAroundMessage(message: SftMessage) {
    if (!processedSftData) return;

    // Create a combined array of messages only (no range markers)
    const messages = processedSftData.filter(
      (item) => item.role !== 'range_start' && item.role !== 'range_end'
    );

    // Sort by timestamp
    messages.sort((a, b) => a.timestamp - b.timestamp);

    // Find the current message index
    const currentIndex = messages.findIndex((item) => item.timestamp === message.timestamp);

    if (currentIndex === -1) return;

    // Calculate start and end timestamps
    let startTimestamp = 0; // Default to 0 if it's the first message
    let endTimestamp = message.timestamp + 1000; // Default to message time + 1 second buffer

    // If there's a previous message, set start time exactly halfway between previous and current
    if (currentIndex > 0) {
      const prevMessage = messages[currentIndex - 1];
      startTimestamp = Math.floor((prevMessage.timestamp + message.timestamp) / 2);
    }

    // If there's a next message, set end time exactly halfway between current and next
    if (currentIndex < messages.length - 1) {
      const nextMessage = messages[currentIndex + 1];
      endTimestamp = Math.floor((message.timestamp + nextMessage.timestamp) / 2);
    }

    // Add the new range
    privateRanges = [...privateRanges, { start: startTimestamp, end: endTimestamp, count: 1 }];

    // Update processed data with new ranges
    if (sftJson) {
      processedSftData = processSftJsonWithPrivateRanges(sftJson, privateRanges);
    }

    // Save changes to disk
    await savePrivateRanges();
  }

  // Function to move a range marker up or down
  async function moveRangeMarker(timestamp: number, isStart: boolean, direction: 'up' | 'down') {
    if (!processedSftData) return;

    // Create a combined array of messages only (no range markers)
    const messages = processedSftData.filter(
      (item) => item.role !== 'range_start' && item.role !== 'range_end'
    );

    // Sort by timestamp
    messages.sort((a, b) => a.timestamp - b.timestamp);

    // Find the range that contains this timestamp
    const rangeIndex = privateRanges.findIndex((range) =>
      isStart ? range.start === timestamp : range.end === timestamp
    );

    if (rangeIndex === -1) return;

    // Get the current timestamp
    const currentTimestamp = isStart
      ? privateRanges[rangeIndex].start
      : privateRanges[rangeIndex].end;

    // Find the appropriate message index based on the current timestamp
    let currentMessageIndex = -1;

    if (direction === 'up') {
      // For moving up, find the first message that has a timestamp <= current timestamp
      for (let i = messages.length - 1; i >= 0; i--) {
        if (messages[i].timestamp <= currentTimestamp) {
          currentMessageIndex = i;
          break;
        }
      }
    } else {
      // For moving down, find the first message that has a timestamp >= current timestamp
      for (let i = 0; i < messages.length; i++) {
        if (messages[i].timestamp >= currentTimestamp) {
          currentMessageIndex = i;
          break;
        }
      }
    }

    if (currentMessageIndex === -1) {
      // If no appropriate message found, use the first or last message
      currentMessageIndex = direction === 'up' ? messages.length - 1 : 0;
    }

    // Calculate the new timestamp
    let newTimestamp;

    // Special case: If moving up from the first message, set to 0
    if (direction === 'up' && currentMessageIndex === 0) {
      newTimestamp = 0;
    }
    // Special case: If moving down from the last message, set to last message timestamp + 1
    else if (direction === 'down' && currentMessageIndex === messages.length - 1) {
      newTimestamp = messages[currentMessageIndex].timestamp + 1;
    }
    // Normal case: Calculate average between messages
    else {
      let targetMessageIndex;

      if (direction === 'up') {
        targetMessageIndex = currentMessageIndex - 1;
        // Ensure target index is valid
        if (targetMessageIndex >= 0) {
          // Average between target (previous) and current message
          newTimestamp = Math.floor(
            (messages[targetMessageIndex].timestamp + messages[currentMessageIndex].timestamp) / 2
          );
        } else {
          // If we can't move up further, set to 0
          newTimestamp = 0;
        }
      } else {
        // direction === 'down'
        targetMessageIndex = currentMessageIndex + 1;
        // Ensure target index is valid
        if (targetMessageIndex < messages.length) {
          // Average between current and target (next) message
          newTimestamp = Math.floor(
            (messages[currentMessageIndex].timestamp + messages[targetMessageIndex].timestamp) / 2
          );
        } else {
          // If we can't move down further, set to last message + 1
          newTimestamp = messages[messages.length - 1].timestamp + 1;
        }
      }
    }

    // Update the range
    const updatedRanges = [...privateRanges];

    if (isStart) {
      updatedRanges[rangeIndex].start = newTimestamp;
    } else {
      updatedRanges[rangeIndex].end = newTimestamp;
    }

    // Force reactivity by creating a new array
    privateRanges = [...updatedRanges];

    // Update processed data with new ranges
    if (sftJson) {
      processedSftData = processSftJsonWithPrivateRanges(sftJson, privateRanges);
    }

    // Save changes to disk
    await savePrivateRanges();
  }
  let recording: ApiRecording | null = null;
  let processing = false;
  let checkingData = false;
  let uploading = false;
  let submission: SubmissionStatus | null = null;
  let submissionError: string | null = null;
  let showUploadConfirmModal = false;
  let exportingZip = false;
  let exportedZipPath: string | null = null;
  let exportZipError: string | null = null;

  // Function to export zip creation
  async function exportZipCreation() {
    if (!recordingId) return;

    try {
      exportingZip = true;
      exportedZipPath = null;
      exportZipError = null;

      // Create the zip file using the Rust backend
      exportedZipPath = await invoke<string>('export_recording_zip', { id: recordingId });
      if (!exportedZipPath) throw Error('No export location selected.');
      console.log('Export zip downloaded to:', exportedZipPath);
    } catch (error) {
      console.error('Failed to export zip creation:', error);
      exportZipError = error instanceof Error ? error.message : String(error);
    } finally {
      exportingZip = false;
    }
  }

  // Poll submission status
  let statusInterval: number | null = null;

  // Clean up interval on unmount
  onDestroy(() => {
    if (statusInterval) {
      clearInterval(statusInterval);
    }
  });

  // Track upload status from the uploadQueue store
  const uploadQueue = $uploadManager.queue;
  $: {
    const uploadStatus = $uploadQueue[recordingId || ''];
    uploading = uploadStatus?.status === 'uploading' || uploadStatus?.status === 'processing';

    if (uploadStatus?.status === 'failed' && uploadStatus.error) {
      submissionError = uploadStatus.error;
    } else if (uploadStatus?.status === 'completed') {
      submissionError = null;
    }
  }

  // Function to handle upload button click
  async function handleUploadClick() {
    if (recordingId) {
      const uploadStarted = await $uploadManager.handleUpload(
        recordingId,
        recording?.title || 'Unknown'
      );
      if (!uploadStarted) {
        // If upload didn't start, show confirmation modal
        showUploadConfirmModal = true;
      }
    }
  }

  // Type definition for SFT data
  type SftMessage = {
    role: string;
    content: any;
    timestamp: number;
  };

  let sftJson: SftMessage[] | null = null;
  let processedSftData: SftMessage[] | null = null;
  let combinedData: SftMessage[] = [];

  // Reactive statement to update combinedData whenever privateRanges or processedSftData changes
  $: {
    // Create a combined array of messages and range markers
    combinedData = processedSftData ? [...processedSftData] : [];

    // Add start markers
    privateRanges.forEach((range) => {
      combinedData.push({
        role: 'range_start',
        timestamp: range.start,
        content: { range }
      });
    });

    // Add end markers
    privateRanges.forEach((range) => {
      combinedData.push({
        role: 'range_end',
        timestamp: range.end,
        content: { range }
      });
    });

    // Sort by timestamp
    combinedData.sort((a, b) => a.timestamp - b.timestamp);
  }

  async function checkProcessedData() {
    checkingData = true;
    try {
      // Check for SFT data
      try {
        sftHtml = await invoke<string>('get_recording_file', {
          recordingId,
          filename: 'sft.html'
        });
      } catch (error) {
        sftHtml = null;
      }

      // Check for SFT JSON data
      try {
        const sftText = await invoke<string>('get_recording_file', {
          recordingId,
          filename: 'sft.json'
        });
        sftJson = JSON.parse(sftText);
        processedSftData = processSftJsonWithPrivateRanges(sftJson, privateRanges);
      } catch (error) {
        sftJson = null;
        processedSftData = null;
      }

      // Check for GRPO data
      try {
        grpoHtml = await invoke<string>('get_recording_file', {
          recordingId,
          filename: 'grpo.html'
        });
      } catch (error) {
        grpoHtml = null;
      }

      // Check for private ranges
      try {
        const privateRangesJson = await invoke<string>('get_recording_file', {
          recordingId,
          filename: 'private_ranges.json'
        });
        privateRanges = JSON.parse(privateRangesJson);

        // Update processed SFT data if we have both SFT data and private ranges
        if (sftJson) {
          processedSftData = processSftJsonWithPrivateRanges(sftJson, privateRanges);
        }
      } catch (error) {
        privateRanges = [];
      }
    } finally {
      checkingData = false;
    }
  }

  // Function to process SFT JSON data with private ranges
  function processSftJsonWithPrivateRanges(
    data: SftMessage[] | null,
    ranges: { start: number; end: number; count: number }[]
  ): SftMessage[] | null {
    if (!data) return data;

    // Create a copy of the data to avoid modifying the original
    const processedData = [...data];

    // First, reset all masked properties to ensure clean state
    processedData.forEach((message) => {
      delete (message as any).masked;
    });

    // If no ranges, return unmasked data
    if (!ranges.length) return processedData;

    // Add a 'masked' property to each message based on whether it falls within a private range
    processedData.forEach((message) => {
      const isInPrivateRange = ranges.some(
        (range) => message.timestamp >= range.start && message.timestamp <= range.end
      );

      if (isInPrivateRange) {
        // Add a masked property to the message
        (message as any).masked = true;
      }
    });

    return processedData;
  }

  // Function to process SFT HTML with private ranges (fallback)
  function processSftHtmlWithPrivateRanges(
    html: string,
    ranges: { start: number; end: number; count: number }[]
  ): string {
    if (!html || !ranges.length) return html;

    // Create a DOM parser to work with the HTML
    const parser = new DOMParser();
    const doc = parser.parseFromString(html, 'text/html');

    // Find all elements with timestamps
    const elements = doc.querySelectorAll('[data-timestamp]');

    // Apply masking to elements within private ranges
    elements.forEach((element) => {
      const timestamp = parseInt(element.getAttribute('data-timestamp') || '0', 10);

      // Check if this timestamp falls within any private range
      const isInPrivateRange = ranges.some(
        (range) => timestamp >= range.start && timestamp <= range.end
      );

      if (isInPrivateRange) {
        element.classList.add('masked-content');
      }
    });

    return doc.body.innerHTML;
  }

  async function handleProcess() {
    try {
      processing = true;
      await invoke('process_recording', { recordingId });
      // Check for processed data after pipeline completes
      await checkProcessedData();
    } catch (error) {
      console.error('Failed to process recording:', error);
    } finally {
      processing = false;
    }
  }

  let rawEvents: Array<{ time: number; event: string; data: any }> = [];
  let currentPage = 0;
  const itemsPerPage = 100;
  $: filteredEvents = rawEvents.filter((event) => enabledEventTypes.has(event.event));
  $: pagesWithEvents = Array.from(
    { length: Math.ceil(filteredEvents.length / itemsPerPage) },
    (_, i) => {
      const pageEvents = filteredEvents.slice(i * itemsPerPage, (i + 1) * itemsPerPage);
      return pageEvents.length > 0 ? i : -1;
    }
  ).filter((i) => i !== -1);

  $: {
    // Auto-advance to next page with events when current page is empty
    const currentPageEvents = filteredEvents.slice(
      currentPage * itemsPerPage,
      (currentPage + 1) * itemsPerPage
    );
    if (currentPageEvents.length === 0 && pagesWithEvents.length > 0) {
      const nextPage = pagesWithEvents.find((p) => p > currentPage);
      if (nextPage !== undefined) {
        currentPage = nextPage;
      } else {
        currentPage = pagesWithEvents[0]; // Wrap to first page with events
      }
    }
  }
  let sftHtml: string | null = null;
  let grpoHtml: string | null = null;
  let videoSrc: string | null = null;
  let videoElement: HTMLVideoElement | null = null;
  let startTimestamp: number | null = null;
  let eventTypes: Set<string> = new Set();
  let enabledEventTypes: Set<string> = new Set();
  let visibleAxTree: number | null = null;
  let timelineElement: HTMLElement | null = null;
  let progressPercentage = 0;
  let showScrubber = false;
  let scrubberPosition = 0;
  let isVideoOverMaskedRange = false;

  // Function to handle video time updates
  function handleTimeUpdate() {
    if (!videoElement) return;

    // Update progress percentage
    progressPercentage = (videoElement.currentTime / videoElement.duration) * 100;

    // Check if current time is within any masked range
    isVideoOverMaskedRange = privateRanges.some((range) => {
      const rangeStartTime = range.start / 1000; // Convert ms to seconds
      const rangeEndTime = range.end / 1000; // Convert ms to seconds
      return (
        (videoElement?.currentTime || 0) >= rangeStartTime &&
        (videoElement?.currentTime || 0) <= rangeEndTime
      );
    });
  }

  // Function to handle mouse movement over the timeline
  function handleTimelineHover(event: MouseEvent) {
    if (!timelineElement || !videoElement) return;

    showScrubber = true;

    // Calculate position as percentage
    const rect = timelineElement.getBoundingClientRect();
    const position = (event.clientX - rect.left) / rect.width;
    scrubberPosition = position * 100;
  }

  // Function to handle clicks on the timeline
  function handleTimelineClick(event: MouseEvent) {
    if (!timelineElement || !videoElement) return;

    // Calculate position as percentage
    const rect = timelineElement.getBoundingClientRect();
    const position = (event.clientX - rect.left) / rect.width;

    // Set video time
    videoElement.currentTime = position * videoElement.duration;
  }

  async function copyEventData(event: any) {
    await writeText(JSON.stringify(event, null, 2));
  }

  onMount(async () => {
    try {
      const recordings = await invoke<ApiRecording[]>('list_recordings');
      recording = recordings.find((r) => r.id === recordingId) || null;

      platform = await getPlatform();

      // Load video
      try {
        // videoSrc = await invoke<string>('get_recording_file', {
        //   recordingId,
        //   filename: 'recording.mp4',
        //   asBase64: true
        // });
        const temp = await invoke<string>('get_recording_file', {
          recordingId,
          filename: 'recording.mp4',
          asPath: true
        });
        videoSrc = temp;
      } catch (error) {
        console.error('Failed to load video:', error);
        //todo: handle this error when data isn't around
      }

      // Load raw events
      try {
        const text = await invoke<string>('get_recording_file', {
          recordingId,
          filename: 'input_log.jsonl'
        });
        const events = text
          .split('\n')
          .filter((line) => line.trim())
          .map((line) => {
            try {
              return JSON.parse(line);
            } catch {
              return null;
            }
          })
          .filter(
            (event): event is { time: number; event: string; data: any } =>
              event !== null && typeof event === 'object' && typeof event.time === 'number'
          );

        // Set start timestamp from first event
        if (events.length > 0) {
          startTimestamp = events[0].time;
          rawEvents = events;
          // Extract unique event types
          eventTypes = new Set(events.map((e) => e.event));
          enabledEventTypes = new Set(eventTypes);
        }
      } catch (error) {
        console.log('Raw events not available');
      }

      await checkProcessedData();

      // Load submissions if wallet connected
      if ($walletAddress) {
        submissions = await listSubmissions();
        submission = submissions.find((s) => s.meta?.id === recordingId) || null;
        $uploadManager.on('statusChange', recordingId || '*', async (_, item) => {
          if (item.status === 'completed') {
            submissions = await listSubmissions();
            submission = submissions.find((s) => s.meta?.id === recordingId) || null;
          }
        });
      }
    } catch (error) {
      console.error('Failed to load recording:', error);
    }
  });

  // Subscribe to wallet address changes
  walletAddress.subscribe((val) => {
    if (val !== $walletAddress && val) {
      listSubmissions().then((subs) => {
        submissions = subs;
        submission = submissions.find((s) => s.meta?.id === recordingId) || null;
      });
    }
  });

  function getLetterGrade(score: number): string {
    if (score >= 90) return 'A';
    if (score >= 80) return 'B';
    if (score >= 70) return 'C';
    if (score >= 60) return 'D';
    return 'F';
  }

  function getSolscanUrl(txHash: string): string {
    return `${import.meta.env.VITE_SOLSCAN_BASE_URL}/tx/${txHash}`;
  }

  function formatNumber(num: number): string {
    return num.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  }

  function formatJson(event: { time: number; event: string; data: any }) {
    return JSON.stringify(event, null, 2);
  }

  // Function to process assistant message content to remove ```python prefix
  function processAssistantMessage(content: string): string {
    if (typeof content !== 'string') return JSON.stringify(content, null, 2);

    // Replace ```python blocks with just ``` blocks
    return content.replace(/```python\n/g, '').replace(/\n```/g, '');
  }
</script>

<div class="h-full max-w-7xl mx-auto">
  <div>
    {#if recording}
      <div class="flex gap-3 xl:flex-row flex-col h-[calc(100vh-8rem)]">
        <!-- Video Section -->
        <!-- svelte-ignore a11y_click_events_have_key_events -->
        <div class="w-full flex flex-col">
          <Card padding="none" className="mb-0 bg-black!">
            <div class="relative w-full">
              <!-- svelte-ignore a11y_media_has_caption -->
              {#if videoSrc}
                <video
                  bind:this={videoElement}
                  controls
                  class="w-full h-full {isVideoOverMaskedRange ? 'blur-sm opacity-50' : ''}"
                  src={convertFileSrc(videoSrc)}
                  ontimeupdate={handleTimeUpdate}>
                  Your browser does not support the video tag.
                </video>
              {/if}
              {#if visibleAxTree !== null}
                {#each filteredEvents as event}
                  {#if event.time === visibleAxTree && event.event === 'axtree'}
                    <AxTreeOverlay
                      tree={event.data.tree}
                      {videoElement}
                      resolution={{
                        width: recording.primary_monitor.width,
                        height: recording.primary_monitor.height
                      }} />
                  {/if}
                {/each}
              {/if}
            </div>
          </Card>
          <!-- Timeline component -->
          <!-- svelte-ignore a11y_no_static_element_interactions -->
          <div
            class="relative w-full h-2 bg-gray-200 mt-2 cursor-pointer mb-6 rounded"
            bind:this={timelineElement}
            onmousemove={handleTimelineHover}
            onmouseleave={() => (showScrubber = false)}
            onclick={handleTimelineClick}>
            <!-- Progress bar -->
            <div
              class="absolute top-0 left-0 h-full bg-secondary-300 rounded"
              style="width: {progressPercentage}%">
            </div>

            <!-- Masked ranges -->
            {#each privateRanges as range}
              <div
                class="absolute top-0 h-full bg-black opacity-70 rounded"
                style="left: {(range.start / 1000 / (videoElement?.duration || 1)) * 100}%; 
                       width: {((range.end - range.start) / 1000 / (videoElement?.duration || 1)) *
                  100}%;">
                {#if videoElement}
                  <div
                    class="absolute top-0 right-1/2 transform translate-x-1/2 -translate-y-1/4 bg-black p-1 rounded">
                    <EyeOff class="w-3 h-3 text-white" />
                  </div>
                {/if}
              </div>
            {/each}

            <!-- Scrubber -->
            {#if showScrubber}
              <div
                class="absolute top-0 w-4 h-4 bg-white border-2 border-secondary-400 rounded-full -mt-1 -ml-2"
                style="left: {scrubberPosition}%">
              </div>
            {/if}
          </div>

          {#if submission?.grade_result}
            <Card padding="lg" className="mb-6">
              <div class="flex flex-col gap-4 h-full">
                <div class="flex items-center justify-between">
                  <div class="flex items-center gap-2">
                    <div class="text-xl font-semibold">Submission Result</div>
                    {#if submission?.clampedScore}
                      <div
                        class="text-lg font-medium"
                        class:text-red-500={submission.clampedScore < 50}
                        class:text-secondary-300={submission.clampedScore >= 50}>
                        ({getLetterGrade(submission.clampedScore)})
                      </div>
                    {:else if submission?.grade_result.score}
                      <div
                        class="text-lg font-medium"
                        class:text-red-500={submission.grade_result.score < 50}
                        class:text-secondary-300={submission.grade_result.score >= 50}>
                        ({getLetterGrade(submission.grade_result.score)})
                      </div>
                    {/if}
                  </div>
                  <div class="flex items-center gap-2">
                    {#if submission?.treasuryTransfer?.txHash}
                      <a
                        href={getSolscanUrl(submission.treasuryTransfer.txHash)}
                        target="_blank"
                        rel="noopener noreferrer"
                        class="text-gray-400 hover:text-secondary-300 transition-colors">
                        <Button variant="secondary" class="text-sm flex! items-center gap-1">
                          <ExternalLink class="w-3.5 h-3.5" />
                          Solscan
                        </Button>
                      </a>
                    {/if}
                    <Button
                      variant="secondary"
                      class="text-sm"
                      onclick={() => (showDetails = !showDetails)}>
                      {showDetails ? 'Hide Details' : 'Show Details'}
                    </Button>
                  </div>
                </div>
                <div class="flex flex-col gap-4 overflow-auto">
                  <div class="text-gray-500 italic">{submission.grade_result.reasoning}</div>

                  <div class="flex flex-wrap items-center gap-3 mt-4">
                    {#if submission?.maxReward}
                      <div class="bg-gray-100 rounded-lg px-3 py-2">
                        <div class="text-sm text-gray-500">Price per Demo</div>
                        <div class="text-secondary-300 font-medium">
                          {formatNumber(submission.maxReward)} VIRAL
                        </div>
                      </div>
                    {/if}
                    <Asterisk class="w-4 h-4 text-gray-400" />
                    {#if submission?.clampedScore}
                      <div class="bg-gray-100 rounded-lg px-3 py-2">
                        <div class="text-sm text-gray-500">Quality Score</div>
                        <div class="text-secondary-300 font-medium">{submission.clampedScore}%</div>
                      </div>
                    {:else if submission?.grade_result.score}
                      <div class="bg-gray-100 rounded-lg px-3 py-2">
                        <div class="text-sm text-gray-500">Quality Score</div>
                        <div class="text-secondary-300 font-medium">
                          {submission.grade_result.score}%
                        </div>
                      </div>
                    {:else}
                      <div class="bg-gray-100 rounded-lg px-3 py-2">
                        <div class="text-sm text-gray-500">Quality Score</div>
                        <div class="text-secondary-300 font-medium">0%</div>
                      </div>
                    {/if}

                    <Equal class="w-4 h-4 text-gray-400" />
                    {#if submission?.reward}
                      <div class="bg-gray-100 rounded-lg px-3 py-2">
                        <div class="text-sm text-gray-500">Earned</div>
                        <div class="text-secondary-300 font-medium">
                          {formatNumber(submission.reward)} VIRAL
                        </div>
                      </div>
                    {:else}
                      <div class="bg-gray-100 rounded-lg px-3 py-2">
                        <div class="text-sm text-gray-500">Earned</div>
                        <div class="text-secondary-300 font-medium">0 VIRAL</div>
                      </div>
                    {/if}
                  </div>
                  {#if showDetails}
                    <div class="text-gray-600 pr-2 mt-4">
                      {#if submission.treasuryTransfer?.txHash}
                        <div class="flex items-center gap-2 mb-4">
                          <span class="text-gray-500">TX:</span>
                          <span class="text-gray-400 font-mono text-xs">
                            {submission.treasuryTransfer.txHash}
                          </span>
                          <button
                            class="text-gray-400 hover:text-secondary-300 transition-colors"
                            onclick={() => {
                              const txHash = submission?.treasuryTransfer?.txHash;
                              if (txHash) navigator.clipboard.writeText(txHash);
                            }}>
                            <Copy class="w-3.5 h-3.5" />
                          </button>
                        </div>
                      {/if}
                      <div class="whitespace-pre-wrap">{submission.grade_result.summary}</div>
                    </div>
                  {/if}
                </div>
              </div>
            </Card>
          {:else}
            <Card padding="lg" className="mb-6">
              <div class="flex items-center gap-2">
                <div class="text-xl w-1/3 font-semibold">Submission Result</div>
                <div class="italic w-2/3 text-gray-500">
                  Get your submission grade and receive your $VIRAL by uploading this demonstration.
                </div>
              </div>
            </Card>
          {/if}

          <Card padding="lg">
            <div class="flex flex-col lg:flex-row lg:items-center justify-between gap-4">
              <div class="text-gray-700 min-w-0">
                <div class="font-medium truncate">{recording.title}</div>
                <div class="text-sm text-gray-500 grid grid-cols-2 gap-x-4 gap-y-1 mt-1">
                  <div>ID: {recording.id}</div>
                  <div>
                    Resolution: {recording.primary_monitor.width}x{recording.primary_monitor.height}
                  </div>
                  <div>OS: {recording.platform} {recording.version} ({recording.arch})</div>
                  <div>Locale: {recording.locale}</div>
                </div>
              </div>
              <div class="flex gap-2 shrink-0">
                <Button
                  variant="secondary"
                  onclick={() => invoke('open_recording_folder', { recordingId })}>
                  Open in {#if platform === 'windows'}
                    Explorer
                  {:else if platform === 'macos'}
                    Finder
                  {:else}
                    Files
                  {/if}
                </Button>
                {#if recording.status === 'completed'}
                  {#if !sftHtml}
                    <Button
                      variant="secondary"
                      onclick={handleProcess}
                      class="flex! items-center"
                      disabled={processing || checkingData}>
                      {#if processing}
                        <div
                          class="w-3.5 h-3.5 mr-1.5 border-2 border-t-transparent border-white rounded-full animate-spin">
                        </div>
                        Processing...
                      {:else if checkingData}
                        <div
                          class="w-3.5 h-3.5 mr-1.5 border-2 border-t-transparent border-white rounded-full animate-spin">
                        </div>
                        Checking...
                      {:else}
                        Process
                      {/if}
                    </Button>
                  {/if}
                  <Button
                    variant="secondary"
                    onclick={exportZipCreation}
                    class="flex! items-center"
                    disabled={exportingZip}>
                    {#if exportingZip}
                      <div
                        class="w-3.5 h-3.5 mr-1.5 border-2 border-t-transparent border-white rounded-full animate-spin">
                      </div>
                      Exporting...
                    {:else}
                      Export Zip
                    {/if}
                  </Button>
                  <Button
                    variant="primary"
                    onclick={handleUploadClick}
                    class="flex! items-center"
                    disabled={uploading ||
                      !$walletAddress ||
                      submission?.status === 'completed' ||
                      (submission && submission.status !== 'failed')}>
                    {#if uploading}
                      <div
                        class="w-3.5 h-3.5 mr-1.5 border-2 border-t-transparent border-white rounded-full animate-spin">
                      </div>
                      Uploading...
                    {:else if submission}
                      {#if submission.status === 'completed'}
                        ✓ Uploaded
                      {:else if submission.status === 'failed'}
                        Failed
                      {:else}
                        Processing...
                      {/if}
                    {:else}
                      Upload
                    {/if}
                  </Button>
                {/if}
              </div>
            </div>

            {#if submissionError}
              <p class="text-red-500 text-sm mt-2">Upload Error: {submissionError}</p>
            {/if}

            {#if exportedZipPath}
              <p class="text-green-500 text-sm mt-2">
                Zip successfully exported: {exportedZipPath}
              </p>
            {/if}

            {#if exportZipError}
              <p class="text-red-500 text-sm mt-2">Export Error: {exportZipError}</p>
            {/if}
          </Card>
        </div>

        <!-- Data Section -->
        <div class="w-full xl:w-1/2 xl:max-w-md">
          <Card padding="lg" className="h-full">
            <div class="flex flex-col gap-4 mb-4">
              <div class="flex gap-2">
                <Button
                  variant={selectedView === 'sft' ? 'primary' : 'secondary'}
                  onclick={() => (selectedView = 'sft')}
                  class="flex-1">
                  Editor
                </Button>
                <Button
                  variant={selectedView === 'raw' ? 'primary' : 'secondary'}
                  onclick={() => (selectedView = 'raw')}
                  class="flex-1">
                  Raw Events
                </Button>
                <!-- <Button
                  variant={selectedView === 'grpo' ? 'primary' : 'secondary'}
                  onclick={() => (selectedView = 'grpo')}
                  class="flex-1">
                  GRPO Data
                </Button> -->
              </div>

              {#if selectedView === 'raw'}
                <div class="flex flex-wrap gap-2">
                  {#each Array.from(eventTypes) as type}
                    <Button
                      variant="secondary"
                      class={`text-sm ${!enabledEventTypes.has(type) ? 'opacity-50' : ''} p-1! px-2!`}
                      onclick={() => {
                        if (enabledEventTypes.has(type)) {
                          enabledEventTypes.delete(type);
                        } else {
                          enabledEventTypes.add(type);
                        }
                        enabledEventTypes = enabledEventTypes; // Trigger reactivity
                      }}>
                      {type}
                    </Button>
                  {/each}
                </div>
              {/if}
            </div>

            <div class="h-full overflow-auto">
              {#if selectedView === 'raw'}
                <div class="flex flex-col">
                  {#each filteredEvents.slice(currentPage * itemsPerPage, (currentPage + 1) * itemsPerPage) as event, i}
                    <div
                      class={`flex gap-2 p-2 rounded ${i % 2 === 0 ? 'bg-gray-100' : 'bg-white'}`}>
                      <div class="flex flex-col gap-1 min-w-[82px] select-none">
                        <div class="flex items-center gap-1">
                          <EventTimestamp
                            timestamp={event.time}
                            startTime={startTimestamp || 0}
                            {videoElement} />
                        </div>
                        {#if event.event === 'axtree'}
                          <Button
                            variant="secondary"
                            class="text-sm p-0! px-1! w-full"
                            onclick={() =>
                              (visibleAxTree = visibleAxTree === event.time ? null : event.time)}>
                            {visibleAxTree === event.time ? 'Hide Tree' : 'Show Tree'}
                          </Button>
                        {/if}
                        <Button
                          variant="secondary"
                          class="text-sm p-0! px-1! w-full"
                          onclick={() => copyEventData(event)}>
                          Copy
                        </Button>
                      </div>
                      <div class="block break-all">
                        <JsonView json={event.data} depth={1} />
                      </div>
                    </div>
                  {/each}

                  {#if filteredEvents.length > 0}
                    <div
                      class="flex items-center justify-between mt-4 sticky bottom-0 bg-white p-2 w-full">
                      <Button
                        variant="secondary"
                        onclick={() => {
                          const prevPage = [...pagesWithEvents]
                            .reverse()
                            .find((p) => p < currentPage);
                          if (prevPage !== undefined) {
                            currentPage = prevPage;
                          } else {
                            currentPage = pagesWithEvents[pagesWithEvents.length - 1]; // Wrap to last page
                          }
                        }}
                        disabled={!pagesWithEvents.length ||
                          (pagesWithEvents.length === 1 && pagesWithEvents[0] === currentPage)}>
                        Previous
                      </Button>

                      <span class="text-sm text-gray-600">
                        Page {currentPage + 1} of {pagesWithEvents.length}
                      </span>

                      <Button
                        variant="secondary"
                        onclick={() => {
                          const nextPage = pagesWithEvents.find((p) => p > currentPage);
                          if (nextPage !== undefined) {
                            currentPage = nextPage;
                          } else {
                            currentPage = pagesWithEvents[0]; // Wrap to first page
                          }
                        }}
                        disabled={!pagesWithEvents.length ||
                          (pagesWithEvents.length === 1 && pagesWithEvents[0] === currentPage)}>
                        Next
                      </Button>
                    </div>
                  {/if}
                </div>
              {:else if selectedView === 'sft'}
                {#if processedSftData && processedSftData.length > 0}
                  <div class="relative">
                    {#if submission?.status === 'completed'}
                      <div
                        class="sticky top-0 bg-white py-2 mb-2 z-5 border-b border-red-200 text-sm text-red-500 font-medium">
                        <div>⚠️ Recording already submitted</div>
                        <div>New privacy masks will not be included</div>
                      </div>
                    {/if}
                    {#if privateRanges.length > 0}
                      <div
                        class="sticky top-0 bg-white py-2 mb-2 z-5 border-b border-gray-200 text-sm text-gray-500">
                        {privateRanges.length} masked {privateRanges.length === 1
                          ? 'range'
                          : 'ranges'} in this recording
                      </div>
                    {/if}

                    <div
                      class="relative before:content-[''] before:absolute before:top-0 before:left-0 before:right-0 before:h-10 before:bg-gradient-to-b before:opacity-50 before:from-white before:to-transparent before:pointer-events-none before:z-10">
                      <!-- Use the reactive combinedData array -->
                      {#each combinedData as item}
                        {#if item.role === 'range_start' || item.role === 'range_end'}
                          <div
                            class="flex items-center justify-between py-1 px-2 mb-1 bg-gray-100 rounded border border-gray-200">
                            <div class="flex items-center gap-3">
                              <EventTimestamp
                                timestamp={item.role === 'range_start'
                                  ? item.content.range.start
                                  : item.content.range.end}
                                startTime={0}
                                {videoElement} />
                              <div class="flex items-center gap-1">
                                <button
                                  class="text-gray-500 hover:text-red-500 transition-colors"
                                  onclick={() => deleteRange(item.content.range)}>
                                  <EyeOff class="w-4 h-4" />
                                </button>
                                <span class="text-xs text-gray-500">
                                  {item.role === 'range_start' ? 'Start' : 'End'}
                                </span>
                              </div>
                            </div>
                            <div class="flex items-center gap-2">
                              <div class="flex flex-col">
                                <button
                                  class="text-gray-400 hover:text-gray-600 transition-colors"
                                  onclick={() =>
                                    moveRangeMarker(
                                      item.role === 'range_start'
                                        ? item.content.range.start
                                        : item.content.range.end,
                                      item.role === 'range_start',
                                      'up'
                                    )}>
                                  <ChevronUp class="w-4 h-4" />
                                </button>
                                <button
                                  class="text-gray-400 hover:text-gray-600 transition-colors"
                                  onclick={() =>
                                    moveRangeMarker(
                                      item.role === 'range_start'
                                        ? item.content.range.start
                                        : item.content.range.end,
                                      item.role === 'range_start',
                                      'down'
                                    )}>
                                  <ChevronDown class="w-4 h-4" />
                                </button>
                              </div>
                              <button
                                class="text-gray-400 hover:text-red-500 transition-colors"
                                onclick={() => deleteRange(item.content.range)}>
                                <Trash2 class="w-4 h-4" />
                              </button>
                            </div>
                          </div>
                        {:else}
                          <div
                            class={`p-2 mb-2 rounded bg-gray-50 ${(item as any).masked ? 'opacity-50 line-through' : ''}`}>
                            <div class="mb-1 flex items-center justify-between">
                              <EventTimestamp
                                timestamp={item.timestamp}
                                startTime={0}
                                {videoElement} />
                              <button
                                class="text-gray-400 hover:text-gray-600 transition-colors"
                                title="Add privacy range around this message"
                                onclick={() => addRangeAroundMessage(item)}>
                                <Eye class="w-4 h-4" />
                              </button>
                            </div>
                            <div class="font-bold mb-1">{item.role}</div>
                            <div class="whitespace-pre-wrap break-words font-mono">
                              {#if typeof item.content === 'string'}
                                {#if item.content.startsWith('<img>') && item.content.endsWith('</img>')}
                                  <img
                                    src={`data:image/jpeg;base64,${item.content.slice(5, -6)}`}
                                    alt="Screenshot"
                                    class="max-w-full rounded mt-2" />
                                {:else if item.role === 'assistant'}
                                  {processAssistantMessage(item.content)}
                                {:else}
                                  {item.content}
                                {/if}
                              {:else if item.content?.type === 'image' && item.content?.data}
                                <img
                                  src={`data:image/jpeg;base64,${item.content.data}`}
                                  alt="Screenshot"
                                  class="max-w-full rounded mt-2" />
                              {:else}
                                {JSON.stringify(item.content, null, 2)}
                              {/if}
                            </div>
                          </div>
                        {/if}
                      {/each}
                    </div>
                  </div>
                {:else if sftHtml}
                  <div
                    class="relative before:content-[''] before:absolute before:top-0 before:left-0 before:right-0 before:h-10 before:bg-gradient-to-b before:from-white before:to-transparent before:pointer-events-none before:z-10">
                    <style>
                      .masked-content {
                        opacity: 0.5;
                        text-decoration: line-through;
                      }
                    </style>
                    {@html processSftHtmlWithPrivateRanges(sftHtml, privateRanges)}
                  </div>
                {:else}
                  <div class="text-center py-8 text-gray-500">
                    <p>Data not available.</p>
                    <p>Click the Process button to generate data.</p>
                    {#if processing}
                      <p class="mt-4">Processing... please wait.</p>
                    {/if}
                  </div>
                {/if}
              {:else if selectedView === 'grpo'}
                {#if grpoHtml}
                  {@html grpoHtml}
                {:else}
                  <div class="text-center py-8 text-gray-500">
                    <p>GRPO data not available.</p>
                    <p>Click the Process button to generate GRPO data.</p>
                    {#if processing}
                      <p class="mt-4">Processing... please wait.</p>
                    {/if}
                  </div>
                {/if}
              {/if}
            </div>
          </Card>
        </div>
      </div>
    {:else}
      <div class="text-center py-8 text-gray-500">Loading recording details...</div>
    {/if}
  </div>
</div>

<UploadConfirmModal bind:open={showUploadConfirmModal} uploader={handleUploadClick} />
