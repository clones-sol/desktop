<script lang="ts">
  import { onDestroy, onMount } from 'svelte';
  import Card from '$lib/components/Card.svelte';
  import GenerateGymModal from '$lib/components/modals/GenerateGymModal.svelte';
  import { ChevronRight, RefreshCw } from 'lucide-svelte';
  import { goto } from '$app/navigation';
  import { walletAddress } from '$lib/stores/wallet';
  import { listPools, updatePool, refreshPool, createPoolWithApps } from '$lib/api/endpoints/forge';
  import { type TrainingPool, TrainingPoolStatus } from '$lib/types/forge';
  import WalletButton from '$lib/components/WalletButton.svelte';

  // Extended TrainingPool for UI state
  type ExtendedPool = TrainingPool & {
    unsavedSkills?: boolean;
    unsavedPrice?: boolean;
    unsavedName?: boolean;
    tokenBalance?: number;
    solBalance?: number;
    createdAt?: string;
  };

  let trainingPools: ExtendedPool[] = [];
  let showGenerateGymModal = false;
  let currentSkills = '';
  let loading = true;
  let error: string | null = null;
  let refreshingPools: Set<string> = new Set();

  // Pricing data
  let viralPrice = 0;
  let solPrice = 0;
  let viralPerSol = 0;
  let loadingPrices = true;

  // Token contract addresses
  const TOKEN_DATA = {
    solAddress: import.meta.env.VITE_SOL_TOKEN_ADDRESS,
    contractAddress: import.meta.env.VITE_VIRAL_TOKEN_ADDRESS
  };

  onMount(() => {
    fetchPrices();
  });

  async function fetchPrices() {
    try {
      loadingPrices = true;
      const JUPITER_API_URL = import.meta.env.VITE_JUPITER_API_URL;
      const response = await fetch(
        `${JUPITER_API_URL}/price/v2?ids=${TOKEN_DATA.contractAddress},${TOKEN_DATA.solAddress}`
      );
      const json = await response.json();

      viralPrice = parseFloat(json.data[TOKEN_DATA.contractAddress].price);
      solPrice = parseFloat(json.data[TOKEN_DATA.solAddress].price);
      viralPerSol = solPrice / viralPrice;
    } catch (error) {
      console.error('Error fetching prices:', error);
    } finally {
      loadingPrices = false;
    }
  }

  $: if ($walletAddress) {
    loadPools();
  }

  async function loadPools() {
    if (!$walletAddress) return;

    try {
      loading = true;
      error = null;
      let pools = await listPools();
      // Initialize UI state properties
      trainingPools = pools.map((pool) => ({
        ...pool,
        unsavedSkills: false,
        unsavedPrice: false,
        unsavedName: false
      }));
    } catch (err) {
      error = err instanceof Error ? err.message : 'Failed to load AI agent gyms';
    } finally {
      loading = false;
    }
  }

  let refreshIntervals: { [key: string]: number } = {};

  // Cleanup intervals on component destroy
  onDestroy(() => {
    Object.values(refreshIntervals).forEach((interval) => {
      clearInterval(interval);
    });
  });

  function navigateToGymDetail(pool: ExtendedPool) {
    // Navigate to the gym detail page using querystring
    goto(`/app/forge/gym?id=${pool._id}`);
  }

  async function refreshPoolData(poolId: string) {
    if (refreshingPools.has(poolId)) return;

    try {
      refreshingPools.add(poolId);
      refreshingPools = refreshingPools; // Trigger reactivity

      // Create a promise that resolves after 1 second
      const minDelay = new Promise((resolve) => setTimeout(resolve, 1000));

      // Run the refresh and delay in parallel
      const [updatedPool] = await Promise.all([refreshPool(poolId), minDelay]);

      // Update the pool in the list
      trainingPools = trainingPools.map((pool) =>
        pool._id === poolId ? { ...pool, ...updatedPool, expanded: true } : pool
      );
    } catch (err) {
      console.error('Failed to refresh gym:', err);
    } finally {
      refreshingPools.delete(poolId);
      refreshingPools = refreshingPools; // Trigger reactivity
    }
  }

  async function handleUpdatePool(pool: ExtendedPool, updates: any) {
    try {
      await updatePool({
        id: pool._id,
        ...updates
      });
      loadPools();
    } catch (err) {
      error = err instanceof Error ? err.message : 'Failed to update AI agent gym';
    }
  }
