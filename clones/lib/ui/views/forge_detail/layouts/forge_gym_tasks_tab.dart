import 'dart:convert';

import 'package:clones/assets.dart';
import 'package:clones/domain/app_info.dart';
import 'package:clones/ui/components/card.dart';
import 'package:clones/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones/ui/components/design_widget/dialog/dialog.dart';
import 'package:clones/ui/views/forge_detail/bloc/provider.dart';
import 'package:clones/ui/views/forge_detail/bloc/state.dart';
import 'package:clones/ui/views/forge_detail/layouts/components/forge_gym_header.dart';
import 'package:clones/ui/views/gym/layouts/available_tasks.dart';
import 'package:clones/ui/views/manage_task/bloc/state.dart';
import 'package:clones/ui/views/manage_task/layouts/manage_task_modal.dart';
import 'package:clones/ui/views/training_session/layouts/training_session_view.dart';
import 'package:clones/utils/fav_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ForgeGymTasksTab extends ConsumerStatefulWidget {
  const ForgeGymTasksTab({
    super.key,
  });

  @override
  ConsumerState<ForgeGymTasksTab> createState() => _ForgeGymTasksTabState();
}

class _ForgeGymTasksTabState extends ConsumerState<ForgeGymTasksTab> {
  String newAppName = '';
  String newAppDomain = '';
  int? editingAppIdx;
  String? editingAppField; // 'name' or 'domain'
  String editValue = '';
  String editTaskPrompt = '';
  bool enableUploadLimit = false;
  int uploadLimitValue = 10;
  bool enableRewardLimit = false;
  int rewardLimitValue = 10;

