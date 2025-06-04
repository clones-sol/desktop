import posthog from 'posthog-js';
import { browser } from '$app/environment';
// Tauri doesn't have a Node.js server to do proper SSR
// so we will use adapter-static to prerender the app (SSG)
// See: https://v2.tauri.app/start/frontend/sveltekit/ for more info
export const prerender = true;
export const ssr = false;

const POSTHOG_API_KEY = import.meta.env.VITE_POSTHOG_API_KEY;
const POSTHOG_API_HOST = import.meta.env.VITE_POSTHOG_API_HOST;

export const load = async () => {
  if (browser) {
    posthog.init(POSTHOG_API_KEY, {
      api_host: POSTHOG_API_HOST,
      person_profiles: 'identified_only', // or 'always' to create profiles for anonymous users as well
      capture_pageview: false,
      capture_exceptions: true
    });
  }
  return;
};
