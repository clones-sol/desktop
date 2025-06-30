import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:viralmind_flutter/application/apps.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/app_info.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';
import 'package:viralmind_flutter/domain/models/ui/gym_filter.dart';
import 'package:viralmind_flutter/ui/components/card.dart';
import 'package:viralmind_flutter/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/bloc/provider.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/bloc/state.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/layouts/components/forge_gym_header.dart';
import 'package:viralmind_flutter/ui/views/training_session/layouts/training_session_view.dart';
import 'package:viralmind_flutter/utils/fav_tools.dart';

class ForgeGymTasksTab extends ConsumerStatefulWidget {
  const ForgeGymTasksTab({
    super.key,
  });

  static const String routeName = '/forge/gym/tasks';

  @override
  ConsumerState<ForgeGymTasksTab> createState() => _ForgeGymTasksTabState();
}

class _ForgeGymTasksTabState extends ConsumerState<ForgeGymTasksTab> {
  bool showNewAppForm = false;
  String newAppName = '';
  String newAppDomain = '';
  int? editingAppIdx;
  String? editingAppField; // 'name' or 'domain'
  String editValue = '';
  int? editingTaskAppIdx;
  int? editingTaskIdx;
  String editTaskPrompt = '';
  bool enableUploadLimit = false;
  int uploadLimitValue = 10;
  bool enableRewardLimit = false;
  int rewardLimitValue = 10;
  bool showTaskModal = false;
  bool loadingApps = false;
  List<dynamic> localApps = [];

  Future<void> loadApps() async {
    final pool = ref.read(forgeDetailNotifierProvider).pool;
    if (pool == null) return;

    setState(() => loadingApps = true);

    final filter = GymFilter(poolId: pool.id);
    final appsAsync = ref.read(getAppsForGymProvider(filter: filter).future);
    try {
      final apps = await appsAsync;
      setState(() {
        localApps = List.from(apps);
      });
    } catch (_) {
      setState(() {
        localApps = [];
      });
    } finally {
      setState(() => loadingApps = false);
    }
  }

  @override
  void initState() {
    super.initState();
    Future(() async {
      await loadApps();
    });
  }

  void startEditingApp(int idx, String field) {
    setState(() {
      editingAppIdx = idx;
      editingAppField = field;
      editValue = localApps[idx][field] ?? '';
    });
  }

  void saveEditingApp() {
    if (editingAppIdx != null && editingAppField != null) {
      setState(() {
        localApps[editingAppIdx!][editingAppField!] = editValue;
        editingAppIdx = null;
        editingAppField = null;
        editValue = '';
      });
    }
  }

  void cancelEditingApp() {
    setState(() {
      editingAppIdx = null;
      editingAppField = null;
      editValue = '';
    });
  }

  void removeApp(int idx) {
    setState(() {
      localApps.removeAt(idx);
    });
  }

  void addNewApp() {
    if (newAppName.isEmpty) return;
    setState(() {
      localApps.add({
        'name': newAppName,
        'domain': newAppDomain,
        'description': '',
        'tasks': [],
      });
      newAppName = '';
      newAppDomain = '';
      showNewAppForm = false;
    });
  }

  void openTaskModal(int appIdx, [int? taskIdx]) {
    setState(() {
      editingTaskAppIdx = appIdx;
      editingTaskIdx = taskIdx;
      if (taskIdx != null) {
        final task = localApps[appIdx]['tasks'][taskIdx];
        editTaskPrompt = task['prompt'] ?? '';
        enableUploadLimit = task['uploadLimit'] != null;
        uploadLimitValue = task['uploadLimit'] ?? 10;
        enableRewardLimit = task['rewardLimit'] != null;
        rewardLimitValue = task['rewardLimit'] ?? 10;
      } else {
        editTaskPrompt = '';
        enableUploadLimit = false;
        uploadLimitValue = 10;
        enableRewardLimit = false;
        rewardLimitValue = 10;
      }
      showTaskModal = true;
    });
  }

