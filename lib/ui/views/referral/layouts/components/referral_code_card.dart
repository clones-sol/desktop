import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/views/referral/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReferralCodeCard extends ConsumerWidget {
  const ReferralCodeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final referralState = ref.watch(referralNotifierProvider);
    if (referralState.referralInfo == null) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    return Expanded(
      child: CardWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ClonesColors.containerIcon2.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.call_received,
                    color: ClonesColors.containerIcon2.withValues(alpha: 0.7),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Referral Code',
                      style: theme.textTheme.titleSmall,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Share your referral code ',
                            style: theme.textTheme.bodySmall,
                          ),
                          TextSpan(
                            text: referralState.referralInfo!.referralCode,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: ClonesColors.secondaryText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' with your friends and earn rewards',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: ClonesColors.gradientInputFormBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                      child: SelectableText(
                        referralState.referralInfo!.referralLink,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                BtnPrimary(
                  buttonText: 'Copy',
                  onTap: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: referralState.referralInfo!.referralLink,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Referral link copied!'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
