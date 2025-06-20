import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/application/apps.dart';
import 'package:viralmind_flutter/application/pool.dart';
import 'package:viralmind_flutter/application/wallet.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';
import 'package:viralmind_flutter/domain/models/token.dart';
import 'package:viralmind_flutter/ui/views/generate_gym/bloc/setters.dart';
import 'package:viralmind_flutter/ui/views/generate_gym/bloc/state.dart';
import 'package:viralmind_flutter/utils/env.dart';

part 'provider.g.dart';

@riverpod
class GenerateGymNotifier extends _$GenerateGymNotifier
    with GenerateGymSetters {
  GenerateGymNotifier();

  @override
  GenerateGymState build() {
    return const GenerateGymState();
  }

  Future<void> startGeneration() async {
    if (state.skills?.trim().isEmpty ?? true) return;
    state = state.copyWith(currentStep: GenerateGymStep.generating);
    try {
      final result = await ref.read(
        generateAppsProvider(prompt: state.skills!.trim()).future,
      );
      final forgeApps = (result['content']['apps'] as List)
          .map((app) => ForgeApp.fromJson(app))
          .toList();

      setGymName(result['content']['name'] ?? 'Desktop Agent Gym');
      setApps(forgeApps);
      setCurrentStep(GenerateGymStep.preview);
    } catch (e) {
      setError(e.toString());
      setCurrentStep(GenerateGymStep.input);
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

  Future<void> save() async {
    try {
      final walletAddress = ref.read(walletAddressProvider).valueOrNull;
      if (walletAddress == null) return;

      final token = Token(
        type: TokenType.viral,
        symbol: 'VIRAL',
        address: Env.viralTokenAddress,
      );
      await ref.read(
        createPoolWithAppsProvider(
          poolName: state.gymName ?? 'Unnamed Gym',
          skills: state.skills!,
          token: token,
          apps: state.apps ?? [],
          ownerAddress: walletAddress,
        ).future,
      );
      ref.invalidate(listPoolsProvider);
    } catch (e) {
      setError(e.toString());
    }
  }
}
