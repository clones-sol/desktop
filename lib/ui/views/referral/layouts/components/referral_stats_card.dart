import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/views/referral/bloc/provider.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_stat_total_referrals.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_stat_total_rewards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReferralStatsCard extends ConsumerWidget {
  const ReferralStatsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final referralState = ref.watch(referralNotifierProvider);
    if (referralState.referralInfo == null) {
      return const SizedBox.shrink();
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.analytics,
                color: ClonesColors.rewardInfo,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'Your Stats',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: ClonesColors.primaryText,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Row(
            children: [
              Expanded(
                child: ReferralStatTotalReferrals(),
              ),
              SizedBox(width: 24),
              Expanded(
                child: ReferralStatTotalRewards(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
