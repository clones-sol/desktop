import 'package:clones/application/apps.dart';
import 'package:clones/application/pool.dart';
import 'package:clones/application/session/provider.dart';
import 'package:clones/domain/models/forge_task/forge_app.dart';
import 'package:clones/domain/models/token.dart';
import 'package:clones/ui/views/generate_gym/bloc/setters.dart';
import 'package:clones/ui/views/generate_gym/bloc/state.dart';
import 'package:clones/utils/env.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  Future<void> createPool() async {
    try {
      final session = ref.watch(sessionNotifierProvider);
      if (session.address == null) return;

      final token = Token(
        type: TokenType.viral,
        symbol: Token.getTokenType(TokenType.viral),
        address: Env.viralTokenAddress,
      );
      await ref.read(
        createPoolWithAppsProvider(
          poolName: state.gymName ?? 'Unnamed Gym',
          skills: state.skills!,
          token: token,
          apps: state.apps ?? [],
          ownerAddress: session.address!,
        ).future,
      );
      ref.invalidate(listPoolsProvider);
    } catch (e) {
      setError(e.toString());
    }
  }
}
