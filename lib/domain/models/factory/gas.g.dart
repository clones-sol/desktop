// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GasEstimateImpl _$$GasEstimateImplFromJson(Map<String, dynamic> json) =>
    _$GasEstimateImpl(
      gasLimit: json['gasLimit'] as String,
      maxFeePerGas: json['maxFeePerGas'] as String,
      maxPriorityFeePerGas: json['maxPriorityFeePerGas'] as String,
      totalGasCost: json['totalGasCost'] as String,
      totalGasCostEth: json['totalGasCostEth'] as String,
      totalGasCostUsd: (json['totalGasCostUsd'] as num).toDouble(),
    );

Map<String, dynamic> _$$GasEstimateImplToJson(_$GasEstimateImpl instance) =>
    <String, dynamic>{
      'gasLimit': instance.gasLimit,
      'maxFeePerGas': instance.maxFeePerGas,
      'maxPriorityFeePerGas': instance.maxPriorityFeePerGas,
      'totalGasCost': instance.totalGasCost,
      'totalGasCostEth': instance.totalGasCostEth,
      'totalGasCostUsd': instance.totalGasCostUsd,
    };

_$GasAnalysisImpl _$$GasAnalysisImplFromJson(Map<String, dynamic> json) =>
    _$GasAnalysisImpl(
      estimatedGas:
          GasEstimate.fromJson(json['estimatedGas'] as Map<String, dynamic>),
      netReward: json['netReward'] as String,
      netRewardUsd: (json['netRewardUsd'] as num).toDouble(),
      gasCostVsReward: (json['gasCostVsReward'] as num).toDouble(),
      shouldWarn: json['shouldWarn'] as bool,
      recommendation: json['recommendation'] as String,
    );

Map<String, dynamic> _$$GasAnalysisImplToJson(_$GasAnalysisImpl instance) =>
    <String, dynamic>{
      'estimatedGas': instance.estimatedGas,
      'netReward': instance.netReward,
      'netRewardUsd': instance.netRewardUsd,
      'gasCostVsReward': instance.gasCostVsReward,
      'shouldWarn': instance.shouldWarn,
      'recommendation': instance.recommendation,
    };

_$BatchOptimizationImpl _$$BatchOptimizationImplFromJson(
        Map<String, dynamic> json) =>
    _$BatchOptimizationImpl(
      originalClaims: (json['originalClaims'] as List<dynamic>)
          .map((e) => ClaimData.fromJson(e as Map<String, dynamic>))
          .toList(),
      optimizedBatches: (json['optimizedBatches'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => ClaimData.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      totalGasSavings: json['totalGasSavings'] as String,
      savingsPercentage: (json['savingsPercentage'] as num).toDouble(),
      recommendation: json['recommendation'] as String,
    );

Map<String, dynamic> _$$BatchOptimizationImplToJson(
        _$BatchOptimizationImpl instance) =>
    <String, dynamic>{
      'originalClaims': instance.originalClaims,
      'optimizedBatches': instance.optimizedBatches,
      'totalGasSavings': instance.totalGasSavings,
      'savingsPercentage': instance.savingsPercentage,
      'recommendation': instance.recommendation,
    };

_$GasPriceAdviceImpl _$$GasPriceAdviceImplFromJson(Map<String, dynamic> json) =>
    _$GasPriceAdviceImpl(
      currentGasPrice: json['currentGasPrice'] as String,
      gasPriceGwei: (json['gasPriceGwei'] as num).toDouble(),
      gasPriceLevel: json['gasPriceLevel'] as String,
      recommendation: json['recommendation'] as String,
      suggestedWaitTime: json['suggestedWaitTime'] as String?,
    );

Map<String, dynamic> _$$GasPriceAdviceImplToJson(
        _$GasPriceAdviceImpl instance) =>
    <String, dynamic>{
      'currentGasPrice': instance.currentGasPrice,
      'gasPriceGwei': instance.gasPriceGwei,
      'gasPriceLevel': instance.gasPriceLevel,
      'recommendation': instance.recommendation,
      'suggestedWaitTime': instance.suggestedWaitTime,
    };

_$ClaimDataImpl _$$ClaimDataImplFromJson(Map<String, dynamic> json) =>
    _$ClaimDataImpl(
      vault: json['vault'] as String,
      account: json['account'] as String,
      cumulativeAmount: json['cumulativeAmount'] as String,
      deadline: (json['deadline'] as num).toInt(),
      signature: json['signature'] as String,
    );

Map<String, dynamic> _$$ClaimDataImplToJson(_$ClaimDataImpl instance) =>
    <String, dynamic>{
      'vault': instance.vault,
      'account': instance.account,
      'cumulativeAmount': instance.cumulativeAmount,
      'deadline': instance.deadline,
      'signature': instance.signature,
    };
