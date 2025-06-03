<script lang="ts">
  import type { Token, TokenType } from '$lib/types/forge';
  import { fade } from 'svelte/transition';
  import Button from '$lib/components/form/Button.svelte';
  import Input from '$lib/components/form/Input.svelte';
  import TextArea from '$lib/components/form/TextArea.svelte';

  const {
    show = false,
    onClose = () => {},
    onCreate = (data: { name: string; skills: string; token: Token }) => {},
    initialSkills = ''
  } = $props();

  let name = $state('');
  let skills = $state('');
  let selectedTokenType: TokenType = $state('VIRAL');
  let customTokenAddress = $state('');

  const DEFAULT_ADDRESSES = {
    SOL: 'So11111111111111111111111111111111111111112',
    VIRAL: import.meta.env.VITE_VIRAL_TOKEN_ADDRESS
  };

  const tokenOptions: { type: TokenType; symbol: string; disabled?: boolean }[] = [
    { type: 'VIRAL', symbol: 'VIRAL' },
    { type: 'SOL', symbol: 'SOL', disabled: true },
    { type: 'CUSTOM', symbol: 'Custom Token', disabled: true }
  ];

  function handleSubmit() {
    const token: Token =
      selectedTokenType === 'CUSTOM'
        ? { type: 'CUSTOM', symbol: 'SOL', address: customTokenAddress }
        : {
            type: selectedTokenType,
            symbol: selectedTokenType,
            address: DEFAULT_ADDRESSES[selectedTokenType]
          };

    onCreate({ name, skills, token });
    resetForm();
  }

  function handleClose() {
    resetForm();
    onClose();
  }

  function resetForm() {
    name = '';
    skills = initialSkills || '';
    selectedTokenType = 'VIRAL';
    customTokenAddress = '';
  }

  // When the modal is shown, initialize skills with initialSkills
  $effect(() => {
    if (show) {
      skills = initialSkills;
    }
  });
</script>

{#if show}
  <div
    class="fixed inset-0 bg-black/50 flex items-center justify-center z-50"
    transition:fade={{ duration: 100 }}>
    <div class="bg-gray-900 rounded-xl w-full max-w-lg p-6 space-y-4">
      <h2 class="text-xl font-bold text-white">Create AI Agent Gym</h2>

      <form onsubmit={(e) => e.preventDefault()} class="space-y-4">
        <div>
          <label for="pool-name" class="block text-sm font-semibold text-gray-300 mb-1">
            Gym Name
          </label>
          <Input
            id="pool-name"
            type="text"
            bind:value={name}
            class="w-full p-2 bg-gray-800 rounded-lg text-white border border-gray-700 focus:border-secondary-300 focus:outline-none"
            placeholder="Enter gym name..."
            required />
        </div>

        <div>
          <label for="skill-list" class="block text-sm font-semibold text-gray-300 mb-1">
            Skills to Train
          </label>
          <TextArea
            id="skill-list"
            bind:value={skills}
            placeholder="List the skills you want to train your AI agent on (one per line)..."
            required>
          </TextArea>
        </div>

        <div>
          <span class="block text-sm font-semibold text-gray-300 mb-1">Treasury Token</span>
          <div class="space-y-2">
            {#each tokenOptions as option}
              <label
                class="flex items-center gap-2 {option.disabled
                  ? 'text-gray-500 cursor-not-allowed'
                  : 'text-gray-300 cursor-pointer'}">
                <input
                  type="radio"
                  bind:group={selectedTokenType}
                  value={option.type}
                  disabled={option.disabled}
                  class="text-secondary-300 focus:ring-secondary-300 disabled:opacity-50" />
                <span>{option.symbol}</span>
                {#if option.disabled}
                  <span class="text-xs text-gray-500">(coming soon)</span>
                {/if}
              </label>
            {/each}

            {#if selectedTokenType === 'CUSTOM'}
              <Input
                type="text"
                bind:value={customTokenAddress}
                placeholder="Enter token contract address..."
                required />
            {/if}
          </div>
        </div>

        <div class="flex justify-end gap-2 pt-4">
          <Button
            type="button"
            class="hover:bg-gray-800! hover:text-white! py-2!"
            onclick={handleClose}>
            Cancel
          </Button>
          <a
            href={`/new-gym?name=${encodeURIComponent(name)}&skills=${encodeURIComponent(skills)}&tokenType=${encodeURIComponent(selectedTokenType)}&tokenAddress=${encodeURIComponent(selectedTokenType === 'CUSTOM' ? customTokenAddress : DEFAULT_ADDRESSES[selectedTokenType])}`}
            target="_blank"
            class="inline-block">
            <Button type="button" class="hover:bg-gray-800! hover:text-white! py-2!">
              Create Gym
            </Button>
          </a>
        </div>
      </form>
    </div>
  </div>
{/if}
