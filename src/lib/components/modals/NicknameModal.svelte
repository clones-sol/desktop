<script lang="ts">
  import Button from '$lib/components/form/Button.svelte';
  import { setNickname } from '$lib/api/endpoints/wallet';
  import { walletAddress, nickname } from '$lib/stores';
  import Input from '../form/Input.svelte';
  import { onMount } from 'svelte';

  let newNick = $state('');

  let { open = $bindable(false), oldNick }: { open: boolean; oldNick?: string } = $props();
  onMount(() => {
    if (oldNick) newNick = oldNick;
  });
  const onCancel = async () => {
    open = false;
  };
  const onConfirm = async () => {
    open = false;
    if (newNick && $walletAddress) {
      oldNick = newNick;
      $nickname = await setNickname($walletAddress, newNick);
    }
  };
</script>

{#if open}
  <div class="fixed inset-0 z-50 flex items-center justify-center bg-black/50">
    <div class="bg-white rounded-lg shadow-lg p-6 max-w-md w-full">
      <h2 class="text-xl font-semibold mb-4">Set Nickname</h2>
      <p class="text-gray-700 mb-2">
        Set your nickname to be displayed on the demonstrator leaderboard.
      </p>
      <p class="text-gray-500 mb-2">Maximum length of 25 characters. Make it memorable!</p>
      <Input
        type="text"
        bind:value={newNick}
        variant="light"
        placeholder="JohnDoe23"
        maxlength={25} />
      <div class="flex justify-end gap-3 mt-6">
        <Button variant="secondary" onclick={onCancel}>Cancel</Button>
        <Button variant="primary" onclick={onConfirm}>Save</Button>
      </div>
    </div>
  </div>
{/if}
