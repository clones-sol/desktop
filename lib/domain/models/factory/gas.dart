import 'package:freezed_annotation/freezed_annotation.dart';

part 'gas.freezed.dart';
part 'gas.g.dart';

/// Gas estimation data for claims
@freezed
class GasEstimate with _$GasEstimate {
  const factory GasEstimate({
    required String gasLimit,
    required String maxFeePerGas,
    required String maxPriorityFeePerGas,
    required String totalGasCost,
    required String totalGasCostEth,
    required double totalGasCostUsd,
  }) = _GasEstimate;

  factory GasEstimate.fromJson(Map<String, dynamic> json) =>
      _$GasEstimateFromJson(json);
}

/// Gas analysis with smart alerts
@freezed
class GasAnalysis with _$GasAnalysis {
  const factory GasAnalysis({
    required GasEstimate estimatedGas,
    required String netReward,
    required double netRewardUsd,
    required double gasCostVsReward,
    required bool shouldWarn,
    required String recommendation,
  }) = _GasAnalysis;

  factory GasAnalysis.fromJson(Map<String, dynamic> json) =>
      _$GasAnalysisFromJson(json);
}

/// Batch optimization results
@freezed
class BatchOptimization with _$BatchOptimization {
  const factory BatchOptimization({
    required List<ClaimData> originalClaims,
    required List<List<ClaimData>> optimizedBatches,
    required String totalGasSavings,
    required double savingsPercentage,
    required String recommendation,
  }) = _BatchOptimization;

  factory BatchOptimization.fromJson(Map<String, dynamic> json) =>
      _$BatchOptimizationFromJson(json);
}

/// Gas price advice for optimal timing
@freezed
class GasPriceAdvice with _$GasPriceAdvice {
  const factory GasPriceAdvice({
    required String currentGasPrice,
    required double gasPriceGwei,
    required String gasPriceLevel, // 'low', 'medium', 'high', 'very-high'
    required String recommendation,
    String? suggestedWaitTime,
  }) = _GasPriceAdvice;

  factory GasPriceAdvice.fromJson(Map<String, dynamic> json) =>
      _$GasPriceAdviceFromJson(json);
}

/// Represents claim data for batch operations
@freezed
class ClaimData with _$ClaimData {
  const factory ClaimData({
    required String vault,
    required String account,
    required String cumulativeAmount,
    required int deadline,
    required String signature,
  }) = _ClaimData;

  factory ClaimData.fromJson(Map<String, dynamic> json) =>
      _$ClaimDataFromJson(json);
}