  void saveTaskModal() {
    if (editingTaskAppIdx == null) return;
    setState(() {
      final app = localApps[editingTaskAppIdx!];
      if (editingTaskIdx != null) {
        // Edit existing
        app['tasks'][editingTaskIdx!] = {
          'prompt': editTaskPrompt,
          'uploadLimit': enableUploadLimit ? uploadLimitValue : null,
          'rewardLimit': enableRewardLimit ? rewardLimitValue : null,
        };
      } else {
        // Add new
        app['tasks'].add({
          'prompt': editTaskPrompt,
          'uploadLimit': enableUploadLimit ? uploadLimitValue : null,
          'rewardLimit': enableRewardLimit ? rewardLimitValue : null,
        });
      }
      showTaskModal = false;
      editingTaskAppIdx = null;
      editingTaskIdx = null;
    });
  }

  void removeTask(int appIdx, int taskIdx) {
    setState(() {
      localApps[appIdx]['tasks'].removeAt(taskIdx);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pool = ref.watch(forgeDetailNotifierProvider).pool;
    if (pool == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ForgeGymHeader(),
          Row(
            children: [
              Text(
                '2. Tasks',
                style: Theme.of(context).textTheme.titleMedium,
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
                                  .watch(forgeDetailNotifierProvider)
                                  .viewModeTasks ==
                              ViewModeTasks.edit
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
                                  .watch(forgeDetailNotifierProvider)
                                  .viewModeTasks ==
                              ViewModeTasks.preview
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
                Row(
                  children: [
                    BtnPrimary(
                      onTap: loadApps,
                      buttonText: 'Refresh',
                      btnPrimaryType: BtnPrimaryType.outlinePrimary,
                    ),
                    const SizedBox(width: 8),
                    // TODO(reddwarf03): Add regenerate tasks
                    BtnPrimary(
                      onTap: () {},
                      buttonText: 'Regenerate Tasks',
                      icon: Icons.auto_awesome,
                    ),
                    if (!showNewAppForm)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: BtnPrimary(
                          onTap: () => setState(() => showNewAppForm = true),
                          buttonText: 'New App',
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (showNewAppForm)
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'App name'),
                    onChanged: (v) => setState(() => newAppName = v),
                  ),
                  TextField(
                    decoration:
                        const InputDecoration(labelText: 'Domain (optional)'),
                    onChanged: (v) => setState(() => newAppDomain = v),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => setState(() {
                          showNewAppForm = false;
                          newAppName = '';
                          newAppDomain = '';
                        }),
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: newAppName.isEmpty ? null : addNewApp,
                        child: const Text('Add'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          const SizedBox(height: 8),
          if (loadingApps) const Center(child: CircularProgressIndicator()),
          if (!loadingApps && localApps.isEmpty)
            Center(
              child: Text(
                'No apps available.',
                style: TextStyle(color: VMColors.secondaryText),
              ),
            ),
          if (!loadingApps && localApps.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: localApps.length,
                itemBuilder: (context, appIdx) {
                  final ForgeApp app = localApps[appIdx];
                  return CardWidget(
                    padding: CardPadding.small,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (app.domain.isNotEmpty)
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: VMColors.containerIcon5
                                        .withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    getFaviconUrl(app.domain),
                                    width: 24,
                                    height: 24,
                                    errorBuilder: (_, __, ___) =>
                                        const Icon(Icons.language, size: 24),
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
                                        controller: TextEditingController(
                                          text: editValue,
                                        ),
                                        onChanged: (v) =>
                                            setState(() => editValue = v),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.check),
                                      onPressed: saveEditingApp,
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: cancelEditingApp,
                                    ),
                                  ],
                                )
                              else
                                GestureDetector(
                                  onTap: () => startEditingApp(appIdx, 'name'),
                                  child: Text(
                                    app.name,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
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
                                        controller: TextEditingController(
                                          text: editValue,
                                        ),
                                        onChanged: (v) =>
                                            setState(() => editValue = v),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.check,
                                        color: VMColors.primaryText,
                                      ),
                                      onPressed: saveEditingApp,
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: cancelEditingApp,
                                    ),
                                  ],
                                )
                              else
                                GestureDetector(
                                  onTap: () =>
                                      startEditingApp(appIdx, 'domain'),
                                  child: Text(
                                    app.domain,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  removeApp(appIdx);
                                },
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    Colors.red.withValues(alpha: 0.8),
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
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                app.description,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          const SizedBox(height: 20),
                          if ((app.tasks as List).isEmpty)
                            Text(
                              'No tasks for this app.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          if ((app.tasks as List).isNotEmpty)
                            ...List.generate(app.tasks.length, (taskIdx) {
                              final task = app.tasks[taskIdx];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
                                  height: 50,
                                  child: CardWidget(
                                    padding: CardPadding.small,
                                    variant: CardVariant.secondary,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          task.prompt,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (task.uploadLimit != null)
                                              Container(
                                                margin: const EdgeInsets.only(
                                                  top: 2,
                                                  right: 4,
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 6,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.blue[50],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  'Upload limit: ${task.uploadLimit}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            if (task.rewardLimit != null)
                                              Container(
                                                margin: const EdgeInsets.only(
                                                  top: 2,
                                                  right: 4,
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 6,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.green[50],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  'Reward limit: ${task.rewardLimit}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                              ),
                                            if (task.limitReason != null &&
                                                task.limitReason!.isNotEmpty)
                                              Text(
                                                'Limit reason: ${task.limitReason}',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.red,
                                                ),
                                              ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                final appInfo = AppInfo(
                                                  type: 'website',
                                                  name: app.name,
                                                  url: 'https://${app.domain}',
                                                  taskId: task.id,
                                                );
                                                final appParam =
                                                    Uri.encodeComponent(
                                                  jsonEncode(appInfo.toJson()),
                                                );

                                                context.go(
                                                  TrainingSessionView.routeName,
                                                  extra: {
                                                    'prompt': task.prompt,
                                                    'appParam': appParam,
                                                    'poolId': pool.id,
                                                  },
                                                );
                                              },
                                              child: ColorFiltered(
                                                colorFilter: ColorFilter.mode(
                                                  Colors.blue
                                                      .withValues(alpha: 0.8),
                                                  BlendMode.srcATop,
                                                ),
                                                child: Image.asset(
                                                  Assets.recordIcon,
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            InkWell(
                                              onTap: () {
                                                openTaskModal(appIdx, taskIdx);
                                              },
                                              child: Image.asset(
                                                Assets.editIcon,
                                                width: 24,
                                                height: 24,
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            InkWell(
                                              onTap: () {
                                                removeTask(appIdx, taskIdx);
                                              },
                                              child: ColorFiltered(
                                                colorFilter: ColorFilter.mode(
                                                  Colors.red
                                                      .withValues(alpha: 0.8),
                                                  BlendMode.srcATop,
                                                ),
                                                child: Image.asset(
                                                  Assets.deleteIcon,
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
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
                            onTap: () => openTaskModal(appIdx),
                            child: SizedBox(
                              height: 50,
                              child: CardWidget(
                                padding: CardPadding.small,
                                variant: CardVariant.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '+ Add a task',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
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
          if (showTaskModal)
            Dialog(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: 'Prompt'),
                      onChanged: (v) => setState(() => editTaskPrompt = v),
                      controller: TextEditingController(text: editTaskPrompt),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: enableUploadLimit,
                          onChanged: (v) =>
                              setState(() => enableUploadLimit = v ?? false),
                        ),
                        const Text('Upload limit'),
                        if (enableUploadLimit)
                          SizedBox(
                            width: 60,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (v) => setState(
                                () => uploadLimitValue = int.tryParse(v) ?? 10,
                              ),
                              controller: TextEditingController(
                                text: uploadLimitValue.toString(),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: enableRewardLimit,
                          onChanged: (v) =>
                              setState(() => enableRewardLimit = v ?? false),
                        ),
                        const Text('Reward limit'),
                        if (enableRewardLimit)
                          SizedBox(
                            width: 60,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (v) => setState(
                                () => rewardLimitValue = int.tryParse(v) ?? 10,
                              ),
                              controller: TextEditingController(
                                text: rewardLimitValue.toString(),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () =>
                              setState(() => showTaskModal = false),
                          child: const Text('Annuler'),
                        ),
                        ElevatedButton(
                          onPressed:
                              editTaskPrompt.isEmpty ? null : saveTaskModal,
                          child: const Text('Enregistrer'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
