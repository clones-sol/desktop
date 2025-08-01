import 'package:clones_desktop/application/apps.dart';
import 'package:clones_desktop/application/pool.dart';
import 'package:clones_desktop/application/session/provider.dart';
import 'package:clones_desktop/domain/models/forge_task/forge_app.dart';
import 'package:clones_desktop/ui/views/generate_factory/bloc/setters.dart';
import 'package:clones_desktop/ui/views/generate_factory/bloc/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class GenerateFactoryNotifier extends _$GenerateFactoryNotifier
    with GenerateFactorySetters {
  GenerateFactoryNotifier();

  @override
  GenerateFactoryState build() {
    return const GenerateFactoryState();
  }

  Future<void> startGeneration() async {
    if (state.skills?.trim().isEmpty ?? true) return;
    state = state.copyWith(currentStep: GenerateFactoryStep.generating);
    try {
      final result = await ref.read(
        generateAppsProvider(prompt: state.skills!.trim()).future,
      );
      final forgeApps = (result['content']['apps'] as List)
          .map((app) => ForgeApp.fromJson(app))
          .toList();

      setFactoryName(result['content']['name'] ?? 'Desktop Agent Factory');
      setApps(forgeApps);
      setCurrentStep(GenerateFactoryStep.preview);
    } catch (e) {
      setError(e.toString());
      setCurrentStep(GenerateFactoryStep.input);
    }
  }

  void updateAppName(int appIndex, String value) {
    if (state.apps == null) return;
    final newApps = List<ForgeApp>.from(state.apps!);
    newApps[appIndex] = newApps[appIndex].copyWith(name: value);
    setApps(newApps);
  }

  void updateTaskPrompt(int appIndex, int taskIndex, String value) {
    if (state.apps == null) return;
    final newApps = List<ForgeApp>.from(state.apps!);
    final appToUpdate = newApps[appIndex];
    final newTasks = List.from(appToUpdate.tasks);
    newTasks[taskIndex] = newTasks[taskIndex].copyWith(prompt: value);
    newApps[appIndex] = appToUpdate.copyWith(tasks: newTasks.cast());
    setApps(newApps);
  }

  Future<void> fetchSupportedTokens() async {
    try {
      final tokens = await ref.read(getSupportedTokensProvider.future);
      state = state.copyWith(
        supportedTokens: tokens,
        selectedTokenSymbol: tokens.isNotEmpty ? tokens.first.symbol : null,
      );
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> createPool() async {
    if (state.selectedTokenSymbol == null) {
      setError('Please select a reward token.');
      return;
    }

    try {
      state = state.copyWith(isCreating: true, error: null);
      await ref.read(
        createPoolWithAppsProvider(
          poolName: state.factoryName ?? 'New Factory',
          skills: state.skills ?? '',
          tokenSymbol: state.selectedTokenSymbol!,
          apps: state.apps ?? [],
          ownerAddress: ref.read(sessionNotifierProvider).address!,
        ).future,
      );
      state = state.copyWith(isCreating: false, isCreated: true);
      ref.invalidate(listPoolsProvider);
    } catch (e) {
      state = state.copyWith(
        isCreating: false,
        error: e.toString(),
      );
    }
  }
}
