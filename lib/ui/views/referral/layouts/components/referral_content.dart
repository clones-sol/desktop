import 'package:clones_desktop/application/session/provider.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/views/referral/bloc/provider.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_code_card.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_instructions_card.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_stats_card.dart';
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

    if (referralState.showConfirmation && !_hasShownConfirmation) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _hasShownConfirmation = true;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: ClonesColors.primaryText,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Referral code successfully linked to your wallet!',
                    style: Theme.of(context).textTheme.bodyMedium,
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

    return const SingleChildScrollView(
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: SizedBox(
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReferralCodeCard(),
                ],
              ),
            ),
          ),
          ReferralStatsCard(),
          ReferralInstructionsCard(),
        ],
      ),
    );
  }
}
