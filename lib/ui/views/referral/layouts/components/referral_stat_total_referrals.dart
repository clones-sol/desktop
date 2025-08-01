import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/views/referral/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReferralStatTotalReferrals extends ConsumerWidget {
  const ReferralStatTotalReferrals({super.key});

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
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ClonesColors.containerIcon1.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.people_outline,
                color: ClonesColors.containerIcon1.withValues(alpha: 0.7),
                size: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              referralState.referralInfo!.totalReferrals.toString(),
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Total Referrals',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