</script>

<div class="h-full space-y-6 p-4 bg-black backdrop-blur-sm min-h-screen">
  <div class="relative">
    <div
      class="absolute inset-0 bg-gradient-to-r from-secondary-600/5 to-primary-600/5 rounded-3xl blur-3xl -z-10">
    </div>
    <div class="flex justify-between items-center mb-2">
      <h2
        class="text-3xl font-light bg-gradient-to-r from-secondary-200 to-secondary-400 bg-clip-text text-transparent animate-gradient">
        Forge
      </h2>
    </div>
    <p class="text-gray-300 text-lg font-light">
      Collect crowd-powered demonstrations, perfect for training AI agents.
    </p>
  </div>

  {#if error}
    <div
      class="p-4 bg-red-500/10 text-red-400 rounded-lg backdrop-blur-sm border border-red-500/10 animate-fade-in">
      {error}
    </div>
  {/if}

  {#if !$walletAddress}
    <div
      class="bg-gradient-to-br from-primary-600/90 to-secondary-600/90 rounded-2xl p-10 mx-auto flex max-w-lg gap-10 flex-col text-white backdrop-blur-md border border-white/5 shadow-2xl hover:shadow-secondary-500/10 transition-all duration-500">
      <h1 class="align-middle text-center text-2xl font-light">
        Please connect your wallet to use the Forge.
      </h1>
      <div class="align-middle w-fit mx-auto">
        <WalletButton variant="large" />
      </div>
    </div>
  {:else if loading}
    <div class="w-full mx-auto text-center">
      <div class="mb-6 mx-auto relative">
        <div class="absolute inset-0 bg-secondary-500/10 rounded-full blur-xl animate-pulse"></div>
        <RefreshCw size={48} class="text-secondary-300/80 mx-auto animate-spin relative z-10" />
      </div>
      <p class="text-lg font-light text-gray-300">Loading Forge Gyms</p>
    </div>
  {:else if trainingPools.length === 0}
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
      <!-- Create New Gym Card -->
      <Card
        variant="secondary"
        padding="md"
        className="h-full flex flex-col border-2 border-dashed border-secondary-300/20 bg-gradient-to-br from-primary-600/5 to-secondary-600/5 backdrop-blur-sm hover:bg-secondary-600/10 hover:border-secondary-300/30 transition-all duration-300 group relative overflow-hidden">
        <div
          class="absolute inset-0 bg-gradient-to-br from-secondary-600/5 to-primary-600/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500">
        </div>
        <div
          class="flex flex-col h-full items-center justify-center cursor-pointer relative z-10"
          role="button"
          tabindex="0"
          onkeydown={() => (showGenerateGymModal = true)}
          onclick={() => (showGenerateGymModal = true)}>
          <div
            class="rounded-full bg-gradient-to-br from-secondary-600/20 to-secondary-700/20 w-24 h-24 flex items-center justify-center mb-4 duration-300 transform transition-all group-hover:scale-110 group-hover:from-secondary-600/30 group-hover:to-secondary-700/30 relative">
            <div
              class="absolute inset-0 bg-secondary-600/20 rounded-full blur-xl group-hover:blur-2xl transition-all duration-500">
            </div>
            <span
              class="text-5xl text-secondary-300/80 font-light transition-colors duration-300 relative z-10">
              +
            </span>
          </div>
          <div
            class="text-lg font-light text-secondary-300/80 group-hover:text-secondary-200 transition-colors duration-300">
            Create New Gym
          </div>
          <p
            class="text-sm text-gray-400 text-center mt-2 group-hover:text-gray-300 transition-colors duration-300 font-light">
            Start collecting demonstrations for your AI agent training
          </p>
        </div>
      </Card>
    </div>
    <div class="text-center text-gray-400 py-8 font-light">
      No AI agent gyms found. Create one to get started!
    </div>
  {:else}
    {#key trainingPools}
      {@const sortedPools = [...trainingPools].sort((a, b) => {
        if (a.status === TrainingPoolStatus.live && b.status !== TrainingPoolStatus.live) return -1;
        if (a.status !== TrainingPoolStatus.live && b.status === TrainingPoolStatus.live) return 1;
        const dateA = new Date(a.createdAt || 0);
        const dateB = new Date(b.createdAt || 0);
        return dateB.getTime() - dateA.getTime();
      })}

      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
        <!-- Create New Gym Card -->
        <Card
          variant="secondary"
          padding="md"
          className="h-full flex flex-col border-2 border-dashed border-secondary-300/20 bg-gradient-to-br from-primary-600/5 to-secondary-600/5 backdrop-blur-sm hover:bg-secondary-600/10 hover:border-secondary-300/30 transition-all duration-300 group relative overflow-hidden">
          <div
            class="absolute inset-0 bg-gradient-to-br from-secondary-600/5 to-primary-600/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500">
          </div>
          <div
            class="flex flex-col h-full items-center justify-center cursor-pointer relative z-10"
            role="button"
            tabindex="0"
            onkeydown={() => (showGenerateGymModal = true)}
            onclick={() => (showGenerateGymModal = true)}>
            <div
              class="rounded-full bg-gradient-to-br from-secondary-600/20 to-secondary-700/20 w-24 h-24 flex items-center justify-center mb-4 duration-300 transform transition-all group-hover:scale-110 group-hover:from-secondary-600/30 group-hover:to-secondary-700/30 relative">
              <div
                class="absolute inset-0 bg-secondary-600/20 rounded-full blur-xl group-hover:blur-2xl transition-all duration-500">
              </div>
              <span
                class="text-5xl text-secondary-300/80 font-light transition-colors duration-300 relative z-10">
                +
              </span>
            </div>
            <div
              class="text-lg font-light text-secondary-300/80 group-hover:text-secondary-200 transition-colors duration-300">
              Create New Gym
            </div>
            <p
              class="text-sm text-gray-400 text-center mt-2 group-hover:text-gray-300 transition-colors duration-300 font-light">
              Start collecting demonstrations for your AI agent training
            </p>
          </div>
        </Card>

        {#each sortedPools as pool (pool._id)}
          <div
            class="cursor-pointer transform transition-all duration-300 hover:scale-[1.02]"
            role="button"
            tabindex="0"
            onkeydown={() => navigateToGymDetail(pool)}
            onclick={() => navigateToGymDetail(pool)}>
            <Card
              variant="secondary"
              padding="md"
              className="h-full flex flex-col bg-gradient-to-br from-primary-600/5 to-secondary-600/5 backdrop-blur-sm hover:bg-secondary-600/10 border border-secondary-300/10 hover:border-secondary-300/20 transition-all duration-300 relative overflow-hidden group">
              <div
                class="absolute inset-0 bg-gradient-to-br from-secondary-600/5 to-primary-600/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500">
              </div>
              <div class="flex flex-col h-full transition-opacity duration-300 relative z-10">
                <!-- Gym Name -->
                <div
                  class="font-title text-xl mb-2 truncate bg-gradient-to-r from-secondary-200 to-secondary-400 bg-clip-text text-transparent font-light {pool.status !==
                  TrainingPoolStatus.live
                    ? 'opacity-50'
                    : ''}">
                  {pool.name}
                </div>

                <!-- Status Badge -->
                <div class="flex items-center gap-1 mb-3">
                  <div
                    class="flex items-center gap-1 px-3 py-1 text-xs rounded-full backdrop-blur-sm font-light {pool.status ===
                    TrainingPoolStatus.live
                      ? 'bg-green-500/10 text-green-400 border border-green-500/10'
                      : pool.status === TrainingPoolStatus.paused
                        ? 'bg-gray-500/10 text-gray-400 border border-gray-500/10'
                        : 'bg-yellow-500/10 text-yellow-400 border border-yellow-500/10'}">
                    <div
                      class="w-1.5 h-1.5 rounded-full {pool.status === TrainingPoolStatus.live
                        ? 'bg-green-400 animate-pulse'
                        : pool.status === TrainingPoolStatus.paused
                          ? 'bg-gray-400'
                          : 'bg-yellow-400 animate-pulse'}">
                    </div>
                    {#if pool.status === TrainingPoolStatus.paused}
                      paused
                    {:else if pool.status === TrainingPoolStatus.noFunds}
                      no funds
                    {:else if pool.status === TrainingPoolStatus.noGas}
                      no gas
                    {:else}
                      live
                    {/if}
                  </div>
                </div>

                <!-- Stats -->
                <div class="mt-auto">
                  <div class="flex items-center justify-between mt-2">
                    <div class="text-sm font-light text-secondary-300/80">
                      {(pool.tokenBalance || 0).toLocaleString()}
                      <span class="font-light text-secondary-400/80">{pool.token.symbol}</span>
                    </div>
                    <div class="text-sm text-gray-400 font-light">Pool Balance</div>
                  </div>

                  <!-- Possible demos calculation -->
                  {#if pool.pricePerDemo && pool.pricePerDemo > 0}
                    {@const possibleDemos = Math.floor(
                      (pool.tokenBalance || 0) / pool.pricePerDemo
                    )}
                    {@const totalDemos = pool.demonstrations + possibleDemos}
                    {@const demoPercentage =
                      totalDemos > 0 ? Math.min(100, (pool.demonstrations / totalDemos) * 100) : 0}

                    <div class="mt-2">
                      <div
                        class="flex items-center justify-between text-xs text-gray-400 mb-1 font-light">
                        <span>Uploads / Remaining Demos</span>
                        <span>
                          {pool.demonstrations.toLocaleString()} / {possibleDemos.toLocaleString()}
                        </span>
                      </div>
                      <div
                        class="w-full bg-gray-800/30 rounded-full h-1.5 backdrop-blur-sm relative overflow-hidden">
                        <div
                          class="absolute inset-0 bg-gradient-to-r from-secondary-600/20 to-secondary-700/20 animate-shimmer">
                        </div>
                        <div
                          class="bg-gradient-to-r from-secondary-400/80 to-secondary-500/80 h-1.5 rounded-full transition-all duration-500 relative z-10"
                          style="width: {demoPercentage}%">
                        </div>
                      </div>
                    </div>
                  {/if}

                  <div class="flex justify-end mt-2">
                    <button
                      class="text-secondary-400/80 text-sm flex items-center gap-1 cursor-pointer hover:text-secondary-300/80 transition-colors duration-300 focus:outline-none group font-light">
                      View Details
                      <div
                        class="text-gray-500/80 group-hover:text-gray-400/80 transition-colors duration-300">
                        <ChevronRight size={16} />
                      </div>
                    </button>
                  </div>
                </div>
              </div>
            </Card>
          </div>
        {/each}
      </div>
    {/key}
  {/if}
</div>

<!-- Use GenerateGymModal for gym creation -->
<GenerateGymModal
  show={showGenerateGymModal}
  skills={currentSkills}
  on:change={(e) => (currentSkills = e.detail.skills)}
  on:close={() => (showGenerateGymModal = false)}
  on:save={async (event) => {
    try {
      if (!$walletAddress) return;

      const generatedResponse = event.detail.generatedResponse;
      if (generatedResponse?.content) {
        const { name, apps } = generatedResponse.content;

        // Create pool with the generated apps and name
        await createPoolWithApps({
          name,
          skills: currentSkills,
          token: {
            type: 'VIRAL',
            symbol: 'VIRAL',
            address: import.meta.env.VITE_VIRAL_TOKEN_ADDRESS
          },
          apps,
          ownerAddress: $walletAddress
        });

        currentSkills = '';
        showGenerateGymModal = false;
        loadPools();
      }
    } catch (err) {
      error = err instanceof Error ? err.message : 'Failed to create AI agent gym';
    }
  }} />

<style>
  @keyframes shimmer {
    0% {
      transform: translateX(-100%);
    }
    100% {
      transform: translateX(100%);
    }
  }

  .animate-shimmer {
    animation: shimmer 2s infinite;
  }

  @keyframes gradient {
    0% {
      background-position: 0% 50%;
    }
    50% {
      background-position: 100% 50%;
    }
    100% {
      background-position: 0% 50%;
    }
  }

  .animate-gradient {
    background-size: 200% auto;
    animation: gradient 8s ease infinite;
  }

  @keyframes fade-in {
    from {
      opacity: 0;
      transform: translateY(-10px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

  .animate-fade-in {
    animation: fade-in 0.3s ease-out;
  }
</style>
