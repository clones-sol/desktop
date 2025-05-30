<script lang="ts">
  import {
    walletAddress,
    isConnecting,
    getConnectionUrl,
    startPolling,
    disconnectWallet,
    nickname
  } from '$lib/stores/wallet';

  import { LogOut, Wallet, ExternalLink, Coins } from 'lucide-svelte';
  import { onMount } from 'svelte';
  import { getBalance, listSubmissions } from '$lib/api/endpoints/forge';
  import type { SubmissionStatus } from '$lib/types/forge';
  import { getNickname } from '$lib/api/endpoints/wallet';
  import NicknameModal from './modals/NicknameModal.svelte';

  const {
    variant = 'compact',
    theme = 'dark'
  }: { variant?: 'compact' | 'large'; theme?: 'dark' | 'light' } = $props();

  let viralBalance = $state(0);
  let nickNameModalOpen = $state(false);
  let recentSubmissions: SubmissionStatus[] = $state([]);

  function formatNumber(num: number): string {
    return num.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  }

  function formatDate(dateString: string): string {
    const date = new Date(dateString);
    return date.toLocaleDateString(undefined, { month: 'short', day: 'numeric' });
  }

  function getSolscanUrl(txHash: string): string {
    return `${import.meta.env.VITE_SOLSCAN_BASE_URL}/tx/${txHash}`;
  }

  async function loadSubmissions() {
    try {
      const submissions = await listSubmissions();
      // Sort by date (newest first) and take the last 3
      recentSubmissions = submissions
        .sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime())
        .filter((a) => a.treasuryTransfer?.txHash && a.reward)
        .slice(0, 3);
    } catch (error) {
      console.error('Failed to load submissions:', error);
    }
  }

  onMount(async () => {
    if ($walletAddress) {
      viralBalance = await getBalance($walletAddress);
      $nickname = await getNickname($walletAddress);
      loadSubmissions();
    }
  });

  // Subscribe to wallet address changes
  walletAddress.subscribe(async (address) => {
    if (address) {
      viralBalance = await getBalance(address);
      $nickname = await getNickname(address);
      loadSubmissions();
    }
  });
</script>

{#if $walletAddress}
  <div
    class="w-full py-2 flex {variant === 'large'
      ? 'justify-between px-3'
      : 'justify-center'} rounded-full {theme === 'light'
      ? 'bg-white/90 text-gray-800 hover:bg-white'
      : 'bg-white/5 text-gray-300 hover:bg-white/10'} relative group transition-colors">
    <div class="flex items-center gap-2">
      <Wallet size={16} />
      {#if variant === 'large'}
        <span class="text-xs font-mono">
          {$walletAddress.slice(0, 4)}...{$walletAddress.slice(-4)}
        </span>
      {/if}
    </div>

    <!-- Wallet Popup -->
    <div
      class="invisible group-hover:visible opacity-0 group-hover:opacity-100 transition-all duration-200
      absolute bottom-0 left-full ml-1 w-64 p-4
      bg-neutral-950 text-gray-300 text-xs rounded-lg z-50 shadow-2xl border border-neutral-800">
      <div class="flex flex-col gap-2">
        <!-- Wallet Address -->
        <div class="flex justify-between items-center">
          <span class="text-gray-400">Wallet</span>
          <span class="font-mono">{$walletAddress.slice(0, 4)}...{$walletAddress.slice(-4)}</span>
        </div>
        <!-- Nickname -->
        <div class="flex justify-between items-center">
          <span class="text-gray-400">Nickname</span>
          <button
            onclick={() => (nickNameModalOpen = true)}
            class=" {$nickname
              ? ''
              : 'text-gray-500'} font-semibold hover:text-white transition-all hover:underline">
            {$nickname || 'Set Your Nickname'}
          </button>
        </div>

        <!-- Balance -->
        <div class="flex justify-between items-center">
          <span class="text-gray-400">Balance</span>
          <span class="font-semibold text-secondary-300">{formatNumber(viralBalance)} $VIRAL</span>
        </div>

        <!-- Recent Rewards -->
        {#if recentSubmissions.length > 0}
          <div class="my-1 pt-1">
            <div class="text-gray-400 mb-1.5">Recent Activity</div>
            <div class="flex flex-col gap-1.5">
              {#each recentSubmissions as submission}
                {#if submission.reward && submission.treasuryTransfer?.txHash}
                  <a
                    href={getSolscanUrl(submission.treasuryTransfer.txHash)}
                    target="_blank"
                    class="flex items-start gap-1.5 hover:bg-white/5 p-1 rounded-md transition-colors -mx-1"
                    title="View on Solscan">
                    <Coins size={12} class="text-secondary-300 mt-0.5 shrink-0" />
                    <div class="flex-grow">
                      <div class="flex justify-between items-center">
                        <span class="text-white truncate" title={submission.meta?.title || 'Quest'}>
                          {submission.meta?.title
                            ? submission.meta.title.length > 20
                              ? submission.meta.title.substring(0, 20) + '...'
                              : submission.meta.title
                            : 'Quest'}
                        </span>
                        <span class="text-secondary-300 font-semibold whitespace-nowrap">
                          +{submission.reward} $VIRAL
                        </span>
                      </div>
                      <div class="text-gray-500 text-[10px]">
                        {formatDate(submission.createdAt)}
                      </div>
                    </div>
                    <ExternalLink size={10} class="text-gray-500 mt-0.5 shrink-0 opacity-50" />
                  </a>
                {/if}
              {/each}
            </div>
          </div>
        {/if}

        <!-- Logout Button -->
        <button
          class="flex items-center gap-1.5 text-gray-400 cursor-pointer hover:text-white transition-colors mt-1 px-3 py-2 rounded-full bg-white/5 hover:bg-white/10 -mx-1"
          onclick={disconnectWallet}>
          <LogOut size={12} />
          <span>Disconnect Wallet</span>
        </button>
      </div>
    </div>
  </div>
{:else}
  <a
    href={getConnectionUrl()}
    target="_blank"
    class="w-full py-2 flex {variant === 'large'
      ? 'justify-between px-3'
      : 'justify-center'} rounded-full {theme === 'light'
      ? 'bg-white/90 text-gray-800 hover:bg-white'
      : 'bg-white/5 text-gray-300 hover:bg-white/10'} relative group transition-colors"
    onclick={() => startPolling()}>
    <div class="flex items-center gap-2">
      <Wallet size={16} />
      {#if variant === 'large'}
        <span class="text-xs">Connect Wallet</span>
      {/if}
    </div>
    {#if variant !== 'large'}
      <div
        class="invisible group-hover:visible opacity-0 group-hover:opacity-100 transition-all duration-200 absolute bottom-0 left-full ml-2 w-40 p-3 bg-black text-gray-300 text-xs rounded-lg whitespace-nowrap text-center z-50 shadow-lg border border-gray-800">
        <div class="flex items-center justify-center gap-1.5">
          {$isConnecting ? 'Connecting...' : 'Connect Wallet'}
          <ExternalLink size={10} />
        </div>
      </div>
    {/if}
  </a>
{/if}

<NicknameModal bind:open={nickNameModalOpen} oldNick={$nickname} />
