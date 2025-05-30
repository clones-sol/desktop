<script lang="ts">
  import { onMount, onDestroy } from 'svelte';
  import { goto } from '$app/navigation';
  import { ArrowLeft, AlertTriangle, X } from 'lucide-svelte';
  import GymBuilderView from '$lib/components/gym-builder/GymBuilderView.svelte';
  import Button from '$lib/components/form/Button.svelte';
  import { walletAddress } from '$lib/stores/wallet';
  import { listPools, updatePool, refreshPool } from '$lib/api/endpoints/forge';
  import { TrainingPoolStatus, type TrainingPool } from '$lib/types/forge';

  export let data;

  let pool: TrainingPool & {
    unsavedSkills?: boolean;
    unsavedPrice?: boolean;
    unsavedName?: boolean;
  };
  let loading = true;
  let savingChanges = false;
  let error: string | null = null;
  let refreshingPool = false;
  let viralPrice = 0;
  let refreshInterval: number | null = null;

  // Get gymId from the data passed from +page.ts
  $: gymId = data.gymId;

  onMount(async () => {
    loading = true;
    await loadPool();
    loading = false;
    fetchPrices();

    // Set up periodic refresh
    refreshInterval = window.setInterval(() => {
      refreshPoolData();
    }, 300000); // Refresh every 5 minutes
  });

  onDestroy(() => {
    if (refreshInterval) {
      clearInterval(refreshInterval);
    }
  });

  async function loadPool() {
    if (!gymId || !$walletAddress) return;

    try {
      error = null;

      // Get all pools for the user
      const pools = await listPools();

      // Find the specific pool by ID
      const fetchedPool = pools.find((p) => p._id === gymId);

      if (!fetchedPool) {
        error = 'Gym not found';
        loading = false;
        return;
      }

      // Initialize UI state properties
      pool = {
        ...fetchedPool,
        unsavedSkills: false,
        unsavedPrice: false,
        unsavedName: false
      };
    } catch (err) {
      error = err instanceof Error ? err.message : 'Failed to load AI agent gym';
      console.error('Failed to load gym:', err);
    }
  }

  async function fetchPrices() {
    try {
      const TOKEN_DATA = {
        solAddress: import.meta.env.VITE_SOL_TOKEN_ADDRESS,
        contractAddress: import.meta.env.VITE_VIRAL_TOKEN_ADDRESS
      };

      const JUPITER_API_URL = import.meta.env.VITE_JUPITER_API_URL;

      const response = await fetch(
        `${JUPITER_API_URL}/price/v2?ids=${TOKEN_DATA.contractAddress},${TOKEN_DATA.solAddress}`
      );
      const json = await response.json();

      viralPrice = parseFloat(json.data[TOKEN_DATA.contractAddress].price);
    } catch (error) {
      console.error('Error fetching prices:', error);
    }
  }

  async function refreshPoolData() {
    if (refreshingPool || !gymId) return;

    try {
      refreshingPool = true;

      // Create a promise that resolves after 1 second
      const minDelay = new Promise((resolve) => setTimeout(resolve, 1000));

      // Run the refresh and delay in parallel
      const [updatedPool] = await Promise.all([refreshPool(gymId), minDelay]);

      // Update the pool
      pool = { ...pool, ...updatedPool };
    } catch (err) {
      console.error('Failed to refresh gym:', err);
    } finally {
      refreshingPool = false;
    }
  }

  async function handleUpdatePool(poolToUpdate: TrainingPool, updates: any) {
    try {
      await updatePool({
        id: poolToUpdate._id,
        ...updates
      });
      savingChanges = true;
      await loadPool(); // Reload to get latest data
      savingChanges = true;
    } catch (err) {
      error = err instanceof Error ? err.message : 'Failed to update AI agent gym';
    }
  }

  function goBack() {
    goto('/app/forge');
  }
</script>

<div class="h-full space-y-6 p-4">
  {#if loading}
    <div class="flex items-center justify-center h-40">
      <div
        class="animate-spin h-8 w-8 border-4 border-secondary-500 rounded-full border-t-transparent">
      </div>
    </div>
  {:else if pool}
    <div class="flex flex-col h-full">
      <div>
        <button
          class="flex items-center cursor-pointer hover:underline gap-1 text-blue-500 hover:text-blue-600 focus:outline-none"
          onclick={goBack}>
          <ArrowLeft size={18} />
          <span>Back to Gyms</span>
        </button>
      </div>

      {#if error}
        <div class="p-4 my-2 flex flex-row bg-red-500/10 text-red-500 rounded-lg">
          <p class="font-medium grow">{error}</p>
          <button
            class="text-gray-600 p-1 cursor-pointer border border-transparent transition rounded-md hover:border-gray-600 grow-0 mx-5"
            onclick={() => (error = null)}>
            <X size={18} />
          </button>
        </div>
      {/if}
      {#if pool.status === TrainingPoolStatus.noGas || pool.status === TrainingPoolStatus.noFunds}
        <div
          class="p-4 my-3 bg-amber-50 border-l-4 border-amber-400 rounded-lg flex gap-3 shadow-sm">
          <div class="text-amber-500 flex-shrink-0">
            <AlertTriangle size={18} />
          </div>
          <div class="flex-1">
            {#if pool.status === TrainingPoolStatus.noGas}
              <p class="text-sm text-amber-900 font-semibold mb-1">Insufficient SOL for Gas</p>
              <p class="text-xs leading-relaxed text-amber-800">
                Your gym needs SOL to pay for on-chain transactions. Without gas, the gym cannot
                function on the Solana blockchain.
              </p>
            {:else if pool.status === TrainingPoolStatus.noFunds}
              <p class="text-sm text-amber-900 font-semibold mb-1">Insufficient VIRAL Tokens</p>
              <p class="text-xs leading-relaxed text-amber-800">
                Your gym needs VIRAL tokens to reward users who provide demonstrations. Without
                funds, users won't receive compensation.
              </p>
            {/if}
            <p class="text-xs text-amber-800 font-medium mt-2">
              Deposit {pool.status === TrainingPoolStatus.noGas ? 'SOL' : 'VIRAL'} to the address above
              to activate your gym and start collecting data.
            </p>
          </div>
        </div>
      {/if}

      <GymBuilderView
        {pool}
        onSave={handleUpdatePool}
        onRefresh={refreshPoolData}
        refreshingPools={new Set([refreshingPool ? gymId : ''])} />
    </div>
  {:else}
    <div class="p-4 bg-yellow-500/10 text-yellow-600 rounded-lg">
      <p>Gym not found</p>
      <div class="mt-4">
        <Button onclick={goBack}>Return to Forge</Button>
      </div>
    </div>
  {/if}
</div>
