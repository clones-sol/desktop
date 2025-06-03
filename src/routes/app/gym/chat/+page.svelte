<script lang="ts">
  import { page } from '$app/state';
  import { onMount, onDestroy } from 'svelte';
  import { RecordingState, type Quest } from '$lib/types/gym';
  import { getReward, getSubmissionStatus } from '$lib/api/endpoints/forge';
  import { User, Upload, MousePointer, Trash2, RotateCcw } from 'lucide-svelte';
  import { emit, listen, type UnlistenFn } from '@tauri-apps/api/event';
  import { invoke } from '@tauri-apps/api/core';
  import Card from '$lib/components/Card.svelte';
  import Button from '$lib/components/form/Button.svelte';
  import tone from '$lib/assets/tone.wav';
  import blip from '$lib/assets/blip.wav';
  import pfp from '$lib/assets/V_pfp_v1.png';
  import QuestPanel from '$lib/components/gym/QuestPanel.svelte';
  import RecordingPanel from '$lib/components/gym/RecordingPanel.svelte';
  import UploadConfirmModal from '$lib/components/modals/UploadConfirmModal.svelte';
  import { API_URL, deleteRecording, toolsInitState } from '$lib/utils';
  import { uploadManager } from '$lib/stores/misc';
  import { recordingState } from '$lib/stores/recording';
  import { goto } from '$app/navigation';
  import { slide } from 'svelte/transition';
  import { startRecording, stopRecording } from '$lib/api/endpoints/gym';

  const prompt = page.url.searchParams.get('prompt') || '';
  const appParam = page.url.searchParams.get('app');
  const poolId = page.url.searchParams.get('poolId');
  let app: { type: 'executable' | 'website'; name: string; path?: string; url?: string } | null =
    null;

  try {
    if (appParam) {
      app = JSON.parse(decodeURIComponent(appParam));
      console.log('Parsed app parameter:', app);
    }
  } catch (error) {
    console.error('Failed to parse app parameter:', error);
  }

  // Quest state
  let currentQuest = $state<Quest | null>(null);
  let activeQuest = $state<Quest | null>(null);
  let recordingLoading = $state(false);
  let recordingProcessing = $state(false);
  let showUploadConfirmModal = $state(false);
  let currentRecordingId = $state<string | null>(null);
  let isUploading = $state(false);
  let loadingSftData = $state(false);

  type Message = {
    role: 'user' | 'assistant';
    content: string;
    timestamp?: number;
  };

  type SftMessage = {
    role: string;
    content: any;
    timestamp: number;
  };

  let message = $state('');
  let chatMessages = $state<Message[]>([]);
  let typingMessage = $state<{
    content: string;
    target: string;
    messageIndex: number;
  } | null>(null);
  let isWaitingForResponse = $state(false);
  let hoveredMessageIndex = $state<number | null>(null);
  let deletedRanges = $state<{ start: number; end: number; count: number }[]>([]);
  let originalSftData = $state<SftMessage[] | null>(null);
  // Initialize variables with default values
  let chatContent: HTMLElement | null = null;
  let toneAudio: HTMLAudioElement | null = null;
  let blipAudio: HTMLAudioElement | null = null;
  let unlistenState: UnlistenFn | null;

  const TYPE_START_DELAY = 300;

  function scrollToBottom() {
    if (chatContent) {
      chatContent.scrollTop = chatContent.scrollHeight;
    }
  }

  async function typeMessage(content: string, messageIndex: number, delay: boolean = true) {
    if (!content) return;
    if (delay) await new Promise((resolve) => setTimeout(resolve, TYPE_START_DELAY));

    const baseDelay = 1000 / 15 / 2; // 33.33ms per char
    const chunkSize = 2;

    for (let i = 0; i <= content.length; i += chunkSize) {
      typingMessage = {
        content: content.slice(0, i),
        target: content,
        messageIndex
      };

      const variation = baseDelay * (0.8 + Math.random() * 0.4);

      if (i % 4 === 0 || content[i - 1] === ' ') {
        if (toneAudio) {
          toneAudio.currentTime = 0;
          toneAudio.play().catch(() => {});
        }
      }

      scrollToBottom();
      if (delay) await new Promise((resolve) => setTimeout(resolve, variation));
    }
    typingMessage = null;
  }

  async function addMessage(
    msg: Message,
    options: { audio: boolean; delay: boolean } = { audio: true, delay: true }
  ) {
    const messageIndex = chatMessages.length;

    // Check if the message is an image
    const isText = !msg.content.startsWith('<');

    if (msg.role === 'assistant' && isText) {
      // Add empty message first
      chatMessages = [
        ...chatMessages,
        {
          ...msg,
          content: ''
        }
      ];
      scrollToBottom();

      // Then animate typing
      await typeMessage(msg.content, messageIndex, options.delay);

      // Finally update with full message
      chatMessages = chatMessages.map((m, i) => (i === messageIndex ? msg : m));
    } else {
      if (blipAudio && options.audio) {
        blipAudio.currentTime = 0;
        blipAudio.play().catch(() => {});
      }
      chatMessages = [...chatMessages, msg];
      scrollToBottom();
    }
  }

  async function loadSftData(recordingId: string): Promise<SftMessage[] | null> {
    try {
      loadingSftData = true;
      const sftText = await invoke<string>('get_recording_file', {
        recordingId,
        filename: 'sft.json'
      });
      const sftJson = JSON.parse(sftText);
      return sftJson;
    } catch (error) {
      console.error('Failed to load SFT data:', error);
      return null;
    } finally {
      loadingSftData = false;
    }
  }

  async function sendMessage(event: Event) {
    event.preventDefault();
    if (!message.trim()) return;

    const userMessage = {
      role: 'user' as const,
      content: message
    };

    await addMessage(userMessage);
    const currentMessage = message;
    message = '';

    isWaitingForResponse = true;
    try {
      const response = await fetch(`${API_URL}/api/v1/forge/chat`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          messages: [...chatMessages],
          task_prompt: prompt || 'anything keep it simple',
          app
        })
      });
      isWaitingForResponse = false;

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const assistantResponse = await response.json();
      await handleAssistantResponse(assistantResponse);
    } catch (error) {
      isWaitingForResponse = false;
      console.error('Failed to send message:', error);
      await addMessage({
        role: 'assistant',
        content: "I'm sorry, I encountered an error processing your message. Please try again."
      });
    }
  }

  // Helper functions
  function generateAssistantMessage(content: string): Message {
    return {
      role: 'assistant',
      content
    };
  }

  async function handleQuestData(questData: Record<string, any>) {
    try {
      // If there's content, show it as a message
      if (questData?.content) {
        await addMessage(generateAssistantMessage(questData.content));
      }

      // If there's valid quest data, show the popup
      if (
        questData?.title &&
        questData?.app &&
        questData?.icon_url &&
        Array.isArray(questData?.objectives) &&
        questData.objectives.length > 0
      ) {
        currentQuest = {
          title: questData.title,
          app: questData.app,
          icon_url: questData.icon_url,
          objectives: questData.objectives,
          content: questData.content || ''
        };

        // If poolId is provided, get reward info
        if (poolId) {
          try {
            // If app parameter contains task_id, use it when getting reward info
            const taskId =
              app && 'task_id' in app && typeof app.task_id === 'string' ? app.task_id : undefined;
            const rewardInfo = await getReward(poolId, taskId);
            currentQuest.pool_id = poolId;
            currentQuest.reward = {
              time: rewardInfo.time,
              max_reward: rewardInfo.maxReward
            };
          } catch (error) {
            await addMessage({
              role: 'assistant',
              content:
                'Failed to get task reward info.\nWARNING: This quest will not provide rewards.'
            });
            console.error('Failed to get reward info:', error);
          }
        }

        // If app parameter contains task_id, add it to the quest
        if (app && 'task_id' in app && typeof app.task_id === 'string') {
          console.log('Adding task_id to quest:', app.task_id);
          currentQuest.task_id = app.task_id;
        }

        await addMessage({
          role: 'user',
          content: 'Sure!'
        });
        // Set active quest
        activeQuest = currentQuest;
      }
    } catch (error) {
      console.error('Failed to handle quest data:', error);
      await addMessage(
        generateAssistantMessage(
          'I encountered an error processing the quest data. Please try again.'
        )
      );
    }
  }

  async function handleToolCall(toolCall: Record<string, any>) {
    try {
      switch (toolCall?.function?.name) {
        case 'generate_quest':
        case 'validate_task_request': {
          const questData = JSON.parse(toolCall.function.arguments);
          await handleQuestData(questData);
          break;
        }
        // Add more tool call handlers here as needed
        default: {
          console.warn('Unknown tool call:', toolCall?.function?.name);
          break;
        }
      }
    } catch (error) {
      console.error('Failed to handle tool call:', error);
      await addMessage(
        generateAssistantMessage(
          'I encountered an error processing the tool call. Please try again.'
        )
      );
    }
  }

  async function startRecordingHandler(fps: number) {
    try {
      recordingLoading = true;
      if ($recordingState === RecordingState.off) {
        await startRecording(activeQuest!, fps).catch(console.error);
        await emit('quest-overlay', { quest: activeQuest! });
        recordingState.set(RecordingState.recording);
      }
      recordingLoading = false;
    } catch (error) {
      console.error('Recording error:', error);
      recordingLoading = false;
    }
  }

  async function removeMessage() {
    // Remove the last message from the chatMessages array
    if (chatMessages.length > 0) {
      chatMessages = chatMessages.slice(0, -1);
      scrollToBottom();
    }
  }

  // Function to save deleted ranges to a JSON file
  async function savePrivateRanges() {
    if (!currentRecordingId) return;

    try {
      // Convert deletedRanges to JSON string
      const rangesJson = JSON.stringify(deletedRanges, null, 2);

      // Use invoke to save the file to the recording folder
      await invoke('write_recording_file', {
        recordingId: currentRecordingId,
        filename: 'private_ranges.json',
        content: rangesJson
      });

      console.log('Saved private ranges to file');
    } catch (error) {
      console.error('Failed to save private ranges:', error);
    }
  }

  function handleDeleteMessage(index: number, msg: Message) {
    if (msg.timestamp === undefined || !originalSftData) return;

    // Find previous and next messages in originalSftData
    const sortedMessages = [...originalSftData]
      .sort((a, b) => a.timestamp - b.timestamp)
      .filter((msg) => msg.role === 'assistant');
    const currentIndex = sortedMessages.findIndex((m) => m.timestamp === msg.timestamp);

    let start_timestamp: number;
    let end_timestamp: number;

    // Calculate start timestamp by averaging with previous message if available
    if (currentIndex > 0) {
      const prevMsg = sortedMessages[currentIndex - 1];
      start_timestamp = (prevMsg.timestamp + msg.timestamp) / 2;
    } else {
      // No previous message, use fallback
      start_timestamp = msg.timestamp - 5000;
    }

    // Calculate end timestamp by averaging with next message if available
    if (currentIndex < sortedMessages.length - 1) {
      const nextMsg = sortedMessages[currentIndex + 1];
      end_timestamp = (msg.timestamp + nextMsg.timestamp) / 2;
    } else {
      // No next message, use fallback
      end_timestamp = msg.timestamp + 5000;
    }

    const count = originalSftData.filter(
      (m) => m.timestamp >= start_timestamp && m.timestamp <= end_timestamp
    ).length;
    deletedRanges = [
      ...deletedRanges,
      {
        start: start_timestamp,
        end: end_timestamp,
        count
      }
    ];

    // Save the updated ranges to file
    savePrivateRanges();

    chatMessages = [
      ...chatMessages.slice(0, index),
      {
        role: 'user',
        content: `<delete>${start_timestamp} ${end_timestamp} ${count}</delete>`
      },
      ...chatMessages.slice(index + 1)
    ];
  }

  function handleUndoDelete(clickedMessageIndex?: number) {
    // Parse the start, end, and count from the delete message
    if (clickedMessageIndex !== undefined && originalSftData) {
      const deleteMsg = chatMessages[clickedMessageIndex];
      if (
        deleteMsg &&
        deleteMsg.content.startsWith('<delete>') &&
        deleteMsg.content.endsWith('</delete>')
      ) {
        // Extract values from <delete>start end count</delete>
        const content = deleteMsg.content.slice(8, -9); // Remove the <delete> and </delete> tags
        const [start, end, count] = content.split(' ').map(Number);

        // Remove the range from deletedRanges
        deletedRanges = deletedRanges.filter((r) => r.start !== start);

        // Save the updated ranges to file
        savePrivateRanges();

        // Find messages in originalSftData that fall within this time range
        const messagesToRestore = originalSftData.filter(
          (msg) => msg.timestamp >= start && msg.timestamp <= end
        );

        // Create new messages to insert
        const newMessages: Message[] = [];

        for (const msg of messagesToRestore) {
          if (
            msg.role === 'user' &&
            typeof msg.content === 'object' &&
            msg.content?.type === 'image'
          ) {
            // VM sends the desktop screenshot
            newMessages.push({
              role: 'assistant',
              content: `<img>${msg.content.data}</img>`,
              timestamp: msg.timestamp
            });
          } else if (msg.role === 'assistant') {
            // Extract code block content when applicable
            let content = msg.content;
            if (typeof content === 'string' && content.includes('```python')) {
              const match = content.match(/```python\s*\n(.*?)\n```/s);
              if (match && match[1]) {
                content = `<action>${match[1].trim()}</action>`;
              }
            } else if (typeof content !== 'string') {
              content = JSON.stringify(content);
            }

            // User sends the action
            newMessages.push({
              role: 'user',
              content: content,
              timestamp: msg.timestamp
            });
          }
        }

        // Replace the delete message with the restored messages
        chatMessages = [
          ...chatMessages.slice(0, clickedMessageIndex),
          ...newMessages,
          ...chatMessages.slice(clickedMessageIndex + 1)
        ];
      }
    }

    scrollToBottom();
  }

  async function handleRecordingComplete() {
    if (recordingLoading || recordingProcessing) return;
    recordingLoading = true;
    recordingProcessing = true;
    activeQuest = null;
    await addMessage({
      role: 'user',
      content: `<loading>Saving recording...</loading>`
    });
    await emit('quest-overlay', { quest: null });
    recordingLoading = false;
    if ($recordingState === RecordingState.recording) {
      const recordingId = await stopRecording('done').catch((error) => {
        console.error(error);
        return null;
      });
      currentRecordingId = recordingId;
      $recordingState = RecordingState.off;
    }

    // remove saving message
    await removeMessage();

    // Try to load SFT data
    if (currentRecordingId) {
      // show replaying status
      await addMessage({
        role: 'user',
        content: `<loading>Replaying recording...</loading>`
      });

      // process the recording after stopping
      try {
        await invoke('process_recording', { recordingId: currentRecordingId });
        console.log('Recording processed:', currentRecordingId);
      } catch (processError) {
        console.error('Failed to automatically process recording:', processError);
      }
      const sftData = await loadSftData(currentRecordingId);
      await removeMessage();
      if (sftData?.length) {
        // Store original SFT data for filtering
        originalSftData = [...sftData];

        // Add styled start replay message
        await addMessage(
          {
            role: 'assistant',
            content: '<start>--- demonstration replay ---</start>'
          },
          { audio: false, delay: false }
        );

        // Process SFT messages properly alternating between VM (assistant) and user
        for (const msg of sftData) {
          if (
            msg.role === 'user' &&
            typeof msg.content === 'object' &&
            msg.content?.type === 'image'
          ) {
            // VM sends the desktop screenshot
            await addMessage(
              {
                role: 'assistant',
                content: `<img>${msg.content.data}</img>`,
                timestamp: msg.timestamp
              },
              { audio: false, delay: false }
            );

            // Add a small delay between images for better pacing
            // await new Promise((resolve) => setTimeout(resolve, 800));
          } else if (msg.role === 'assistant') {
            // Extract code block content when applicable
            let content = msg.content;
            if (typeof content === 'string' && content.includes('```python')) {
              const match = content.match(/```python\s*\n(.*?)\n```/s);
              if (match && match[1]) {
                content = `<action>${match[1].trim()}</action>`;
              }
            } else if (typeof content !== 'string') {
              content = JSON.stringify(content);
            }

            // User sends the action (ignore scroll)
            await addMessage(
              {
                role: 'user',
                content: content,
                timestamp: msg.timestamp
              },
              { audio: false, delay: false }
            );
          }
        }

        // Add end replay message
        await addMessage(
          {
            role: 'assistant',
            content: '<end>--- end of replay ---</end>'
          },
          { audio: true, delay: false }
        );

        // Finish with completion message
        await addMessage({
          role: 'user',
          content: 'I completed the task! 🎉'
        });

        await addMessage({
          role: 'assistant',
          content: 'Great job completing the task!'
        });
      } else {
        // Fallback if no SFT data
        await addMessage({
          role: 'user',
          content: `<recording>${currentRecordingId}</recording>`
        });

        await addMessage({
          role: 'user',
          content: 'I completed the task! 🎉'
        });

        await addMessage({
          role: 'assistant',
          content: 'Great job completing the task!'
        });
      }
    }

    await addMessage({
      role: 'assistant',
      content:
        "Review your demonstration before uploading. You can hover over messages to delete any sections containing sensitive information. Once you're ready, upload to get scored or do it later from the history page."
    });

    // Add upload button message
    await addMessage(
      {
        role: 'assistant',
        content: `<upload-button></upload-button>`
      },
      { audio: true, delay: false }
    );

    recordingProcessing = false;
  }

  // Function to handle upload button click
  async function handleUploadClick() {
    if (currentRecordingId && !isUploading) {
      isUploading = true;

      try {
        const uploadStarted = await $uploadManager.handleUpload(
          currentRecordingId,
          currentQuest?.title || activeQuest?.title || 'Unknown'
        );

        if (!uploadStarted) {
          // If upload didn't start, show confirmation modal
          showUploadConfirmModal = true;
          isUploading = false;
          return;
        }

        // Upload started successfully
        await addMessage({
          role: 'assistant',
          content:
            'Your demonstration is being processed. This may take a while. Feel free to complete more tasks or come back later when it is done processing!'
        });

        // Set up a one-time event listener for this specific recording ID
        const unsubscribe = $uploadManager.on('queueUpdate', currentRecordingId, (_, status) => {
          if (status.status === 'completed') {
            if (unsubscribe) unsubscribe(); // Remove the listener once we're done

            // Add success messages
            chatMessages = [
              ...chatMessages,
              {
                role: 'assistant',
                content: 'Your demonstration was successfully uploaded!'
              }
            ];

            // If we have a submission ID, try to get more details
            if (status.submissionId) {
              getSubmissionStatus(status.submissionId)
                .then((submissionDetails) => {
                  chatMessages = [
                    ...chatMessages,
                    {
                      role: 'assistant',
                      content: `You scored ${submissionDetails.clampedScore}% on this task.`
                    }
                  ];

                  // Add feedback if available
                  if (submissionDetails.grade_result) {
                    chatMessages = [
                      ...chatMessages,
                      {
                        role: 'assistant',
                        content: `Feedback:\n${submissionDetails.grade_result.summary}`
                      }
                    ];
                  }

                  // Ensure scroll to bottom
                  setTimeout(scrollToBottom, 100);
                })
                .catch((error) => {
                  console.error('Failed to get submission details:', error);
                });
            }

            // Reset uploading state
            isUploading = false;
          } else if (status.status === 'failed') {
            if (unsubscribe) unsubscribe(); // Remove the listener once we're done

            // Add error message
            addMessage({
              role: 'assistant',
              content: `There was an error processing your demonstration: ${status.error || 'Unknown error'}`
            });

            // Reset uploading state
            isUploading = false;
          }
        });
      } catch (error) {
        console.error('Error in upload process:', error);
        await addMessage({
          role: 'assistant',
          content: `There was an error starting the upload: ${error instanceof Error ? error.message : 'Unknown error'}`
        });
        isUploading = false;
      }
    }
  }

  async function handleGiveUp() {
    if ($recordingState === RecordingState.recording) {
      activeQuest = null;
      const recordingId = await stopRecording('fail').catch((error) => {
        console.error(error);
        return null;
      });
      $recordingState = RecordingState.off;
      await emit('quest-overlay', { quest: null });

      await addMessage({
        role: 'user',
        content: `<recording>${recordingId}</recording>`
      });
      await addMessage({
        role: 'user',
        content: 'I give up on this task.'
      });
      await addMessage({
        role: 'assistant',
        content:
          "That's okay! Not every task is for everyone. Let me know if you'd like to try something else."
      });
    }
  }

  async function handleAssistantResponse(response: Record<string, any>) {
    try {
      const message = response?.data;
      const toolCall = message.tool_calls?.[0];
      if (toolCall) {
        await handleToolCall(toolCall);
      } else if (message?.role === 'assistant' && typeof message?.content === 'string') {
        await addMessage({
          role: message.role,
          content: message.content
        });
      }
    } catch (error) {
      console.error('Failed to handle assistant response:', error);
      await addMessage(
        generateAssistantMessage(
          'I encountered an error processing the response. Please try again.'
        )
      );
    }
  }

  async function getInitialMessage() {
    isWaitingForResponse = true;
    try {
      const response = await fetch(`${API_URL}/api/v1/forge/chat`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          messages: [],
          task_prompt: prompt || 'anything keep it simple',
          app
        })
      });
      isWaitingForResponse = false;

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const assistantResponse = await response.json();
      await handleAssistantResponse(assistantResponse);
    } catch (error) {
      isWaitingForResponse = false;
      console.error('Failed to get initial message:', error);
      await addMessage({
        role: 'assistant',
        content: "I'm sorry, I encountered an error starting our conversation. Please try again."
      });
    }
  }

  onMount(async () => {
    try {
      // Initialize audio instances
      toneAudio = new Audio(tone);
      toneAudio.volume = 0.15;
      blipAudio = new Audio(blip);
      blipAudio.volume = 0.15;

      // Get initial message
      await getInitialMessage();
      // wait for a recording save event
      unlistenState = await listen<{ state: RecordingState; id?: string }>(
        'recording-status',
        (event) => {
          if (event.payload.state === RecordingState.saved) {
            console.log('recording saved:', event.payload.id);
            currentRecordingId = event.payload.id || currentRecordingId;
            handleRecordingComplete();
          }
        }
      );
    } catch (error) {
      console.error('Failed to initialize:', error);
    }
  });

  onDestroy(() => {
    try {
      // Clean up audio instances
      if (toneAudio) {
        toneAudio.pause();
        toneAudio.src = '';
        toneAudio.remove();
      }
      if (blipAudio) {
        blipAudio.pause();
        blipAudio.src = '';
        blipAudio.remove();
      }
      unlistenState?.();
    } catch (error) {
      console.error('Failed to cleanup:', error);
    }
  });

  async function handleDeleteRecording() {
    if (currentRecordingId) {
      if ((await deleteRecording(currentRecordingId))?.length > 0) goto('/app/gym');
    }
  }

  function handleHover(index: number) {
    hoveredMessageIndex = index;
  }

  function handleHoverEnd() {
    hoveredMessageIndex = null;
  }