  @override
  Widget build(BuildContext context) {
    final forgeDetail = ref.watch(forgeDetailNotifierProvider);
    final theme = Theme.of(context);
    if (forgeDetail.pool == null) return const SizedBox.shrink();

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ForgeGymHeader(),
              Row(
                children: [
                  Text(
                    '2. Tasks',
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        BtnPrimary(
                          buttonText: 'Edit',
                          onTap: () => ref
                                      .read(forgeDetailNotifierProvider)
                                      .viewModeTasks ==
                                  ViewModeTasks.preview
                              ? ref
                                  .read(forgeDetailNotifierProvider.notifier)
                                  .setViewModeTasks(ViewModeTasks.edit)
                              : null,
                          btnPrimaryType: ref
                                      .watch(forgeDetailNotifierProvider)
                                      .viewModeTasks ==
                                  ViewModeTasks.edit
                              ? BtnPrimaryType.primary
                              : BtnPrimaryType.dark,
                        ),
                        const SizedBox(width: 10),
                        BtnPrimary(
                          buttonText: 'Preview',
                          onTap: () => ref
                                      .read(forgeDetailNotifierProvider)
                                      .viewModeTasks ==
                                  ViewModeTasks.edit
                              ? ref
                                  .read(forgeDetailNotifierProvider.notifier)
                                  .setViewModeTasks(ViewModeTasks.preview)
                              : null,
                          btnPrimaryType: ref
                                      .watch(forgeDetailNotifierProvider)
                                      .viewModeTasks ==
                                  ViewModeTasks.preview
                              ? BtnPrimaryType.primary
                              : BtnPrimaryType.dark,
                        ),
                      ],
                    ),
                    /* Row(
                      children: [
                        // TODO(reddwarf03): Add regenerate tasks
                        BtnPrimary(
                          onTap: () {},
                          buttonText: 'Regenerate Tasks',
                          icon: Icons.auto_awesome,
                        ),*/
                    // TODO(reddwarf03): Add regenerate tasks
                    /*if (!forgeDetail.showNewAppForm)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: BtnPrimary(
                              onTap: () => ref
                                  .read(forgeDetailNotifierProvider.notifier)
                                  .setShowNewAppForm(true),
                              buttonText: 'New App',
                            ),
                          ),
                      ],
                    ),*/
                  ],
                ),
              ),
              if (forgeDetail.showNewAppForm)
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration:
                            const InputDecoration(labelText: 'App name'),
                        onChanged: (v) => setState(() => newAppName = v),
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Domain (optional)',
                        ),
                        onChanged: (v) => setState(() => newAppDomain = v),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              ref.read(forgeDetailNotifierProvider.notifier)
                                ..setShowNewAppForm(false)
                                ..setNewAppName('')
                                ..setNewAppDomain('');
                            },
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: forgeDetail.newAppName == null ||
                                    forgeDetail.newAppName!.isEmpty
                                ? null
                                : () => ref
                                    .read(forgeDetailNotifierProvider.notifier)
                                    .createApp(),
                            child: const Text('Add'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              if (forgeDetail.viewModeTasks == ViewModeTasks.preview)
                Expanded(
                  child: AvailableTasks(
                    poolId: forgeDetail.pool!.id,
                  ),
                )
              else
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      if (forgeDetail.apps.isEmpty)
                        Center(
                          child: Text(
                            'No apps available.',
                            style: TextStyle(color: VMColors.secondaryText),
                          ),
                        )
                      else
                        Expanded(
                          child: ListView.builder(
                            itemCount: forgeDetail.apps.length,
                            itemBuilder: (context, appIdx) {
                              final app = forgeDetail.apps[appIdx];
                              return CardWidget(
                                padding: CardPadding.small,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          if (app.domain.isNotEmpty)
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: VMColors.containerIcon5
                                                    .withValues(alpha: 0.2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Image.network(
                                                getFaviconUrl(app.domain),
                                                width: 24,
                                                height: 24,
                                                errorBuilder: (_, __, ___) =>
                                                    const Icon(
                                                  Icons.apps,
                                                  color: VMColors.primaryText,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          const SizedBox(width: 10),
                                          if (editingAppIdx == appIdx &&
                                              editingAppField == 'name')
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 120,
                                                  child: TextField(
                                                    autofocus: true,
                                                    controller:
                                                        TextEditingController(
                                                      text: editValue,
                                                    ),
                                                    onChanged: (v) => setState(
                                                      () => editValue = v,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.check),
                                                  // TODO(reddwarf03): Add edit app
                                                  onPressed: () {},
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.close),
                                                  // TODO(reddwarf03): Add edit app
                                                  onPressed: () {},
                                                ),
                                              ],
                                            )
                                          else
                                            GestureDetector(
                                              // TODO(reddwarf03): Add edit app
                                              onTap: () {},
                                              child: Text(
                                                app.name,
                                                style:
                                                    theme.textTheme.titleMedium,
                                              ),
                                            ),
                                          const SizedBox(width: 8),
                                          if (editingAppIdx == appIdx &&
                                              editingAppField == 'domain')
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 120,
                                                  child: TextField(
                                                    autofocus: true,
                                                    controller:
                                                        TextEditingController(
                                                      text: editValue,
                                                    ),
                                                    onChanged: (v) => setState(
                                                      () => editValue = v,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.check,
                                                    color: VMColors.primaryText,
                                                  ),
                                                  // TODO(reddwarf03): Add edit app
                                                  onPressed: () {},
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.close),
                                                  // TODO(reddwarf03): Add edit app
                                                  onPressed: () {},
                                                ),
                                              ],
                                            )
                                          else
                                            GestureDetector(
                                              // TODO(reddwarf03): Add edit app
                                              onTap: () {},
                                              child: Text(
                                                app.domain,
                                                style:
                                                    theme.textTheme.bodyMedium,
                                              ),
                                            ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () async {
                                              await AppDialogs
                                                  .showConfirmDialog(
                                                context,
                                                ref,
                                                'Confirm Deletion',
                                                'Are you sure you want to delete this app and all its tasks?',
                                                'Delete',
                                                () async {
                                                  ref
                                                      .read(
                                                        forgeDetailNotifierProvider
                                                            .notifier,
                                                      )
                                                      .removeApp(appIdx);
                                                },
                                              );
                                            },
                                            child: ColorFiltered(
                                              colorFilter: ColorFilter.mode(
                                                Colors.red
                                                    .withValues(alpha: 0.8),
                                                BlendMode.srcATop,
                                              ),
                                              child: Image.asset(
                                                Assets.deleteIcon,
                                                width: 30,
                                                height: 30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (app.description.isNotEmpty)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4),
                                          child: Text(
                                            app.description,
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                        ),
                                      const SizedBox(height: 20),
                                      if (app.tasks.isEmpty)
                                        Text(
                                          'No tasks for this app.',
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                      if (app.tasks.isNotEmpty)
                                        ...List.generate(app.tasks.length,
                                            (taskIdx) {
                                          final task = app.tasks[taskIdx];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                            ),
                                            child: SizedBox(
                                              height: 50,
                                              child: CardWidget(
                                                padding: CardPadding.small,
                                                variant: CardVariant.secondary,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      task.prompt,
                                                      style: theme
                                                          .textTheme.bodyMedium,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            if (task.uploadLimit !=
                                                                    null &&
                                                                task.uploadLimit! >
                                                                    0)
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 2,
                                                                  right: 10,
                                                                ),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  horizontal: 6,
                                                                  vertical: 2,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    8,
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  'Upload limit: ${task.uploadLimit}',
                                                                  style: theme
                                                                      .textTheme
                                                                      .bodyMedium
                                                                      ?.copyWith(
                                                                    color: VMColors
                                                                        .uploadLimit,
                                                                  ),
                                                                ),
                                                              ),
                                                            if (task.rewardLimit !=
                                                                null)
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 2,
                                                                  right: 20,
                                                                ),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  horizontal: 6,
                                                                  vertical: 2,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    8,
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  'Reward limit: ${task.rewardLimit}',
                                                                  style: theme
                                                                      .textTheme
                                                                      .bodyMedium
                                                                      ?.copyWith(
                                                                    color: VMColors
                                                                        .rewardInfo,
                                                                  ),
                                                                ),
                                                              ),
                                                            if (task.limitReason !=
                                                                    null &&
                                                                task.limitReason!
                                                                    .isNotEmpty)
                                                              Text(
                                                                'Limit reason: ${task.limitReason}',
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                final appInfo =
                                                                    AppInfo(
                                                                  type:
                                                                      'website',
                                                                  name:
                                                                      app.name,
                                                                  url:
                                                                      'https://${app.domain}',
                                                                  taskId:
                                                                      task.id,
                                                                );
                                                                final appParam =
                                                                    Uri.encodeComponent(
                                                                  jsonEncode(
                                                                    appInfo
                                                                        .toJson(),
                                                                  ),
                                                                );

                                                                context.go(
                                                                  TrainingSessionView
                                                                      .routeName,
                                                                  extra: {
                                                                    'prompt': task
                                                                        .prompt,
                                                                    'appParam':
                                                                        appParam,
                                                                    'poolId':
                                                                        forgeDetail
                                                                            .pool!
                                                                            .id,
                                                                  },
                                                                );
                                                              },
                                                              child:
                                                                  ColorFiltered(
                                                                colorFilter:
                                                                    ColorFilter
                                                                        .mode(
                                                                  Colors.blue
                                                                      .withValues(
                                                                    alpha: 0.8,
                                                                  ),
                                                                  BlendMode
                                                                      .srcATop,
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  Assets
                                                                      .recordIcon,
                                                                  width: 24,
                                                                  height: 24,
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                ref.read(
                                                                  forgeDetailNotifierProvider
                                                                      .notifier,
                                                                )
                                                                  ..setManageTaskModalType(
                                                                    ManageTaskModalType
                                                                        .edit,
                                                                  )
                                                                  ..setShowManageTaskModal(
                                                                    true,
                                                                  )
                                                                  ..setEditingTaskAppIdx(
                                                                    appIdx,
                                                                  )
                                                                  ..setEditingTaskIdx(
                                                                    taskIdx,
                                                                  );
                                                              },
                                                              child:
                                                                  Image.asset(
                                                                Assets.editIcon,
                                                                width: 24,
                                                                height: 24,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            InkWell(
                                                              onTap: () async {
                                                                await AppDialogs
                                                                    .showConfirmDialog(
                                                                  context,
                                                                  ref,
                                                                  'Confirm Deletion',
                                                                  'Are you sure you want to delete this task?',
                                                                  'Delete',
                                                                  () async {
                                                                    ref
                                                                        .read(
                                                                          forgeDetailNotifierProvider
                                                                              .notifier,
                                                                        )
                                                                        .removeTask(
                                                                          appIdx,
                                                                          taskIdx,
                                                                        );
                                                                  },
                                                                );
                                                              },
                                                              child:
                                                                  ColorFiltered(
                                                                colorFilter:
                                                                    ColorFilter
                                                                        .mode(
                                                                  Colors.red
                                                                      .withValues(
                                                                    alpha: 0.8,
                                                                  ),
                                                                  BlendMode
                                                                      .srcATop,
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  Assets
                                                                      .deleteIcon,
                                                                  width: 24,
                                                                  height: 24,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      const SizedBox(height: 10),
                                      InkWell(
                                        onTap: () => {
                                          ref.read(
                                            forgeDetailNotifierProvider
                                                .notifier,
                                          )
                                            ..setManageTaskModalType(
                                              ManageTaskModalType.create,
                                            )
                                            ..setEditingTaskAppIdx(appIdx)
                                            ..setShowManageTaskModal(true),
                                        },
                                        child: SizedBox(
                                          height: 50,
                                          child: CardWidget(
                                            padding: CardPadding.small,
                                            variant: CardVariant.transparent,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '+ Add a task',
                                                  style: theme
                                                      .textTheme.bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        if (forgeDetail.showManageTaskModal)
          ManageTaskModal(
            tokenSymbol: forgeDetail.pool!.token.symbol,
            modalType: forgeDetail.manageTaskModalType,
            task: forgeDetail.manageTaskModalType == ManageTaskModalType.create
                ? null
                : forgeDetail.apps[forgeDetail.editingTaskAppIdx!]
                    .tasks[forgeDetail.editingTaskIdx!],
            onClose: () {
              ref
                  .read(forgeDetailNotifierProvider.notifier)
                  .setShowManageTaskModal(false);
            },
            onDone: (task) {
              if (task != null) {
                if (forgeDetail.manageTaskModalType ==
                    ManageTaskModalType.create) {
                  ref
                      .read(forgeDetailNotifierProvider.notifier)
                      .createTask(forgeDetail.editingTaskAppIdx!, task);
                } else {
                  ref.read(forgeDetailNotifierProvider.notifier).updateTask(
                        forgeDetail.editingTaskAppIdx!,
                        forgeDetail.editingTaskIdx!,
                        task,
                      );
                }
                ref
                    .read(forgeDetailNotifierProvider.notifier)
                    .setShowManageTaskModal(false);
              }
            },
          ),
      ],
    );
  }
}
