import 'package:clones_desktop/application/session/provider.dart';
import 'package:clones_desktop/ui/views/referral/bloc/provider.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_code_card.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_instructions_card.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_referrer_code_card.dart';
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

  @override
  Widget build(BuildContext context) {
    ref.listen(sessionNotifierProvider, (previous, next) {
      final currentWalletAddress = next.address;
      if (currentWalletAddress != _previousWalletAddress) {
        _previousWalletAddress = currentWalletAddress;
        _hasTriedLoading = false;

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

    return const SingleChildScrollView(
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 160,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReferralCodeCard(),
                      ),
                      SizedBox(width: 24),
                      Expanded(
                        child: ReferralReferrerCodeCard(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ReferralStatsCard(),
          ReferralInstructionsCard(),
        ],
      ),
    );
  }
}
