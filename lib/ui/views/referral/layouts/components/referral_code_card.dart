import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/domain/models/referral/referral_info.dart';

class ReferralCodeCard extends StatelessWidget {
  final ReferralInfo referralInfo;

  const ReferralCodeCard({
    super.key,
    required this.referralInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: ClonesColors.containerIcon2.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ClonesColors.containerIcon2.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.link,
                color: ClonesColors.containerIcon2,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'Your Referral Link',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ClonesColors.primaryText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ClonesColors.containerIcon2.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: ClonesColors.containerIcon2.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    referralInfo.referralLink,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ClonesColors.secondaryText,
                      fontFamily: ClonesFonts.mono,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: referralInfo.referralLink));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Referral link copied to clipboard!',
                          style: TextStyle(color: ClonesColors.primaryText),
                        ),
                        backgroundColor: ClonesColors.rewardInfo,
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.copy,
                    color: ClonesColors.containerIcon2,
                    size: 20,
                  ),
                  tooltip: 'Copy link',
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Referral Code: ${referralInfo.referralCode}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ClonesColors.secondaryText,
              fontFamily: ClonesFonts.mono,
            ),
          ),
        ],
      ),
    );
  }
} 