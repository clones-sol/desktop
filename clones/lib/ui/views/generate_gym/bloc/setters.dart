import 'package:clones/domain/models/forge_task/forge_app.dart';
import 'package:clones/ui/views/generate_gym/bloc/state.dart';
import 'package:riverpod/riverpod.dart';

mixin GenerateGymSetters on AutoDisposeNotifier<GenerateGymState> {
  void setCurrentStep(GenerateGymStep currentStep) {
    state = state.copyWith(currentStep: currentStep);
  }

  void setSkills(String skills) {
    state = state.copyWith(skills: skills);
  }

  void setError(String error) {
    state = state.copyWith(error: error);
  }

  void setGymName(String gymName) {
    state = state.copyWith(gymName: gymName);
  }

  void setApps(List<ForgeApp> apps) {
    state = state.copyWith(apps: apps);
  }

  void setSelectedToken(String symbol) {
    state = state.copyWith(selectedTokenSymbol: symbol);
  }
}
