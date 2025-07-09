// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_deployment_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentDeploymentInfoImpl _$$AgentDeploymentInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$AgentDeploymentInfoImpl(
      name: json['name'] as String,
      ticker: json['ticker'] as String,
      description: json['description'] as String,
      logo: (json['logo'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      proofOfExecutionVideo: (json['proofOfExecutionVideo'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      supplyPreset: (json['supplyPreset'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AgentDeploymentInfoImplToJson(
        _$AgentDeploymentInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ticker': instance.ticker,
      'description': instance.description,
      'logo': instance.logo,
      'proofOfExecutionVideo': instance.proofOfExecutionVideo,
      'supplyPreset': instance.supplyPreset,
    };
