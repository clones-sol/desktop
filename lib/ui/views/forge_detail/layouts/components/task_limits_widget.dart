import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/domain/models/factory/factory_task.dart';
import 'package:flutter/material.dart';

class TaskLimitsWidget extends StatelessWidget {
  const TaskLimitsWidget({
    super.key,
    required this.task,
    this.textStyle,
  });
  final FactoryTask task;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (task.uploadLimit != null && task.uploadLimit! > 0)
          Container(
            margin: const EdgeInsets.only(
              top: 2,
              right: 10,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Upload limit: ${task.uploadLimit}',
              style: textStyle?.copyWith(
                color: ClonesColors.uploadLimit,
              ),
            ),
          ),
        if (task.rewardLimit != null)
          Container(
            margin: const EdgeInsets.only(
              top: 2,
              right: 20,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Reward limit: ${task.rewardLimit}',
              style: textStyle?.copyWith(
                color: ClonesColors.rewardInfo,
              ),
            ),
          ),
        if (task.limitReason != null && task.limitReason!.isNotEmpty)
          Flexible(
            child: Text(
              'Limit reason: ${task.limitReason}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.red,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }
}
