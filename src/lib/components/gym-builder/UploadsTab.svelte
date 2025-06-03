<script lang="ts">
  import Card from '$lib/components/Card.svelte';
  import DownloadScriptsModal from '$lib/components/modals/DownloadScriptsModal.svelte';
  import {
    Code,
    Download,
    Clock,
    Monitor,
    Laptop,
    Server,
    Smartphone,
    Globe,
    Info
  } from 'lucide-svelte';
  import type { TrainingPool, PoolSubmission } from '$lib/types/forge';
  import { getPoolSubmissions } from '$lib/api/endpoints/forge';
  import { onMount } from 'svelte';
  import { ApiError, ErrorCode } from '$lib/api';

  export let pool: TrainingPool & {
    unsavedSkills?: boolean;
    unsavedPrice?: boolean;
    unsavedName?: boolean;
  };

  export let submissions: PoolSubmission[] = [];
  let selectedSubmissions: Set<string> = new Set();
  let loading = true;
  let error: string | null = null;

  onMount(async () => {
    try {
      loading = true;
      error = null;
      submissions = await getPoolSubmissions(pool._id);
    } catch (err) {
      if ((err as ApiError).message.includes(ErrorCode.UNAUTHORIZED)) {
        error = 'Not authenticated to load submissions. Please re-connect your wallet.';
      } else {
        console.error('Failed to reload submissions:', err);
        error = 'Failed to load submissions. Please try again later.';
      }
    } finally {
      loading = false;
    }
  });

  function formatDate(dateStr: string): string {
    return new Date(dateStr).toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'short',
      day: 'numeric'
    });
  }

  function getTitle(submission: PoolSubmission): string {
    if (submission.meta?.quest?.title) {
      return submission.meta.quest.title;
    } else if (submission.meta?.quest?.app) {
      return submission.meta.quest.app;
    }
    return 'Untitled Submission';
  }

  function getTotalFileSize(submission: PoolSubmission): string {
    if (!submission.files || submission.files.length === 0) {
      return '-';
    }

    let totalSize = 0;
    let hasSizeInfo = false;

    submission.files.forEach((file) => {
      if (file.size) {
        totalSize += file.size;
        hasSizeInfo = true;
      }
    });

    if (!hasSizeInfo) {
      return '-';
    }

    // Format file size in MB
    return `${(totalSize / (1024 * 1024)).toFixed(2)} MB`;
  }

  function getLocaleCode(submission: PoolSubmission): string {
    const locale = submission.meta?.locale || '';
    return locale;
  }

  function getOSIcon(submission: PoolSubmission): any {
    const platform = submission.meta?.platform?.toLowerCase() || '';

    if (platform.includes('windows')) return Monitor;
    if (platform.includes('mac') || platform.includes('darwin')) return Laptop;
    if (platform.includes('linux')) return Server;
    if (platform.includes('android') || platform.includes('ios')) return Smartphone;

    return Globe;
  }

  function getPlatformLabel(submission: PoolSubmission): string {
    const platform = submission.meta?.platform?.toLowerCase() || '';
    return platform;
  }

  function formatDuration(submission: PoolSubmission): string {
    const seconds = submission.meta?.duration_seconds;
    if (!seconds && seconds !== 0) return '-';

    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = seconds % 60;

    if (minutes > 0) {
      return `${minutes}m ${remainingSeconds}s`;
    } else {
      return `${remainingSeconds}s`;
    }
  }

  // Toggle selection for a single submission
  function toggleSelection(submissionId: string) {
    if (selectedSubmissions.has(submissionId)) {
      selectedSubmissions.delete(submissionId);
    } else {
      selectedSubmissions.add(submissionId);
    }
    selectedSubmissions = selectedSubmissions; // Trigger reactivity
  }

  // Toggle selection for all submissions
  function toggleSelectAll() {
    if (selectedSubmissions.size === submissions.length) {
      // If all are selected, deselect all
      selectedSubmissions.clear();
    } else {
      // Otherwise, select all
      selectedSubmissions = new Set(submissions.map((s) => s._id));
    }
    selectedSubmissions = selectedSubmissions; // Trigger reactivity
  }

  // Check if all submissions are selected
  $: allSelected = submissions.length > 0 && selectedSubmissions.size === submissions.length;

  // Count of selected submissions
  $: selectedCount = selectedSubmissions.size;

  // Download scripts modal
  let showDownloadModal = false;
</script>

