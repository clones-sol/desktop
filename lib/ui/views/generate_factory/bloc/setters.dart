import 'package:clones_desktop/domain/models/factory/factory_app.dart';
import 'package:clones_desktop/ui/views/generate_factory/bloc/state.dart';
import 'package:riverpod/riverpod.dart';

mixin GenerateFactorySetters on AutoDisposeNotifier<GenerateFactoryState> {
  void setCurrentStep(GenerateFactoryStep currentStep) {
    state = state.copyWith(currentStep: currentStep);
  }

  void setSkills(String skills) {
    state = state.copyWith(skills: skills);
  }

  void setError(String error) {
    state = state.copyWith(error: error);
  }

  void setFactoryName(String factoryName) {
    state = state.copyWith(factoryName: factoryName);
  }

  void setApps(List<FactoryApp> apps) {
    state = state.copyWith(apps: apps);
  }

  void setSelectedToken(String symbol) {
    state = state.copyWith(selectedTokenSymbol: symbol);
  }

  // Abstract method to be implemented by the notifier
  Future<void> predictPoolAddress();

  void setFundingAmount(String amount) {
    state = state.copyWith(fundingAmount: amount);
  }
}
