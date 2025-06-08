import 'package:flutter/material.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/ui/components/card.dart';

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
      variant: CardVariant.secondary,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pool.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: pool.status == TrainingPoolStatus.live
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 12),
            _buildStatusBadge(context, pool.status),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, TrainingPoolStatus status) {
    Color badgeColor = Colors.grey;
    Color textColor = Colors.grey;
    var statusText = '';

    switch (status) {
      case TrainingPoolStatus.live:
        badgeColor = Colors.green.withValues(alpha: 0.1);
        textColor = Colors.green;
        statusText = 'live';
        break;
      case TrainingPoolStatus.paused:
        badgeColor = Colors.grey.withValues(alpha: 0.1);
        textColor = Colors.grey;
        statusText = 'paused';
        break;
      case TrainingPoolStatus.noFunds:
        badgeColor = Colors.yellow.withValues(alpha: 0.1);
        textColor = Colors.yellow;
        statusText = 'no funds';
        break;
      case TrainingPoolStatus.noGas:
        badgeColor = Colors.yellow.withValues(alpha: 0.1);
        textColor = Colors.yellow;
        statusText = 'no gas';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: badgeColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: textColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            statusText,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
