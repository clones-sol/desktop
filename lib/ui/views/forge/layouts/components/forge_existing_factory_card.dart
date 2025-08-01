import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/domain/models/training_pool.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/components/factory_status.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class ForgeExistingFactoryCard extends StatelessWidget {
  const ForgeExistingFactoryCard({
    super.key,
    required this.pool,
    required this.onTap,
  });

  final TrainingPool pool;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CardWidget(
      padding: CardPadding.small,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: FactoryStatus(status: pool.status),
            ),
            Text(
              pool.name,
              style: theme.textTheme.titleMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${pool.funds} ${pool.token.symbol}',
                  style: TextStyle(
                    color: ClonesColors.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  'Pool Balance',
                  style: TextStyle(
                    color: ClonesColors.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            _demoProgress(
              context,
            ),
            const SizedBox(height: 8),
            _viewDetailsButton(),
          ],
        ),
      ),
    );
  }

  Widget _demoProgress(
    BuildContext context,
  ) {
    final pricePerDemo = pool.pricePerDemo;
    final possibleDemos = (pricePerDemo != null && pricePerDemo > 0)
        ? (Decimal.parse(
                  pool.funds.toString(),
                ) /
                Decimal.parse(pricePerDemo.toString()))
            .toDouble()
            .floor()
        : 0;

    final demoPercentage = possibleDemos > 0
        ? (pool.demonstrations / possibleDemos * 100).clamp(0, 100)
        : 0;

    if (pricePerDemo == null || pricePerDemo == 0) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Uploads / Remaining Demos',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ClonesColors.secondaryText,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '${pool.demonstrations} / $possibleDemos',
              style: TextStyle(
                color: ClonesColors.secondaryText,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Stack(
          children: [
            Container(
              height: 4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ClonesColors.primary.withValues(alpha: 0.3),
                    ClonesColors.secondary.withValues(alpha: 0.3),
                    ClonesColors.tertiary.withValues(alpha: 0.3),
                  ],
                ),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            if (pool.demonstrations >= possibleDemos)
              FractionallySizedBox(
                widthFactor: demoPercentage / 100,
                child: Container(
                  height: 5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ClonesColors.rewardInfo.withValues(alpha: 0.3),
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
                        ClonesColors.secondary.withValues(alpha: 0.3),
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
    );
  }

  Widget _viewDetailsButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: BtnPrimary(
        widthExpanded: true,
        onTap: onTap,
        buttonText: 'View Details',
      ),
    );
  }
}
