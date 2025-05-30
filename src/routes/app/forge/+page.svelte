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

<div class="h-full space-y-6 p-4">
  <div>
    <div class="flex justify-between items-center mb-2">
      <h2 class="text-2xl font-bold">Forge</h2>
    </div>
    <p class="text-gray-400">
      Collect crowd-powered demonstrations, perfect for training AI agents.
    </p>
  </div>

  {#if error}
    <div class="p-4 bg-red-500/10 text-red-500 rounded-lg">
      {error}
    </div>
  {/if}

  {#if !$walletAddress}
    <div class="bg-primary-400 rounded-xl p-10 mx-auto flex max-w-lg gap-10 flex-col text-white">
      <h1 class="align-middle text-center">Please connect your wallet to use the Forge.</h1>
      <div class="align-middle w-fit mx-auto">
        <WalletButton variant="large" />
      </div>
    </div>
  {:else if loading}
    <div class="w-full mx-auto text-center">
      <div class="mb-6 mx-auto">
        <RefreshCw size={48} class="text-secondary-300 mx-auto animate-spin" />
      </div>
      <p class="text-lg font-medium text-gray-800">Loading Forge Gyms</p>
    </div>
  {:else if trainingPools.length === 0}
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
      <!-- Create New Gym Card -->
      <Card
        variant="secondary"
        padding="md"
        className="h-full flex flex-col border-2 border-dashed border-gray-300 bg-gray-50 hover:bg-gray-100 hover:border-secondary-300 transition-all duration-300">
        <div
          class="flex flex-col h-full items-center justify-center cursor-pointer"
          role="button"
          tabindex="0"
          onkeydown={() => (showGenerateGymModal = true)}
          onclick={() => (showGenerateGymModal = true)}>
          <div
            class="rounded-full bg-gray-200 w-24 h-24 flex items-center justify-center mb-4 duration-300 transform transition-all">
            <span class="text-5xl text-gray-500 font-light transition-colors duration-300">+</span>
          </div>
          <div
            class="text-lg font-medium text-gray-600 group-hover:text-gray-800 transition-colors duration-300">
            Create New Gym
          </div>
          <p
            class="text-sm text-gray-500 text-center mt-2 group-hover:text-gray-600 transition-colors duration-300">
            Start collecting demonstrations for your AI agent training
          </p>
        </div>
      </Card>
    </div>
    <div class="text-center text-gray-400 py-8">
      No AI agent gyms found. Create one to get started!
    </div>
  {:else}
    <!-- Sort pools: live status first, then by creation date (newest first) -->
    {#key trainingPools}
      {@const sortedPools = [...trainingPools].sort((a, b) => {
        // First sort by status (live first)
        if (a.status === TrainingPoolStatus.live && b.status !== TrainingPoolStatus.live) return -1;
        if (a.status !== TrainingPoolStatus.live && b.status === TrainingPoolStatus.live) return 1;

        // Then sort by createdAt (newest first)
        const dateA = new Date(a.createdAt || 0);
        const dateB = new Date(b.createdAt || 0);
        return dateB.getTime() - dateA.getTime();
      })}

      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
        <!-- Create New Gym Card -->
        <Card
          variant="secondary"
          padding="md"
          className="h-full flex flex-col border-2 border-dashed border-gray-300 bg-gray-50 hover:bg-gray-100 hover:border-secondary-300 transition-all duration-300">
          <div
            class="flex flex-col h-full items-center justify-center cursor-pointer"
            role="button"
            tabindex="0"
            onkeydown={() => (showGenerateGymModal = true)}
            onclick={() => (showGenerateGymModal = true)}>
            <div
              class="rounded-full bg-gray-200 w-24 h-24 flex items-center justify-center mb-4 duration-300 transform transition-all">
              <span class="text-5xl text-gray-500 font-light transition-colors duration-300">
                +
              </span>
            </div>
            <div
              class="text-lg font-medium text-gray-600 group-hover:text-gray-800 transition-colors duration-300">
              Create New Gym
            </div>
            <p
              class="text-sm text-gray-500 text-center mt-2 group-hover:text-gray-600 transition-colors duration-300">
              Start collecting demonstrations for your AI agent training
            </p>
          </div>
        </Card>

        {#each sortedPools as pool (pool._id)}
          <div
            class="cursor-pointer"
            role="button"
            tabindex="0"
            onkeydown={() => navigateToGymDetail(pool)}
            onclick={() => navigateToGymDetail(pool)}>
            <Card
              variant="secondary"
              padding="md"
              className="h-full flex flex-col hover:bg-white hover:shadow-lg! transition-shadow duration-300">
              <div class="flex flex-col h-full transition-opacity duration-300">
                <!-- Gym Name -->
                <div
                  class="font-title text-lg mb-2 truncate {pool.status !== TrainingPoolStatus.live
                    ? 'opacity-50'
                    : ''}">
                  {pool.name}
                </div>

                <!-- Status Badge -->
                <div class="flex items-center gap-1 mb-3">
                  <div
                    class="flex items-center gap-1 px-2 py-0.5 text-xs rounded-full {pool.status ===
                    TrainingPoolStatus.live
                      ? 'bg-green-500/10 text-green-500'
                      : pool.status === TrainingPoolStatus.paused
                        ? 'bg-gray-500/10 text-gray-500'
                        : 'bg-yellow-500/10 text-yellow-600'}">
                    <div
                      class="w-1.5 h-1.5 rounded-full {pool.status === TrainingPoolStatus.live
                        ? 'bg-green-500 animate-pulse'
                        : pool.status === TrainingPoolStatus.paused
                          ? 'bg-gray-500'
                          : 'bg-yellow-500 animate-pulse'}">
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
                    <div class="text-sm font-medium">
                      {(pool.tokenBalance || 0).toLocaleString()}
                      <span class="font-medium">{pool.token.symbol}</span>
                    </div>
                    <div class="text-sm text-gray-500">Pool Balance</div>
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
                      <div class="flex items-center justify-between text-xs text-gray-500 mb-1">
                        <span>Uploads / Remaining Demos</span>
                        <span>
                          {pool.demonstrations.toLocaleString()} / {possibleDemos.toLocaleString()}
                        </span>
                      </div>
                      <div class="w-full bg-gray-200 rounded-full h-1.5">
                        <div
                          class="bg-gradient-to-br from-secondary-500 to-secondary-200 h-1.5 rounded-full"
                          style="width: {demoPercentage}%">
                        </div>
                      </div>
                    </div>
                  {/if}

                  <div class="flex justify-end mt-2">
                    <button
                      class="text-secondary-500 text-sm flex items-center gap-1 cursor-pointer hover:underline hover:text-blue-600 focus:outline-none"
                      onclick={(e) => {
                        e.stopPropagation();
                        navigateToGymDetail(pool);
                      }}>
                      View Details
                      <div class="text-gray-400">
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
