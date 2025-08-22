import 'package:clones_desktop/domain/models/training_pool.dart';
import 'package:flutter/material.dart';

class FactoryStatus extends StatelessWidget {
  const FactoryStatus({super.key, required this.status});
  final TrainingPoolStatus status;

  @override
  Widget build(BuildContext context) {
    Color badgeColor = Colors.grey;
    Color textColor = Colors.grey;
    var statusText = '';

    switch (status) {
      case TrainingPoolStatus.live:
        badgeColor = Colors.green.withValues(alpha: 0.1);
        textColor = Colors.green;
        statusText = 'LIVE';
        break;
      case TrainingPoolStatus.paused:
        badgeColor = Colors.blue.withValues(alpha: 0.1);
        textColor = Colors.blue;
        statusText = 'PAUSED';
        break;
      case TrainingPoolStatus.noFunds:
        badgeColor = Colors.yellow.withValues(alpha: 0.1);
        textColor = Colors.yellow[700]!;
        statusText = 'NO FUNDS';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(10),
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
