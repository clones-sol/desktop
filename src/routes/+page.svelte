<script lang="ts">
  import { goto } from '$app/navigation';
  import { getPlatform } from '$lib/utils';
  import { invoke } from '@tauri-apps/api/core';
  import { onMount } from 'svelte';
  import { info, warn, debug, trace, error, attachConsole } from '@tauri-apps/plugin-log';

  function serializeArg(arg: any) {
    if (typeof arg === 'object' && arg !== null) {
      try {
        return JSON.stringify(arg, null, 2); // Pretty-print objects/arrays
      } catch {
        return String(arg);
      }
    }
    return String(arg);
  }

  function serializeArgs(args: any) {
    return args.map(serializeArg).join(' ');
  }

  console.log = (...args) => info(serializeArgs(args));
  console.warn = (...args) => warn(serializeArgs(args));
  console.error = (...args) => error(serializeArgs(args));
  console.debug = (...args) => debug(serializeArgs(args));
  console.trace = (...args) => trace(serializeArgs(args));

  onMount(async () => {
    attachConsole();
    try {
      if ((await getPlatform()) === 'macos') {
        // Check if accessibility permissions are already granted
        const hasPerms = (await invoke('has_ax_perms')) && (await invoke('has_record_perms'));
        const onboardingComplete = await invoke('get_onboarding_complete');

        if (!onboardingComplete) {
          goto('/onboarding');
          return;
        }

        // If permissions are not granted but we've already onboarded, show the ax page
        if (!hasPerms && onboardingComplete) {
          goto('/onboarding/ax');
          return;
        }
      }

      // Otherwise, go to the main app
      goto('/app/gym');
    } catch (error) {
      console.error('Error during startup:', error);
      // If there's an error, default to the main app
      goto('/app/gym');
    }
  });
</script>
