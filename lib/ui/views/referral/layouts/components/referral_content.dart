import 'package:clones_desktop/application/session/provider.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/views/referral/bloc/provider.dart';
import 'package:clones_desktop/ui/views/referral/bloc/state.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_code_card.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_header.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_instructions_card.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_stats_card.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/wallet_connection_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReferralContent extends ConsumerStatefulWidget {
  const ReferralContent({super.key});

  @override
  ConsumerState<ReferralContent> createState() => _ReferralContentState();
}

class _ReferralContentState extends ConsumerState<ReferralContent> {
  String? _previousWalletAddress;
  bool _hasTriedLoading = false;
  bool _hasShownConfirmation = false;

  @override
  Widget build(BuildContext context) {
    final sessionState = ref.watch(sessionNotifierProvider);
    final referralState = ref.watch(referralNotifierProvider);

    // Listen to session changes within the build method
    ref.listen(sessionNotifierProvider, (previous, next) {
      final currentWalletAddress = next.address;
      if (currentWalletAddress != _previousWalletAddress) {
        _previousWalletAddress = currentWalletAddress;
        _hasTriedLoading = false;
        _hasShownConfirmation = false;

        // Auto-load existing referral info when wallet is connected
        if (currentWalletAddress != null && !_hasTriedLoading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref
                .read(referralNotifierProvider.notifier)
                .getReferralInfo(currentWalletAddress);
            _hasTriedLoading = true;
          });
        }
      }
    });

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const ReferralHeader(),
          const SizedBox(height: 32),

          // Content based on wallet connection status
          if (!sessionState.isConnected)
            const WalletConnectionSection()
          else
            _buildReferralInfoSection(context, referralState),
        ],
      ),
    );
  }

  Widget _buildReferralInfoSection(
    BuildContext context,
    ReferralState referralState,
  ) {
    return Expanded(
      child: _buildReferralStateWidget(context, referralState),
    );
  }

  Widget _buildReferralStateWidget(
    BuildContext context,
    ReferralState referralState,
  ) {
    if (referralState is Initial) {
      return _buildInitialState(context);
    } else if (referralState is Loading) {
      return _buildLoadingState();
    } else if (referralState is Success) {
      final successState = referralState;
      return _buildSuccessState(
        context,
        successState.referralInfo,
        successState.showConfirmation,
      );
    } else if (referralState is Error) {
      final errorState = referralState;
      return _buildErrorState(context, errorState.message);
    } else {
      return _buildInitialState(context);
    }
  }

  Widget _buildInitialState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.card_giftcard,
            color: ClonesColors.secondaryText,
            size: 80,
          ),
          const SizedBox(height: 24),
          Text(
            'Get Your Referral Code',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: ClonesColors.primaryText,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Generate your unique referral code to start earning rewards.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ClonesColors.secondaryText,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          BtnPrimary(
            buttonText: 'Generate Referral Code',
            onTap: () {
              final walletAddress = ref.read(sessionNotifierProvider).address;
              if (walletAddress != null) {
                ref
                    .read(referralNotifierProvider.notifier)
                    .createReferral(walletAddress);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: ClonesColors.primaryText,
          ),
          SizedBox(height: 16),
          Text(
            'Loading referral information...',
            style: TextStyle(
              color: ClonesColors.primaryText,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState(
    BuildContext context,
    referralInfo,
    bool showConfirmation,
  ) {
    // Show success confirmation when this state is first displayed
    if (showConfirmation && !_hasShownConfirmation) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _hasShownConfirmation = true;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: ClonesColors.primaryText,
                  size: 20,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Referral code successfully linked to your wallet!',
                    style: TextStyle(
                      color: ClonesColors.primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: ClonesColors.rewardInfo,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.all(16),
          ),
        );
      });
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Referral Code Section
          ReferralCodeCard(referralInfo: referralInfo),
          const SizedBox(height: 24),

          // Stats Section
          ReferralStatsCard(referralInfo: referralInfo),
          const SizedBox(height: 24),

          // Instructions Section
          const ReferralInstructionsCard(),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: ClonesColors.lowScore,
            size: 80,
          ),
          const SizedBox(height: 24),
          Text(
            'Error Loading Referral',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: ClonesColors.primaryText,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ClonesColors.secondaryText,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          BtnPrimary(
            buttonText: 'Try Again',
            onTap: () {
              final walletAddress = ref.read(sessionNotifierProvider).address;
              if (walletAddress != null) {
                ref
                    .read(referralNotifierProvider.notifier)
                    .createReferral(walletAddress);
              }
            },
          ),
        ],
      ),
    );
  }
}
