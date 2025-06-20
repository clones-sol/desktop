import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/ui/components/card.dart';
import 'package:viralmind_flutter/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/components/gym_status.dart';

class ForgeExistingGymCard extends StatelessWidget {
  const ForgeExistingGymCard({
    super.key,
    required this.pool,
    required this.onTap,
  });

  final TrainingPool pool;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      padding: CardPadding.small,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GymStatus(status: pool.status),
            ),
            Text(
              pool.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: VMColors.primaryText,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${pool.tokenBalance ?? 0.toStringAsFixed(0)} ${pool.token.symbol}',
                  style: TextStyle(
                    color: VMColors.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  'Pool Balance',
                  style: TextStyle(
                    color: VMColors.secondaryText,
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
                  pool.tokenBalance == null
                      ? '0'
                      : pool.tokenBalance.toString(),
                ) /
                Decimal.parse(pricePerDemo.toString()))
            .toDouble()
            .floor()
        : 0;
    final totalDemos = pool.demonstrations + possibleDemos;
    final demoPercentage = totalDemos > 0
        ? (pool.demonstrations / totalDemos * 100).clamp(0, 100)
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
                  color: VMColors.secondaryText,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '${pool.demonstrations} / $possibleDemos',
              style: TextStyle(
                color: VMColors.secondaryText,
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
                    VMColors.primary.withValues(alpha: 0.3),
                    VMColors.secondary.withValues(alpha: 0.3),
                    VMColors.tertiary.withValues(alpha: 0.3),
                  ],
                ),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
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
