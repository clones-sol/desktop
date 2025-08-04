import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/views/forge_detail/bloc/provider.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgeFactoryGeneralTabStatSessionCompleted extends ConsumerWidget {
  const ForgeFactoryGeneralTabStatSessionCompleted({super.key});

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
                color: ClonesColors.containerIcon5.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.lightbulb_outline,
                color: ClonesColors.containerIcon5.withOpacity(0.7),
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
                        ClonesColors.primary.withOpacity(0.3),
                        ClonesColors.secondary.withOpacity(0.3),
                        ClonesColors.tertiary.withOpacity(0.3),
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
                            ClonesColors.rewardInfo.withOpacity(0.3),
                            ClonesColors.rewardInfo,
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
                            ClonesColors.secondary.withOpacity(0.3),
                            ClonesColors.secondary,
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