<!-- Header section similar to TasksTab -->
<div class="flex justify-between items-center border-gray-200 pb-3">
  <div class="flex items-center">
    <h2 class="text-xl font-bold text-gray-800">Uploads</h2>
    {#if selectedCount > 0}
      <span class="ml-2 px-2 py-0.5 bg-secondary-100 text-white text-xs rounded-full">
        {selectedCount} selected
      </span>
    {/if}
  </div>
  <div class="flex items-center space-x-2">
    {#if selectedCount > 0}
      <button
        class="px-3 py-1.5 text-sm rounded-md bg-secondary-300 text-white hover:bg-secondary-100 transition-colors flex items-center"
        onclick={() => (showDownloadModal = true)}>
        <Download size={15} class="mr-1" />
        Export Selected
      </button>
    {:else}
      <button
        class="px-3 py-1.5 text-sm rounded-md bg-secondary-300 text-white hover:bg-secondary-100 transition-colors flex items-center"
        onclick={() => (showDownloadModal = true)}
        disabled={submissions.length === 0}>
        <Code size={15} class="mr-1" />
        Export All Uploads
      </button>
    {/if}
  </div>
</div>

<Card padding="none" className="border border-gray-200">
  {#if loading}
    <div class="p-8 text-center text-gray-500">
      <div class="animate-pulse flex flex-col items-center">
        <div class="text-sm font-medium mb-2">Loading submissions...</div>
        <div class="bg-gray-200 h-2 w-40 rounded"></div>
      </div>
    </div>
  {:else if error}
    <div class="p-8 text-center text-red-500">
      <div class="text-sm font-medium">{error}</div>
      <button
        class="mt-2 text-secondary-600 hover:text-secondary-900 text-sm hover:underline cursor-pointer"
        onclick={() => {
          loading = true;
          getPoolSubmissions(pool._id)
            .then((data) => {
              submissions = data;
              error = null;
            })
            .catch((err) => {
              if ((err as ApiError).message.includes(ErrorCode.UNAUTHORIZED)) {
                error = 'Not authenticated to load submissions. Please re-connect your wallet.';
              } else {
                console.error('Failed to reload submissions:', err);
                error = 'Failed to load submissions. Please try again later.';
              }
            })
            .finally(() => {
              loading = false;
            });
        }}>
        Try Again
      </button>
    </div>
  {:else}
    <div class="overflow-x-auto overflow-y-visible">
      <table class="min-w-full divide-y divide-gray-200 relative">
        <thead class="bg-gray-50">
          <tr>
            <th class="w-10 px-3 py-3 overflow-x-scroll">
              <div class="flex items-center">
                <input
                  type="checkbox"
                  class="h-4 w-4 text-secondary-600 focus:ring-secondary-500 border-gray-300 rounded cursor-pointer"
                  checked={allSelected}
                  onchange={toggleSelectAll}
                  disabled={submissions.length === 0} />
              </div>
            </th>
            <th
              class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              Platform
            </th>
            <th
              class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              Task
            </th>
            <th
              class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              Status
            </th>
            <th
              class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              Duration
            </th>
            <th
              class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              File Size
            </th>
            <th
              class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              Quality
            </th>
            <th
              class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              Reward
            </th>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          {#each submissions as submission}
            <tr class={selectedSubmissions.has(submission._id) ? 'bg-secondary-50' : ''}>
              <td class="px-3 py-4 whitespace-nowrap">
                <div class="flex items-center">
                  <input
                    type="checkbox"
                    class="h-4 w-4 text-secondary-600 focus:ring-secondary-500 border-gray-300 rounded cursor-pointer"
                    checked={selectedSubmissions.has(submission._id)}
                    onchange={() => toggleSelection(submission._id)} />
                </div>
              </td>
              <td class="px-2 py-4 whitespace-nowrap text-gray-500">
                <div class="flex items-center gap-2">
                  <!-- <span class="flex items-center gap-1 bg-gray-200 text-gray-700 px-1.5 py-0.5 rounded text-xs font-mono">
                  <Languages size={10} class="text-gray-500" />
                  {getLocaleCode(submission)}
                </span> -->
                  <span
                    class="flex items-center gap-1 bg-gray-200 text-gray-700 px-1.5 py-0.5 rounded text-xs font-mono">
                    <svelte:component
                      this={getOSIcon(submission)}
                      size={10}
                      class="text-gray-500" />
                    {getPlatformLabel(submission)}
                  </span>
                </div>
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                {getTitle(submission)}
              </td>
              <td class="px-6 py-4 whitespace-nowrap">
                <span
                  class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full
                {submission.status === 'completed'
                    ? 'bg-green-100 text-green-800'
                    : submission.status === 'failed'
                      ? 'bg-red-100 text-red-800'
                      : 'bg-yellow-100 text-yellow-800'}">
                  {submission.status}
                </span>
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                <div class="flex items-center space-x-1">
                  <Clock size={14} class="text-gray-400" />
                  <span>{formatDuration(submission)}</span>
                </div>
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                {getTotalFileSize(submission)}
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm">
                {#if submission.grade_result?.score}
                  <span
                    class={submission.grade_result.score >= 50
                      ? 'text-green-600 font-semibold'
                      : submission.grade_result.score >= 25
                        ? 'text-yellow-600 font-semibold'
                        : 'text-red-600 font-semibold'}>
                    {submission.grade_result.score}%
                  </span>
                {:else}
                  <span class="text-gray-500">-</span>
                {/if}
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                {#if submission.reward && submission.reward > 0}
                  {submission.reward} VIRAL
                {:else}
                  <div class="flex items-center gap-1">
                    <span class="text-gray-500">FREE</span>
                    {#if submission.grade_result?.reasoning}
                      <div class="relative group">
                        <Info size={14} class="text-gray-400" />
                        <div
                          class="absolute right-0 bottom-full mb-2 w-64 bg-gray-900 text-white text-xs rounded p-2 shadow-lg opacity-0 group-hover:opacity-100 transition-opacity z-10 pointer-events-none whitespace-normal break-words">
                          {(submission.grade_result.reasoning.match(
                            /\(\s*system:\s*(.*?)\s*\)/
                          ) || ['', ''])[1]}
                        </div>
                      </div>
                    {/if}
                  </div>
                {/if}
              </td>
            </tr>
          {/each}
          {#if submissions.length === 0}
            <tr>
              <td colspan="7" class="px-6 py-8 text-center text-gray-500">
                No submissions yet. Submissions will appear here when users upload demonstrations.
              </td>
            </tr>
          {/if}
        </tbody>
      </table>
    </div>
  {/if}
</Card>

<DownloadScriptsModal
  bind:open={showDownloadModal}
  submissions={selectedCount > 0
    ? submissions.filter((s) => selectedSubmissions.has(s._id))
    : submissions}
  onClose={() => (showDownloadModal = false)} />