</script>

<div class="flex flex-col pb-[65px] h-full">
  {#if $toolsInitState.initializing}
    <div
      transition:slide
      class="p-3 max-w-7xl mx-auto mb-5 border-yellow-500 border-1 rounded-lg shadow-md bg-yellow-500/30">
      <p class="text-lg font-bold text-yellow-900 border-b border-yellow-800 w-fit">WARNING</p>
      <p class="text-black mt-1">
        If the required tools are not installed correctly when recording a demonstration, your
        recording may be corrupted and the application may crash.
      </p>
    </div>
  {/if}
  <div
    bind:this={chatContent}
    class="flex-1 max-w-7xl w-full mx-auto px-6 pb-6 space-y-3 overflow-y-auto chat-content">
    {#if true}
      {@const demoStartIndex = chatMessages.findIndex(
        (m) => m.content.startsWith('<start>') && m.content.endsWith('</start>')
      )}
      {@const demoEndIndex = chatMessages.findIndex(
        (m) => m.content.startsWith('<end>') && m.content.endsWith('</end>')
      )}
      {@const inDemoSection =
        demoStartIndex !== -1 && demoEndIndex !== -1 && demoEndIndex > demoStartIndex}
      <!-- Render messages before demo section normally -->
      {#each chatMessages.slice(0, inDemoSection ? demoStartIndex + 1 : chatMessages.length) as msg, i}
        <div
          class="flex gap-2 transition-all duration-200 relative group {msg.role === 'user'
            ? 'justify-end'
            : ''}"
          onmouseenter={() => handleHover(i)}
          onmouseleave={handleHoverEnd}
          role="listitem">
          <!-- Delete overlay for the entire message -->
          {#if hoveredMessageIndex === i && msg.timestamp !== undefined && !msg.content.startsWith('<delete>')}
            <button
              class="absolute inset-0 flex items-center justify-center bg-black/5 z-10 rounded transition-opacity duration-300 cursor-pointer"
              style="opacity: {hoveredMessageIndex === i ? '1' : '0'}"
              onclick={() => handleDeleteMessage(i, msg)}>
              <div
                class="bg-red-500 hover:bg-red-600 text-white rounded-full p-3 shadow-lg transition-all duration-200 transform hover:scale-110">
                <Trash2 size={24} />
              </div>
            </button>
          {/if}

          {#if msg.content.startsWith('<start>') && msg.content.endsWith('</start>')}
            <!-- Special full-width centered message for start tag -->
            <div class="w-full text-center text-neutral-500 opacity-50 py-2">
              {msg.content.slice(7, -8)}
            </div>
          {:else if msg.content.startsWith('<end>') && msg.content.endsWith('</end>')}
            <!-- Special full-width centered message for end tag -->
            <div class="w-full text-center text-neutral-500 opacity-50 py-2">
              {msg.content.slice(5, -6)}
            </div>
          {:else if msg.content.startsWith('<delete>') && msg.content.includes('</delete>')}
            <!-- Special full-width centered message for delete tag -->
            <div
              onclick={() => handleUndoDelete(i)}
              onkeydown={() => {}}
              role="button"
              tabindex="0"
              class="w-full text-center text-neutral-500 opacity-50 py-2 cursor-pointer hover:opacity-80">
              <div class="flex items-center justify-center gap-2">
                <RotateCcw size={16} />
                <span>{msg.content.replace(/<delete>.*?<\/delete>/, '')}</span>
              </div>
            </div>
          {:else if msg.role === 'user'}
            {#if msg.content.startsWith('<recording>') && msg.content.endsWith('</recording>')}
              <RecordingPanel recordingId={msg.content.slice(11, -12)} />
            {:else if msg.content.startsWith('<loading>') && msg.content.endsWith('</loading>')}
              <Card
                variant="primary"
                padding="sm"
                className="w-auto! flex! flex-row! gap-2 max-w-2xl shadow-sm bg-secondary-300 text-white">
                <div
                  class="h-5 w-5 rounded-full border-2 border-white border-t-transparent! animate-spin">
                </div>
                {msg.content.slice(9, -10)}
              </Card>
            {:else if msg.content.startsWith('<delete>') && msg.content.includes('</delete>')}
              <div
                onclick={() => handleUndoDelete(i)}
                onkeydown={() => {}}
                role="button"
                tabindex="0"
                class="cursor-pointer hover:opacity-90 w-full">
                <Card
                  variant="primary"
                  padding="sm"
                  className="w-auto! flex! flex-row! items-center gap-3 max-w-2xl shadow-sm bg-neutral-600 text-white hover:bg-neutral-700">
                  <RotateCcw size={16} />
                  <div class="whitespace-pre-wrap tracking-wide">
                    {msg.content.replace(/<delete>.*?<\/delete>/, '')}
                  </div>
                </Card>
              </div>
            {:else if msg.content.startsWith('<img>') && msg.content.endsWith('</img>')}
              <Card
                variant="secondary"
                padding="none"
                className="w-auto! max-w-lg shadow-sm overflow-hidden {hoveredMessageIndex === i
                  ? 'opacity-60'
                  : 'opacity-100'} transition-opacity duration-300">
                <img
                  src={`data:image/jpeg;base64,${msg.content.slice(5, -6)}`}
                  alt="Screenshot"
                  class="w-full h-auto" />
              </Card>
            {:else if msg.content.startsWith('<action>') && msg.content.endsWith('</action>')}
              <Card
                variant="primary"
                padding="sm"
                className="w-auto! max-w-2xl shadow-sm bg-secondary-300 text-white {hoveredMessageIndex ===
                i
                  ? 'opacity-60'
                  : 'opacity-100'} transition-opacity duration-300">
                <div class="flex items-center gap-2">
                  <MousePointer size={16} />
                  <pre class="font-mono text-sm whitespace-pre-wrap">{msg.content.slice(
                      8,
                      -9
                    )}</pre>
                </div>
              </Card>
            {:else}
              <Card
                variant="primary"
                padding="sm"
                className="w-auto! max-w-2xl shadow-sm bg-secondary-300 text-white {hoveredMessageIndex ===
                  i && msg.timestamp !== undefined
                  ? 'opacity-50'
                  : 'opacity-100'} transition-opacity duration-300">
                <div class="whitespace-pre-wrap tracking-wide font-medium">
                  {msg.content}
                </div>
              </Card>
            {/if}
            <div
              class="shrink-0 w-8 h-8 rounded-full bg-secondary-100 text-white flex items-center justify-center shadow-md">
              <User size={18} />
            </div>
          {:else}
            <div class="shrink-0 w-8 h-8 rounded bg-secondary-300 overflow-hidden shadow-md">
              <img src={pfp} alt="V" class="w-full h-full object-cover" />
            </div>
            {#if msg.content.startsWith('<recording>') && msg.content.endsWith('</recording>')}
              <RecordingPanel recordingId={msg.content.slice(11, -12)} />
            {:else if msg.content === '<upload-button></upload-button>'}
              <Card
                variant="secondary"
                padding="sm"
                className="w-auto! shadow-sm space-y-4 relative bg-black/5">
                <div class="flex flex-col items-start gap-2">
                  <div class="text-sm font-medium mb-1">Ready to submit your demonstration?</div>
                  <Button
                    variant="primary"
                    onclick={handleUploadClick}
                    disabled={isUploading}
                    class="flex! items-center gap-1 w-full justify-center">
                    {#if isUploading}
                      Uploading...
                    {:else}
                      <Upload size={16} />
                      Upload Demonstration {deletedRanges.length > 0
                        ? `with ${deletedRanges.length} edit${deletedRanges.length === 1 ? '' : 's'}`
                        : ''}
                    {/if}
                  </Button>
                  <p class="text-sm w-full text-center text-gray-500">
                    Get scored and earn $VIRAL tokens
                  </p>
                  <button
                    onclick={handleDeleteRecording}
                    class="text-sm w-full text-center text-gray-500 hover:text-red-500 hover:underline">
                    Don't like your recording? Click to delete it.
                  </button>
                </div>
              </Card>
            {:else if msg.content.startsWith('<img>') && msg.content.endsWith('</img>')}
              <Card
                variant="secondary"
                padding="none"
                className="w-auto! max-w-lg shadow-sm overflow-hidden">
                <img
                  src={`data:image/jpeg;base64,${msg.content.slice(5, -6)}`}
                  alt="Screenshot"
                  class="w-full h-auto" />
              </Card>
            {:else}
              <Card
                variant="secondary"
                padding="sm"
                className="w-auto! shadow-sm space-y-4 relative bg-black/5">
                <div class="whitespace-pre-wrap break-words">
                  {#if typingMessage && typingMessage.messageIndex === i}
                    {typingMessage.content}
                    <span class="animate-pulse">▋</span>
                  {:else}
                    {msg.content}
                  {/if}
                </div>
              </Card>
            {/if}
          {/if}
        </div>
      {/each}

      <!-- Render demo section in a scrollable container -->
      {#if inDemoSection}
        <div class="w-full border border-gray-200 rounded-lg bg-black/5 mb-3">
          <div class="max-h-[50vh] overflow-y-auto p-3 space-y-3">
            {#each chatMessages.slice(demoStartIndex + 1, demoEndIndex) as msg, i (demoStartIndex + 1 + i)}
              <div
                class="flex gap-2 transition-all duration-200 relative group {msg.role === 'user'
                  ? 'justify-end'
                  : ''}"
                onmouseenter={() => handleHover(demoStartIndex + 1 + i)}
                onmouseleave={handleHoverEnd}
                role="listitem">
                <!-- Delete overlay for the entire message -->
                {#if hoveredMessageIndex === demoStartIndex + 1 + i && msg.timestamp !== undefined && !msg.content.startsWith('<delete>')}
                  <button
                    class="absolute inset-0 flex items-center justify-center bg-black/5 z-10 rounded transition-opacity duration-300 cursor-pointer"
                    style="opacity: {hoveredMessageIndex === demoStartIndex + 1 + i ? '1' : '0'}"
                    onclick={() => handleDeleteMessage(demoStartIndex + 1 + i, msg)}>
                    <div
                      class="bg-red-500 hover:bg-red-600 text-white rounded-full p-3 shadow-lg transition-all duration-200 transform hover:scale-110">
                      <Trash2 size={24} />
                    </div>
                  </button>
                {/if}

                {#if msg.content.startsWith('<delete>') && msg.content.includes('</delete>')}
                  <!-- Special full-width centered message for delete tag -->
                  <div
                    onclick={() => handleUndoDelete(demoStartIndex + 1 + i)}
                    onkeydown={() => {}}
                    role="button"
                    tabindex="0"
                    class="w-full text-center text-neutral-500 opacity-50 py-2 cursor-pointer hover:opacity-80">
                    <div class="flex items-center justify-center gap-2">
                      <RotateCcw size={16} />
                      <span>{msg.content.replace(/<delete>.*?<\/delete>/, '')}</span>
                    </div>
                  </div>
                {:else if msg.role === 'user'}
                  {#if msg.content.startsWith('<recording>') && msg.content.endsWith('</recording>')}
                    <RecordingPanel recordingId={msg.content.slice(11, -12)} />
                  {:else if msg.content.startsWith('<loading>') && msg.content.endsWith('</loading>')}
                    <Card
                      variant="primary"
                      padding="sm"
                      className="w-auto! flex! flex-row! gap-2 max-w-2xl shadow-sm bg-secondary-300 text-white">
                      <div
                        class="h-5 w-5 rounded-full border-2 border-white border-t-transparent! animate-spin">
                      </div>
                      {msg.content.slice(9, -10)}
                    </Card>
                  {:else if msg.content.startsWith('<delete>') && msg.content.includes('</delete>')}
                    <div
                      onclick={() => handleUndoDelete(demoStartIndex + 1 + i)}
                      onkeydown={() => {}}
                      role="button"
                      tabindex="0"
                      class="cursor-pointer hover:opacity-90 w-full">
                      <Card
                        variant="primary"
                        padding="sm"
                        className="w-auto! flex! flex-row! items-center gap-3 max-w-2xl shadow-sm bg-neutral-600 text-white hover:bg-neutral-700">
                        <RotateCcw size={16} />
                        <div class="whitespace-pre-wrap tracking-wide">
                          {msg.content.replace(/<delete>.*?<\/delete>/, '')}
                        </div>
                      </Card>
                    </div>
                  {:else if msg.content.startsWith('<img>') && msg.content.endsWith('</img>')}
                    <Card
                      variant="secondary"
                      padding="none"
                      className="w-auto! max-w-lg shadow-sm overflow-hidden {hoveredMessageIndex ===
                      demoStartIndex + 1 + i
                        ? 'opacity-60'
                        : 'opacity-100'} transition-opacity duration-300">
                      <img
                        src={`data:image/jpeg;base64,${msg.content.slice(5, -6)}`}
                        alt="Screenshot"
                        class="w-full h-auto" />
                    </Card>
                  {:else if msg.content.startsWith('<action>') && msg.content.endsWith('</action>')}
                    <Card
                      variant="primary"
                      padding="sm"
                      className="w-auto! max-w-2xl shadow-sm bg-secondary-300 text-white {hoveredMessageIndex ===
                      demoStartIndex + 1 + i
                        ? 'opacity-60'
                        : 'opacity-100'} transition-opacity duration-300">
                      <div class="flex items-center gap-2">
                        <MousePointer size={16} />
                        <pre class="font-mono text-sm whitespace-pre-wrap">{msg.content.slice(
                            8,
                            -9
                          )}</pre>
                      </div>
                    </Card>
                  {:else}
                    <Card
                      variant="primary"
                      padding="sm"
                      className="w-auto! max-w-2xl shadow-sm bg-secondary-300 text-white {hoveredMessageIndex ===
                        demoStartIndex + 1 + i && msg.timestamp !== undefined
                        ? 'opacity-50'
                        : 'opacity-100'} transition-opacity duration-300">
                      <div class="whitespace-pre-wrap tracking-wide font-medium">
                        {msg.content}
                      </div>
                    </Card>
                  {/if}
                  <div
                    class="shrink-0 w-8 h-8 rounded-full bg-secondary-100 text-white flex items-center justify-center shadow-md">
                    <User size={18} />
                  </div>
                {:else}
                  <div class="shrink-0 w-8 h-8 rounded bg-secondary-300 overflow-hidden shadow-md">
                    <img src={pfp} alt="V" class="w-full h-full object-cover" />
                  </div>
                  {#if msg.content.startsWith('<recording>') && msg.content.endsWith('</recording>')}
                    <RecordingPanel recordingId={msg.content.slice(11, -12)} />
                  {:else if msg.content === '<upload-button></upload-button>'}
                    <Card
                      variant="secondary"
                      padding="sm"
                      className="w-auto! shadow-sm space-y-4 relative bg-black/5">
                      <div class="flex flex-col items-start gap-2">
                        <div class="text-sm font-medium mb-1">
                          Ready to submit your demonstration?
                        </div>
                        <Button
                          variant="primary"
                          onclick={handleUploadClick}
                          disabled={isUploading}
                          class="flex! items-center gap-1 w-full justify-center">
                          {#if isUploading}
                            Uploading...
                          {:else}
                            <Upload size={16} />
                            Upload Demonstration {deletedRanges.length > 0
                              ? `with ${deletedRanges.length} edit${deletedRanges.length === 1 ? '' : 's'}`
                              : ''}
                          {/if}
                        </Button>
                        <p class="text-sm w-full text-center text-gray-500">
                          Get scored and earn $VIRAL tokens
                        </p>
                        <button
                          onclick={handleDeleteRecording}
                          class="text-sm w-full text-center text-gray-500 hover:text-red-500 hover:underline">
                          Don't like your recording? Click to delete it.
                        </button>
                      </div>
                    </Card>
                  {:else if msg.content.startsWith('<img>') && msg.content.endsWith('</img>')}
                    <Card
                      variant="secondary"
                      padding="none"
                      className="w-auto! max-w-lg shadow-sm overflow-hidden">
                      <img
                        src={`data:image/jpeg;base64,${msg.content.slice(5, -6)}`}
                        alt="Screenshot"
                        class="w-full h-auto" />
                    </Card>
                  {:else}
                    <Card
                      variant="secondary"
                      padding="sm"
                      className="w-auto! shadow-sm space-y-4 relative bg-black/5">
                      <div class="whitespace-pre-wrap break-words">
                        {#if typingMessage && typingMessage.messageIndex === demoStartIndex + 1 + i}
                          {typingMessage.content}
                          <span class="animate-pulse">▋</span>
                        {:else}
                          {msg.content}
                        {/if}
                      </div>
                    </Card>
                  {/if}
                {/if}
              </div>
            {/each}
          </div>
        </div>

        <!-- Render messages after demo section normally -->
        {#each chatMessages.slice(demoEndIndex + 1) as msg, i (demoEndIndex + 1 + i)}
          <div
            class="flex gap-2 transition-all duration-200 relative group {msg.role === 'user'
              ? 'justify-end'
              : ''}"
            onmouseenter={() => handleHover(demoEndIndex + 1 + i)}
            onmouseleave={handleHoverEnd}
            role="listitem">
            <!-- Delete overlay for the entire message -->
            {#if hoveredMessageIndex === demoEndIndex + 1 + i && msg.timestamp !== undefined && !msg.content.startsWith('<delete>')}
              <button
                class="absolute inset-0 flex items-center justify-center bg-black/5 z-10 rounded transition-opacity duration-300 cursor-pointer"
                style="opacity: {hoveredMessageIndex === demoEndIndex + 1 + i ? '1' : '0'}"
                onclick={() => handleDeleteMessage(demoEndIndex + 1 + i, msg)}>
                <div
                  class="bg-red-500 hover:bg-red-600 text-white rounded-full p-3 shadow-lg transition-all duration-200 transform hover:scale-110">
                  <Trash2 size={24} />
                </div>
              </button>
            {/if}

            {#if msg.content.startsWith('<delete>') && msg.content.includes('</delete>')}
              <!-- Special full-width centered message for delete tag -->
              <div
                onclick={() => handleUndoDelete(demoEndIndex + 1 + i)}
                onkeydown={() => {}}
                role="button"
                tabindex="0"
                class="w-full text-center text-neutral-500 opacity-50 py-2 cursor-pointer hover:opacity-80">
                <div class="flex items-center justify-center gap-2">
                  <RotateCcw size={16} />
                  <span>{msg.content.replace(/<delete>.*?<\/delete>/, '')}</span>
                </div>
              </div>
            {:else if msg.role === 'user'}
              {#if msg.content.startsWith('<recording>') && msg.content.endsWith('</recording>')}
                <RecordingPanel recordingId={msg.content.slice(11, -12)} />
              {:else if msg.content.startsWith('<loading>') && msg.content.endsWith('</loading>')}
                <Card
                  variant="primary"
                  padding="sm"
                  className="w-auto! flex! flex-row! gap-2 max-w-2xl shadow-sm bg-secondary-300 text-white">
                  <div
                    class="h-5 w-5 rounded-full border-2 border-white border-t-transparent! animate-spin">
                  </div>
                  {msg.content.slice(9, -10)}
                </Card>
              {:else if msg.content.startsWith('<delete>') && msg.content.includes('</delete>')}
                <div
                  onclick={() => handleUndoDelete(demoEndIndex + 1 + i)}
                  onkeydown={() => {}}
                  role="button"
                  tabindex="0"
                  class="cursor-pointer hover:opacity-90 w-full">
                  <Card
                    variant="primary"
                    padding="sm"
                    className="w-auto! flex! flex-row! items-center gap-3 max-w-2xl shadow-sm bg-neutral-600 text-white hover:bg-neutral-700">
                    <RotateCcw size={16} />
                    <div class="whitespace-pre-wrap tracking-wide">
                      {msg.content.replace(/<delete>.*?<\/delete>/, '')}
                    </div>
                  </Card>
                </div>
              {:else if msg.content.startsWith('<img>') && msg.content.endsWith('</img>')}
                <Card
                  variant="secondary"
                  padding="none"
                  className="w-auto! max-w-lg shadow-sm overflow-hidden {hoveredMessageIndex ===
                  demoEndIndex + 1 + i
                    ? 'opacity-60'
                    : 'opacity-100'} transition-opacity duration-300">
                  <img
                    src={`data:image/jpeg;base64,${msg.content.slice(5, -6)}`}
                    alt="Screenshot"
                    class="w-full h-auto" />
                </Card>
              {:else if msg.content.startsWith('<action>') && msg.content.endsWith('</action>')}
                <Card
                  variant="primary"
                  padding="sm"
                  className="w-auto! max-w-2xl shadow-sm bg-secondary-300 text-white {hoveredMessageIndex ===
                  demoEndIndex + 1 + i
                    ? 'opacity-60'
                    : 'opacity-100'} transition-opacity duration-300">
                  <div class="flex items-center gap-2">
                    <MousePointer size={16} />
                    <pre class="font-mono text-sm whitespace-pre-wrap">{msg.content.slice(
                        8,
                        -9
                      )}</pre>
                  </div>
                </Card>
              {:else}
                <Card
                  variant="primary"
                  padding="sm"
                  className="w-auto! max-w-2xl shadow-sm bg-secondary-300 text-white {hoveredMessageIndex ===
                    demoEndIndex + 1 + i && msg.timestamp !== undefined
                    ? 'opacity-50'
                    : 'opacity-100'} transition-opacity duration-300">
                  <div class="whitespace-pre-wrap tracking-wide font-medium">
                    {msg.content}
                  </div>
                </Card>
              {/if}
              <div
                class="shrink-0 w-8 h-8 rounded-full bg-secondary-100 text-white flex items-center justify-center shadow-md">
                <User size={18} />
              </div>
            {:else}
              <div class="shrink-0 w-8 h-8 rounded bg-secondary-300 overflow-hidden shadow-md">
                <img src={pfp} alt="V" class="w-full h-full object-cover" />
              </div>
              {#if msg.content.startsWith('<recording>') && msg.content.endsWith('</recording>')}
                <RecordingPanel recordingId={msg.content.slice(11, -12)} />
              {:else if msg.content === '<upload-button></upload-button>'}
                <Card
                  variant="secondary"
                  padding="sm"
                  className="w-auto! shadow-sm space-y-4 relative bg-black/5">
                  <div class="flex flex-col items-start gap-2">
                    <div class="text-sm font-medium mb-1">Ready to submit your demonstration?</div>
                    <Button
                      variant="primary"
                      onclick={handleUploadClick}
                      disabled={isUploading}
                      class="flex! items-center gap-1 w-full justify-center">
                      {#if isUploading}
                        Uploading...
                      {:else}
                        <Upload size={16} />
                        Upload Demonstration {deletedRanges.length > 0
                          ? `with ${deletedRanges.length} edit${deletedRanges.length === 1 ? '' : 's'}`
                          : ''}
                      {/if}
                    </Button>
                    <p class="text-sm w-full text-center text-gray-500">
                      Get scored and earn $VIRAL tokens
                    </p>
                    <button
                      onclick={handleDeleteRecording}
                      class="text-sm w-full text-center text-gray-500 hover:text-red-500 hover:underline">
                      Don't like your recording? Click to delete it.
                    </button>
                  </div>
                </Card>
              {:else if msg.content.startsWith('<img>') && msg.content.endsWith('</img>')}
                <Card
                  variant="secondary"
                  padding="none"
                  className="w-auto! max-w-lg shadow-sm overflow-hidden">
                  <img
                    src={`data:image/jpeg;base64,${msg.content.slice(5, -6)}`}
                    alt="Screenshot"
                    class="w-full h-auto" />
                </Card>
              {:else}
                <Card
                  variant="secondary"
                  padding="sm"
                  className="w-auto! shadow-sm space-y-4 relative bg-black/5">
                  <div class="whitespace-pre-wrap break-words">
                    {#if typingMessage && typingMessage.messageIndex === demoEndIndex + 1 + i}
                      {typingMessage.content}
                      <span class="animate-pulse">▋</span>
                    {:else}
                      {msg.content}
                    {/if}
                  </div>
                </Card>
              {/if}
            {/if}
          </div>
        {/each}
      {/if}
    {/if}

    {#if activeQuest}
      <QuestPanel
        title={activeQuest.title}
        reward={activeQuest.reward}
        objectives={activeQuest.objectives}
        onStartRecording={startRecordingHandler}
        onComplete={handleRecordingComplete}
        onGiveUp={handleGiveUp} />
    {/if}

    {#if isWaitingForResponse || loadingSftData}
      <div class="flex gap-2">
        <div class="shrink-0 w-8 h-8 rounded bg-secondary-300 overflow-hidden shadow-md">
          <img src={pfp} alt="V" class="w-full h-full object-cover" />
        </div>
        <Card
          variant="secondary"
          padding="sm"
          className="shadow-sm w-auto! mr-auto space-y-4 relative bg-black/5">
          <div class="flex gap-0.5 px-1.5 py-1">
            <span
              class="w-1.5 h-1.5 bg-secondary-300 rounded-full animate-[pulse_1s_ease-in-out_-0.3s_infinite]">
            </span>
            <span
              class="w-1.5 h-1.5 bg-secondary-300 rounded-full animate-[pulse_1s_ease-in-out_-0.15s_infinite]">
            </span>
            <span
              class="w-1.5 h-1.5 bg-secondary-300 rounded-full animate-[pulse_1s_ease-in-out_0s_infinite]">
            </span>
          </div>
        </Card>
      </div>
    {/if}
  </div>
</div>
<!-- <div class="p-4 absolute bottom-0 w-full left-0 bg-white border-t border-gray-200">
  <div class="flex gap-3 items-center max-w-4xl mx-auto">
    {#if recordingState === 'recording' || recordingLoading}
      <Button
        onclick={toggleRecording}
        class="bg-red-500! hover:text-red-500! hover:bg-white! border-red-500! rounded-full! flex!">
        {#if recordingState === 'recording'}
          <Square size={20} />
        {:else if recordingLoading}
          <div
            class="w-5 h-5 rounded-full border-2 border-white hover:border-red-500! border-t-transparent! animate-spin">
          </div>
        {:else}
          <Video size={20} />
        {/if}
      </Button>
    {/if}
    <form class="flex-1 flex gap-3 items-center" onsubmit={sendMessage}>
      <Input
        type="text"
        variant="light"
        disabled
        placeholder="Agent chat coming soon..."
        bind:value={message}
        class="flex-1 rounded-full!" />
      <Button type="submit" disabled class="rounded-full!">
        <Send size={20} />
      </Button>
    </form>
  </div>
</div> -->

<UploadConfirmModal uploader={handleUploadClick} bind:open={showUploadConfirmModal} />
