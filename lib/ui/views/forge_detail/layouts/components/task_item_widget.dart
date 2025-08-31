import 'package:clones_desktop/domain/models/factory/factory_app.dart';
import 'package:clones_desktop/domain/models/factory/factory_task.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/components/task_actions_widget.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/components/task_limits_widget.dart';
import 'package:flutter/material.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.task,
    required this.app,
    required this.appIdx,
    required this.taskIdx,
    required this.poolAddress,
  });
  final FactoryTask task;
  final FactoryApp app;
  final int appIdx;
  final int taskIdx;
  final String poolAddress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CardWidget(
        padding: CardPadding.small,
        variant: CardVariant.secondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task prompt
            Text(
              task.prompt,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            // Limits and actions row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Task limits
                Expanded(
                  child: TaskLimitsWidget(
                    task: task,
                    textStyle: theme.textTheme.bodyMedium,
                  ),
                ),
                // Task actions
                TaskActionsWidget(
                  task: task,
                  app: app,
                  appIdx: appIdx,
                  taskIdx: taskIdx,
                  poolAddress: poolAddress,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
