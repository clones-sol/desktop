import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/application/apps.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/domain/models/ui/gym_filter.dart';
import 'package:viralmind_flutter/ui/components/buttons/btn_primary.dart';
import 'package:viralmind_flutter/domain/app_info.dart';
import 'package:viralmind_flutter/ui/views/training_session/training_session_view.dart';

class ForgeGymTasksTab extends ConsumerStatefulWidget {
  const ForgeGymTasksTab(
      {super.key, required this.pool, required this.onRegenerateTasks});
  final TrainingPool pool;
  final VoidCallback onRegenerateTasks;

  @override
  ConsumerState<ForgeGymTasksTab> createState() => _ForgeGymTasksTabState();
}

class _ForgeGymTasksTabState extends ConsumerState<ForgeGymTasksTab> {
  String viewMode = 'edit'; // 'edit' or 'preview'
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
    setState(() => loadingApps = true);
    final filter = GymFilter(poolId: widget.pool.id);
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
    loadApps();
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

  String getFaviconUrl(String? domain) {
    if (domain == null || domain.isEmpty) return '';
    final cleanDomain =
        domain.replaceAll(RegExp(r'^(https?:\/\/)?(www\.)?'), '');
    return 'https://www.google.com/s2/favicons?domain=$cleanDomain&sz=32';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top bar: mode switch, refresh, add app
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Tasks', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(width: 16),
                ToggleButtons(
                  isSelected: [viewMode == 'edit', viewMode == 'preview'],
                  onPressed: (idx) {
                    setState(() {
                      viewMode = idx == 0 ? 'edit' : 'preview';
                    });
                  },
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Edit'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Preview'),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                BtnPrimary(
                  onTap: loadApps,
                  buttonText: 'Refresh',
                  icon: Icons.refresh,
                  btnPrimaryType: BtnPrimaryType.outlinePrimary,
                ),
                const SizedBox(width: 8),
                BtnPrimary(
                  onTap: widget.onRegenerateTasks,
                  buttonText: 'Regenerate Tasks',
                  icon: Icons.auto_awesome,
                ),
                if (!showNewAppForm)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: BtnPrimary(
                      onTap: () => setState(() => showNewAppForm = true),
                      buttonText: 'New App',
                      icon: Icons.add,
                    ),
                  ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (showNewAppForm)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
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
              padding: const EdgeInsets.all(16),
              itemCount: localApps.length,
              itemBuilder: (context, appIdx) {
                final ForgeApp app = localApps[appIdx];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Favicon
                            if (app.domain.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Image.network(
                                  getFaviconUrl(app.domain),
                                  width: 24,
                                  height: 24,
                                  errorBuilder: (_, __, ___) =>
                                      const Icon(Icons.language, size: 24),
                                ),
                              ),
                            // App name (editable)
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
                            // Domain (editable)
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
                                onTap: () => startEditingApp(appIdx, 'domain'),
                                child: Text(
                                  app.domain,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () => removeApp(appIdx),
                              tooltip: 'Delete app',
                            ),
                          ],
                        ),
                        if (app.description.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              app.description,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Tasks',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton.icon(
                              icon: const Icon(Icons.add),
                              label: const Text('Add a task'),
                              onPressed: () => openTaskModal(appIdx),
                            ),
                          ],
                        ),
                        if ((app.tasks as List).isEmpty)
                          const Text('Aucune tâche pour cette app.'),
                        if ((app.tasks as List).isNotEmpty)
                          ...List.generate(app.tasks.length, (taskIdx) {
                            final task = app.tasks[taskIdx];
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(task.prompt),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (task.uploadLimit != null)
                                    Container(
                                      margin: const EdgeInsets.only(
                                        top: 2,
                                        right: 4,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius: BorderRadius.circular(8),
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
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.green[50],
                                        borderRadius: BorderRadius.circular(8),
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
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.videocam),
                                    tooltip: 'Record Task',
                                    onPressed: () {
                                      final appInfo = AppInfo(
                                        type: 'website',
                                        name: app.name,
                                        url: 'https://${app.domain}',
                                        taskId: task.id,
                                      );
                                      final appParam = Uri.encodeComponent(
                                        jsonEncode(appInfo.toJson()),
                                      );

                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingSessionView(
                                            prompt: task.prompt,
                                            appParam: appParam,
                                            poolId: widget.pool.id,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () =>
                                        openTaskModal(appIdx, taskIdx),
                                    tooltip: 'Edit task',
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline),
                                    onPressed: () =>
                                        removeTask(appIdx, taskIdx),
                                    tooltip: 'Delete task',
                                  ),
                                ],
                              ),
                            );
                          }),
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
                        onPressed: () => setState(() => showTaskModal = false),
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
    );
  }
}
