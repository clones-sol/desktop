import 'package:clones/application/pool.dart';
import 'package:clones/domain/models/forge_task/forge_app.dart';
import 'package:clones/domain/models/forge_task/forge_task_item.dart';
import 'package:clones/domain/models/upload/upload_limit.dart';
import 'package:clones/ui/views/forge_detail/bloc/setters.dart';
import 'package:clones/ui/views/forge_detail/bloc/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class ForgeDetailNotifier extends _$ForgeDetailNotifier
    with ForgeDetailSetters {
  ForgeDetailNotifier();

  @override
  ForgeDetailState build() {
    return const ForgeDetailState();
  }

  Future<void> refreshBalance() async {
    setIsRefreshBalanceSuccess(false);
    setError(null);
    final pool = state.pool;
    if (pool == null) {
      throw Exception('Pool not found');
    }

    try {
      await ref.read(
        refreshPoolProvider(
          poolId: pool.id,
        ).future,
      );
      setIsRefreshBalanceSuccess(true);
    } catch (e) {
      setError(e.toString());
    }

    final newPool = await ref.refresh(poolProvider(pool.id).future);
    ref.read(forgeDetailNotifierProvider.notifier).setPool(newPool);
  }

  Future<void> updateGymStatus() async {
    setIsUpdateGymStatusSuccess(false);
    try {
      await _updatePool();
      setIsUpdateGymStatusSuccess(true);

      final newPool =
          await ref.refresh(poolProvider(state.pool?.id ?? '').future);
      ref.read(forgeDetailNotifierProvider.notifier).setPool(newPool);
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> updatePool() async {
    setIsUpdatePoolSuccess(false);
    try {
      await _updatePool();
      setIsUpdatePoolSuccess(true);

      final newPool =
          await ref.refresh(poolProvider(state.pool?.id ?? '').future);
      ref.read(forgeDetailNotifierProvider.notifier).setPool(newPool);
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> _updateAlertEmail() async {
    ref.read(
      updatePoolEmailProvider(
        poolId: state.pool?.id ?? '',
        email: state.alertEmail,
      ),
    );
  }

  Future<void> _updatePool() async {
    setError(null);
    final pool = state.pool;
    if (pool == null) {
      throw Exception('Pool not found');
    }

    await ref.read(
      updatePoolProvider(
        poolId: pool.id,
        poolName: state.gymName,
        status: state.gymStatus,
        skills: pool.skills,
        apps: state.apps,
        pricePerDemo: state.pricePerDemo,
        uploadLimit: state.uploadLimitType == 'none'
            ? null
            : UploadLimit(
                type: state.uploadLimitValue,
                limitType:
                    UploadLimitTypeExtension.parse(state.uploadLimitType) ??
                        UploadLimitType.perTask,
              ),
      ).future,
    );

    if ((pool.ownerEmail == null && state.alertEmail.isNotEmpty) ||
        (pool.ownerEmail != null &&
            state.alertEmail.isNotEmpty &&
            pool.ownerEmail != state.alertEmail)) {
      await _updateAlertEmail();
    }
  }

  void createApp() {
    setError(null);

    if (state.newAppName == null || state.newAppName!.isEmpty) {
      setError('Name is required');
      return;
    }

    final newApp = ForgeApp(
      name: state.newAppName!,
      domain: state.newAppDomain!,
      description: '',
    );
    state.apps.add(newApp);

    setNewAppName('');
    setNewAppDomain('');
    setShowNewAppForm(false);
  }

  void removeApp(int idx) {
    final apps = List<ForgeApp>.from(state.apps);
    final newApps = List<ForgeApp>.from(apps)..removeAt(idx);
    setApps(newApps);
    setHasUnsavedChanges(true);
  }

  void removeTask(int appIdx, int taskIdx) {
    final apps = List<ForgeApp>.from(state.apps);
    final app = apps[appIdx];
    final newTasks = List<ForgeTaskItem>.from(app.tasks)..removeAt(taskIdx);
    apps[appIdx] = app.copyWith(tasks: newTasks);

    setApps(apps);
    setHasUnsavedChanges(true);
  }

  void createTask(int appIndex, ForgeTaskItem task) {
    final apps = List<ForgeApp>.from(state.apps);
    final app = apps[appIndex];
    final newTasks = List<ForgeTaskItem>.from(app.tasks)..add(task);
    apps[appIndex] = app.copyWith(tasks: newTasks);
    setApps(apps);
    setHasUnsavedChanges(true);
  }

  void updateTask(int appIndex, int taskIndex, ForgeTaskItem task) {
    final apps = List<ForgeApp>.from(state.apps);
    final app = apps[appIndex];
    final newTasks = List<ForgeTaskItem>.from(app.tasks);
    newTasks[taskIndex] = task;
    apps[appIndex] = app.copyWith(tasks: newTasks);
    setApps(apps);
    setHasUnsavedChanges(true);
  }
}
