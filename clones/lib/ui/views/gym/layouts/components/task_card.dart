import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:clones/assets.dart';
import 'package:clones/domain/app_info.dart';
import 'package:clones/domain/models/forge_task/forge_app.dart';
import 'package:clones/domain/models/forge_task/forge_task_item.dart';
import 'package:clones/ui/components/card.dart';
import 'package:clones/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones/ui/views/training_session/layouts/training_session_view.dart';
import 'package:clones/utils/fav_tools.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.app,
  });

  final ForgeTaskItem task;
  final ForgeApp app;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tokenSymbol = app.poolId?.token?.symbol ?? '';
    final rewardText =
        '${task.rewardLimit?.toStringAsFixed(0) ?? app.poolId?.pricePerDemo.toStringAsFixed(0) ?? 0} $tokenSymbol';

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
                            style: theme.textTheme.titleMedium,
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
                        style: theme.textTheme.bodyMedium,
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
              rewardText,
              style: theme.textTheme.bodySmall!.copyWith(
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
