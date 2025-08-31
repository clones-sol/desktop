import 'package:clones_desktop/domain/models/factory/gas.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// State pour les alertes gas
class GasAlertState {
  const GasAlertState({
    this.currentAlert,
    this.isVisible = false,
    this.gasPriceAdvice,
  });

  final GasAnalysis? currentAlert;
  final bool isVisible;
  final GasPriceAdvice? gasPriceAdvice;

  GasAlertState copyWith({
    GasAnalysis? currentAlert,
    bool? isVisible,
    GasPriceAdvice? gasPriceAdvice,
  }) {
    return GasAlertState(
      currentAlert: currentAlert,
      isVisible: isVisible ?? (currentAlert != null),
      gasPriceAdvice: gasPriceAdvice,
    );
  }
}

// Provider pour l'état des alertes gas
final gasAlertProvider =
    StateNotifierProvider<GasAlertNotifier, GasAlertState>((ref) {
  return GasAlertNotifier();
});

class GasAlertNotifier extends StateNotifier<GasAlertState> {
  GasAlertNotifier() : super(const GasAlertState());

  // Afficher une alerte gas
  void showGasAlert(GasAnalysis gasAnalysis) {
    state = state.copyWith(
      currentAlert: gasAnalysis,
      isVisible: true,
    );
  }

  // Masquer l'alerte actuelle
  void hideAlert() {
    state = state.copyWith(
      isVisible: false,
    );
  }

  // Mettre à jour les informations de prix gas
  void updateGasPriceAdvice(GasPriceAdvice advice) {
    state = state.copyWith(gasPriceAdvice: advice);
  }

  // Vérifier si une alerte doit être affichée pour une transaction
  void checkGasAlert({
    required String gasLimit,
    required String maxFeePerGas,
    required String netReward,
    String? recommendation,
  }) {
    try {
      final gasLimitInt = int.parse(gasLimit);
      final maxFeePerGasInt = int.parse(maxFeePerGas);
      final netRewardDouble = double.parse(netReward);

      // Calcul simple du coût gas vs récompense
      final gasCost =
          (gasLimitInt * maxFeePerGasInt) / 1e18; // Convert Wei to ETH
      final gasCostVsReward = (gasCost / netRewardDouble) * 100;

      final shouldWarn = gasCostVsReward >
          25; // Alerter si le gas coûte plus de 25% de la récompense

      if (shouldWarn) {
        final gasAnalysis = GasAnalysis(
          estimatedGas: GasEstimate(
            gasLimit: gasLimit,
            maxFeePerGas: maxFeePerGas,
            maxPriorityFeePerGas: '0',
            totalGasCost: gasCost.toString(),
            totalGasCostEth: gasCost.toString(),
            totalGasCostUsd: gasCost * 2000, // ETH price approximation
          ),
          netReward: netReward,
          netRewardUsd: netRewardDouble * 2000,
          gasCostVsReward: gasCostVsReward,
          shouldWarn: shouldWarn,
          recommendation: recommendation ??
              'Gas fees are ${gasCostVsReward.toStringAsFixed(1)}% of your reward. Consider waiting for lower gas prices.',
        );

        showGasAlert(gasAnalysis);
      }
    } catch (e) {
      // Ignore errors in gas calculation
    }
  }

  // Simuler une vérification périodique des prix gas (pour demo)
  void startGasPriceMonitoring() {
    // Cette méthode pourrait appeler une API pour obtenir les prix gas actuels
    // et mettre à jour gasPriceAdvice régulièrement
  }

  void stopGasPriceMonitoring() {
    // Arrêter le monitoring
  }
}
