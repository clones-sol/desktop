<script lang="ts">
  import { uploadManager } from '$lib/stores/misc';
  import Button from '$lib/components/form/Button.svelte';

  let { open = $bindable(), uploader }: { open: boolean; uploader: () => Promise<void> } = $props();
  const onCancel = async () => {
    open = false;
    await $uploadManager.setUploadDataAllowed(false);
  };
  const onConfirm = async () => {
    open = false;
    await $uploadManager.setUploadDataAllowed(true);
    await uploader();
  };
</script>

{#if open}
  <div class="fixed inset-0 z-50 flex items-center justify-center bg-black/50">
    <div class="bg-white rounded-lg shadow-lg p-6 max-w-md w-full">
      <h2 class="text-xl font-semibold mb-4">Confirm Upload</h2>
      <p class="text-gray-700 mb-6">
        Before uploading your recording, make sure you've read the <a
          href={import.meta.env.VITE_PRIVACY_POLICY_URL}
          target="_blank"
          class="hover:underline text-secondary-300">
          Privacy Policy.
        </a>
      </p>
      <p class="text-gray-500 text-sm mb-6">
        By uploading your recording data, you give Viralmind permission to process and train AI
        agents with it.
      </p>
      <div class="flex justify-end gap-3">
        <Button variant="secondary" onclick={onCancel}>Cancel</Button>
        <Button variant="primary" onclick={onConfirm}>Confirm</Button>
      </div>
    </div>
  </div>
{/if}
