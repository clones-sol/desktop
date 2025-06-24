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
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: CardWidget(
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
                final appParam =
                    Uri.encodeComponent(jsonEncode(appInfo.toJson()));

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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      children: [
                        Image.network(
                          getFaviconUrl(app.domain),
                          width: 20,
                          height: 20,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                            Icons.web,
                            size: 20,
                            color: VMColors.primaryText,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            app.name,
                            style: Theme.of(context).textTheme.titleMedium,
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
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _startTrainingButton(context),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: VMColors.rewardInfo.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF000000).withAlpha(60),
                  blurRadius: 6,
                  offset: const Offset(
                    0,
                    3,
                  ),
                ),
              ],
            ),
            child: Text(
              '${task.rewardLimit?.toStringAsFixed(0) ?? app.poolId?.pricePerDemo.toStringAsFixed(0) ?? 0} VIRAL',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: VMColors.rewardInfo,
                  ),
            ),
          ),
        ),
      ],
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
