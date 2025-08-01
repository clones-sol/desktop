import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/domain/models/referral/referral_info.dart';
import 'package:flutter/material.dart';

class ReferralStatsCard extends StatelessWidget {
  const ReferralStatsCard({
    super.key,
    required this.referralInfo,
  });
  final ReferralInfo referralInfo;

  @override
  Widget build(BuildContext context) {
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
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  context,
                  'Total Referrals',
                  '${referralInfo.totalReferrals}',
                  Icons.people,
                  ClonesColors.containerIcon2,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildStatItem(
                  context,
                  'Total Rewards',
                  '${referralInfo.totalRewards.toStringAsFixed(2)} SOL',
                  Icons.monetization_on,
                  ClonesColors.rewardInfo,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: ClonesColors.primaryText,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ClonesColors.secondaryText,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
