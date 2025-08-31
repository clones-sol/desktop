import 'package:clones_desktop/application/factory.dart';
import 'package:clones_desktop/domain/models/factory/factory_app.dart';
import 'package:clones_desktop/domain/models/factory/factory_task.dart';
import 'package:clones_desktop/ui/views/forge_detail/bloc/setters.dart';
import 'package:clones_desktop/ui/views/forge_detail/bloc/state.dart';
import 'package:flutter/foundation.dart';
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
    final factory = state.factory;
    if (factory == null) {
      throw Exception('Factory not found');
    }

    try {
      // Fetch fresh pool info from backend/blockchain
      final poolInfoData = await ref.read(
        getPoolInfoProvider(
          poolAddress: factory.poolAddress,
        ).future,
      );

      // Extract tokenBalance from the API response
      final responseData = poolInfoData['data'] as Map<String, dynamic>?;
      if (responseData != null && responseData.containsKey('tokenBalance')) {
        final tokenBalanceString = responseData['tokenBalance'] as String?;
        if (tokenBalanceString != null) {
          final newBalance = double.tryParse(tokenBalanceString) ?? 0.0;

          // Update factory balance in state
          updateFactoryBalance(newBalance);

          debugPrint(
            'Factory balance refreshed: $newBalance ${factory.token.symbol}',
          );
        }
      }

      setIsRefreshBalanceSuccess(true);
    } catch (e) {
      debugPrint('Failed to refresh factory balance: $e');
      setError(e.toString());
    }
  }

  Future<void> updateFactoryStatus() async {
    setIsUpdateFactoryStatusSuccess(false);

    try {
      final updatedFactory = await ref.read(
        updateFactoryProvider(
          factoryId: state.factory?.id ?? '',
          walletAddress: state.factory?.ownerAddress ?? '',
          status: state.factoryStatus,
        ).future,
      );
      setFactory(updatedFactory);
      setIsUpdateFactoryStatusSuccess(true);
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> updateFactory() async {
    setIsUpdatePoolSuccess(false);
    try {
      final updatedFactory = await ref.read(
        updateFactoryProvider(
          factoryId: state.factory?.id ?? '',
          walletAddress: state.factory?.ownerAddress ?? '',
          factoryName: state.factoryName,
          description: state.factory?.description ?? '',
          skills: state.factory?.skills ?? [],
          status: state.factoryStatus,
          pricePerDemo: state.pricePerDemo,
        ).future,
      );
      setFactory(updatedFactory);
      setIsUpdateFactoryStatusSuccess(true);
    } catch (e) {
      setError(e.toString());
    }
  }

  void createApp() {
    setError(null);

    if (state.newAppName == null || state.newAppName!.isEmpty) {
      setError('Name is required');
      return;
    }

    final newApp = FactoryApp(
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
    final apps = List<FactoryApp>.from(state.apps);
    final newApps = List<FactoryApp>.from(apps)..removeAt(idx);
    setApps(newApps);
    setHasUnsavedChanges(true);
  }

  void removeTask(int appIdx, int taskIdx) {
    final apps = List<FactoryApp>.from(state.apps);
    final app = apps[appIdx];
    final newTasks = List<FactoryTask>.from(app.tasks)..removeAt(taskIdx);
    apps[appIdx] = app.copyWith(tasks: newTasks);

    setApps(apps);
    setHasUnsavedChanges(true);
  }

  void createTask(int appIndex, FactoryTask task) {
    final apps = List<FactoryApp>.from(state.apps);
    final app = apps[appIndex];
    final newTasks = List<FactoryTask>.from(app.tasks)..add(task);
    apps[appIndex] = app.copyWith(tasks: newTasks);
    setApps(apps);
    setHasUnsavedChanges(true);
  }

  void updateTask(int appIndex, int taskIndex, FactoryTask task) {
    final apps = List<FactoryApp>.from(state.apps);
    final app = apps[appIndex];
    final newTasks = List<FactoryTask>.from(app.tasks);
    newTasks[taskIndex] = task;
    apps[appIndex] = app.copyWith(tasks: newTasks);
    setApps(apps);
    setHasUnsavedChanges(true);
  }
}
