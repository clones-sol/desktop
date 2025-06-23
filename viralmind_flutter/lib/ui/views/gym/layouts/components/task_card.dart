import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/app_info.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_task_item.dart';
import 'package:viralmind_flutter/ui/components/card.dart';
import 'package:viralmind_flutter/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/views/training_session/layouts/training_session_view.dart';
import 'package:viralmind_flutter/utils/fav_tools.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.app,
    required this.task,
  });
  final ForgeApp app;
  final ForgeTaskItem task;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      padding: CardPadding.small,
      variant: CardVariant.secondary,
      child: InkWell(
        onTap: () async {
          final appInfo = AppInfo(
            type: 'website',
            name: app.name,
            url: 'https://${app.domain}',
            taskId: task.id,
          );
          final appParam = Uri.encodeComponent(jsonEncode(appInfo.toJson()));

          context.go(
            TrainingSessionView.routeName,
            extra: {
              'prompt': task.prompt,
              'appParam': appParam,
              'poolId': app.poolId?.id,
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Image.network(
                    getFaviconUrl(app.domain),
                    width: 20,
                    height: 20,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.web,
                      size: 20,
                      color: VMColors.primaryText,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      app.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: VMColors.primaryText,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: AutoSizeText(
                  task.prompt,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: VMColors.secondaryText,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    '${task.rewardLimit ?? app.poolId?.pricePerDemo ?? 0} \$VIRAL',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: VMColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _startTrainingButton(context),
          ],
        ),
      ),
    );
  }

  Widget _startTrainingButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: BtnPrimary(
        widthExpanded: true,
        onTap: () async {
          final appInfo = AppInfo(
            type: 'website',
            name: app.name,
            url: 'https://${app.domain}',
            taskId: task.id,
          );
          final appParam = Uri.encodeComponent(jsonEncode(appInfo.toJson()));

          context.go(
            TrainingSessionView.routeName,
            extra: {
              'prompt': task.prompt,
              'appParam': appParam,
              'poolId': app.poolId?.id,
            },
          );
        },
        buttonText: 'Start Training',
      ),
    );
  }
}
