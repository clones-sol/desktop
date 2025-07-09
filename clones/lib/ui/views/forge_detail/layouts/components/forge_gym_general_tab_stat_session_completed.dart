import 'package:clones/assets.dart';
import 'package:clones/ui/components/card.dart';
import 'package:clones/ui/views/forge_detail/bloc/provider.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgeGymGeneralTabStatSessionCompleted extends ConsumerWidget {
  const ForgeGymGeneralTabStatSessionCompleted({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgeDetail = ref.watch(forgeDetailNotifierProvider);

    if (forgeDetail.pool == null) return const SizedBox.shrink();

    final pricePerDemo = forgeDetail.pool!.pricePerDemo;
    final possibleDemos = (pricePerDemo != null && pricePerDemo > 0)
        ? (Decimal.parse(
                  forgeDetail.pool!.funds.toString(),
                ) /
                Decimal.parse(pricePerDemo.toString()))
            .toDouble()
            .floor()
        : 0;

    final demoPercentage = possibleDemos > 0
        ? (forgeDetail.pool!.demonstrations / possibleDemos * 100).clamp(0, 100)
        : 0;

    if (pricePerDemo == null || pricePerDemo == 0) {
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
                color: VMColors.containerIcon5.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.lightbulb_outline,
                color: VMColors.containerIcon5.withValues(alpha: 0.7),
                size: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${forgeDetail.pool!.demonstrations} / $possibleDemos',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Sessions completed',
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        VMColors.primary.withValues(alpha: 0.3),
                        VMColors.secondary.withValues(alpha: 0.3),
                        VMColors.tertiary.withValues(alpha: 0.3),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                if (forgeDetail.pool!.demonstrations >= possibleDemos)
                  FractionallySizedBox(
                    widthFactor: demoPercentage / 100,
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            VMColors.rewardInfo.withValues(alpha: 0.3),
                            VMColors.rewardInfo,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  )
                else
                  FractionallySizedBox(
                    widthFactor: demoPercentage / 100,
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            VMColors.secondary.withValues(alpha: 0.3),
                            VMColors.secondary,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
