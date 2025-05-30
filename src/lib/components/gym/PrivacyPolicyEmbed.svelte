<script lang="ts">
  import PrivacyPolicy from '../PrivacyPolicy.svelte';

  let { privacyAccepted, class: className }: { privacyAccepted: () => boolean; class?: string } =
    $props();
</script>

{#if privacyAccepted()}
  <a
    href={import.meta.env.VITE_PRIVACY_POLICY_URL}
    class="text-secondary-300 hover:underline"
    target="_blank">
    View Privacy Policy
  </a>
{:else}
  <div class={className}>
    <PrivacyPolicy class={className} />
  </div>
{/if}
