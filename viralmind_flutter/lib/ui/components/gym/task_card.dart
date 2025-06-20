import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/app_info.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_task_item.dart';
import 'package:viralmind_flutter/ui/components/card.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.app,
    required this.task,
  });
  final ForgeApp app;
  final ForgeTaskItem task;

  // TODO(reddwarf03): move to utils
  String getFaviconUrl(String domain) {
    return 'https://s2.googleusercontent.com/s2/favicons?domain=$domain&sz=64';
  }

  @override
  Widget build(BuildContext context) {
    return CardWidget(
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
            '/app/chat',
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
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: VMColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Task',
                      style: TextStyle(
                        color: VMColors.primaryText,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Click to begin',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: VMColors.primaryText,
                  ),
                ),
                Text(
                  '${task.rewardLimit ?? app.poolId?.pricePerDemo ?? 0} VIRAL',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: VMColors.primary,
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
