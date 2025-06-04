<script lang="ts">
  import Card from '../Card.svelte';
  import CopyButton from '../CopyButton.svelte';
  import { AlertTriangle, LoaderCircle, Check } from 'lucide-svelte';
  import { TrainingPoolStatus, type TrainingPool } from '$lib/types/forge';
  import Input from '../form/Input.svelte';
  import Button from '../form/Button.svelte';
  import { showToast } from '$lib/utils';
  import { ApiError, updatePoolEmail } from '$lib/api';
  import { onMount } from 'svelte';

  let {
    pool
  }: {
    pool: TrainingPool & {
      unsavedSkills?: boolean;
      unsavedPrice?: boolean;
      unsavedName?: boolean;
    };
  } = $props();

  type EmailSaveStatus = 'idle' | 'loading' | 'saved' | 'error';
  let emailSaveStatus = $state<EmailSaveStatus>('idle');
  let email = $state('');
  let lastSuccessfullySavedEmail = $state('');

  onMount(() => {
    email = pool.ownerEmail || '';
    lastSuccessfullySavedEmail = pool.ownerEmail || '';
    if (pool.ownerEmail) {
      emailSaveStatus = 'idle'; // Or 'saved' if we want to show it as saved initially
    }
  });

  const isLoading = $derived(emailSaveStatus === 'loading');

  function formatNumber(num: number) {
    return num.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  }

  async function saveEmail() {
    if (!email || email === lastSuccessfullySavedEmail) return;
    emailSaveStatus = 'loading';
    try {
      await updatePoolEmail(pool._id, email);
      emailSaveStatus = 'saved';
      lastSuccessfullySavedEmail = email;
      showToast(
        'Email Saved',
        'You will now get email notifications when your gym runs out of funds!',
        { timeout: 4000 }
      );
      // Revert to idle after a delay to show 'Saved' state
      setTimeout(() => {
        // Only revert if it's still 'saved' (user hasn't changed email again)
        if (emailSaveStatus === 'saved') {
          emailSaveStatus = 'idle';
        }
      }, 3000);
    } catch (e) {
      emailSaveStatus = 'error';
      if ((e as ApiError).status === 400) {
        showToast(
          'Error Saving Email',
          'There was an error validating your email. Make sure you entered it correctly.',
          { timeout: 4000 }
        );
      } else {
        if ((e as ApiError).status === 409) {
          showToast('No changes made', 'This email is already associated with this gym.', {
            timeout: 4000
          });
        } else {
          showToast('Error Saving Email', 'An unexpected error occurred. Please try again.', {
            timeout: 4000
          });
        }
      }
      // Revert to idle after a delay to allow user to see error and try again
      setTimeout(() => {
        if (emailSaveStatus === 'error') {
          emailSaveStatus = 'idle';
        }
      }, 5000);
    }
  }

  $effect(() => {
    if (
      email !== lastSuccessfullySavedEmail &&
      (emailSaveStatus === 'saved' || emailSaveStatus === 'error')
    ) {
      emailSaveStatus = 'idle';
    }
  });
</script>

<div class="space-y-6">
  <!-- Gym Overview Card -->
  <Card
    padding="md"
    className="border border-gray-200 hover:shadow-md transition-shadow duration-300">
    <div>
      <div class="flex items-center justify-between mb-4">
        <h3 class="text-xl font-bold">{pool.name}</h3>
      </div>

      <!-- Key Stats -->
      <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
        <div class="bg-blue-50 p-4 rounded-lg">
          <div class="text-sm text-blue-800">Total Demonstrations</div>
          <div class="text-2xl font-bold text-blue-900">{pool.demonstrations.toLocaleString()}</div>
        </div>
        <div class="bg-purple-50 p-4 rounded-lg">
          <div class="text-sm text-purple-800">Reward Per Demo</div>
          <div class="text-2xl font-bold text-purple-900">
            {pool.pricePerDemo || 1}
            {pool.token.symbol}
          </div>
        </div>

        <div class="bg-green-50 p-4 rounded-lg">
          <div class="text-sm text-green-800">Pool Balance</div>
          <div class="text-2xl font-bold text-green-900">
            {formatNumber(pool.funds)}
            {pool.token.symbol}
          </div>
        </div>
        <div class="bg-yellow-50 p-4 rounded-lg">
          <div class="text-sm text-yellow-800">Gas Balance</div>
          <div class="text-2xl font-bold text-yellow-900">
            {formatNumber(pool.solBalance)}
            SOL
          </div>
        </div>
      </div>
    </div>

    <!-- Summary Data -->
    <div class="py-2">
      <h4 class="text-sm font-bold text-gray-700 mb-2">Deposit Address</h4>
      <div class="flex gap-2 items-center">
        <input
          type="text"
          class="flex-1 p-2 bg-gray-100 rounded-lg cursor-text text-sm"
          readonly
          value={pool.depositAddress} />
        <CopyButton content={pool.depositAddress} />
      </div>
      <p class="text-xs text-gray-500 mt-1">
        Send {pool.token.symbol} tokens to this address to fund your gym.
      </p>
    </div>
    <div class="py-2">
      <div class="">
        <h3 class="text-xl font-bold">Notifications</h3>
        <p class="py-2">Get an email when your gym runs out of $VIRAL or SOL for gas fees.</p>
        <form
          onsubmit={(e) => {
            e.preventDefault();
            if (isLoading) return;
            saveEmail();
          }}
          class="w-full flex gap-2">
          <Input
            bind:value={email}
            type="email"
            variant="light"
            class="flex-1"
            required
            placeholder="example@example.com" />
          <Button
            class="bg-secondary-500! hover:bg-secondary-600! min-w-[80px] text-center"
            type="submit"
            behavior="none"
            disabled={isLoading ||
              !email ||
              (email === lastSuccessfullySavedEmail &&
                emailSaveStatus !== 'idle' &&
                emailSaveStatus !== 'error')}>
            {#if emailSaveStatus === 'loading'}
              <LoaderCircle class="w-6 h-6 mx-auto animate-spin" />
            {:else if emailSaveStatus === 'saved'}
              <div class="flex items-center justify-center">
                <Check class="w-5 h-5 mr-1" /> Saved
              </div>
            {:else}
              Save
            {/if}
          </Button>
        </form>
      </div>
    </div>
  </Card>

  <!-- Status Section -->
  {#if pool.status === TrainingPoolStatus.noGas || pool.status === TrainingPoolStatus.noFunds}
    <div class="p-4 my-3 bg-amber-50 border-l-4 border-amber-400 rounded-lg flex gap-3 shadow-sm">
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
            Your gym needs VIRAL tokens to reward users who provide demonstrations. Without funds,
            users won't receive compensation.
          </p>
        {/if}
        <p class="text-xs text-amber-800 font-medium mt-2">
          Deposit {pool.status === TrainingPoolStatus.noGas ? 'SOL' : 'VIRAL'} to the address above to
          activate your gym and start collecting data.
        </p>
      </div>
    </div>
  {/if}
</div>
