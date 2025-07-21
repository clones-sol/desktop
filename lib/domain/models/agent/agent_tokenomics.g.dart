// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_tokenomics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentTokenomicsImpl _$$AgentTokenomicsImplFromJson(
        Map<String, dynamic> json) =>
    _$AgentTokenomicsImpl(
      supply: (json['supply'] as num).toInt(),
      minLiquiditySol: (json['minLiquiditySol'] as num).toDouble(),
      gatedPercentage: (json['gatedPercentage'] as num?)?.toDouble() ?? 0,
      decimals: (json['decimals'] as num?)?.toInt() ?? 9,
    );

Map<String, dynamic> _$$AgentTokenomicsImplToJson(
        _$AgentTokenomicsImpl instance) =>
    <String, dynamic>{
      'supply': instance.supply,
      'minLiquiditySol': instance.minLiquiditySol,
      'gatedPercentage': instance.gatedPercentage,
      'decimals': instance.decimals,
    };
