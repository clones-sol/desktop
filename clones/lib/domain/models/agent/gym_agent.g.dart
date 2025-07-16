// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_agent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GymAgentImpl _$$GymAgentImplFromJson(Map<String, dynamic> json) =>
    _$GymAgentImpl(
      id: json['_id'] as String,
      poolId: json['pool_id'] as String,
      name: json['name'] as String,
      ticker: json['ticker'] as String,
      description: json['description'] as String,
      logoUrl: json['logoUrl'] as String?,
      tokenomics:
          AgentTokenomics.fromJson(json['tokenomics'] as Map<String, dynamic>),
      legal: AgentLegal.fromJson(json['legal'] as Map<String, dynamic>),
      deployment:
          AgentDeployment.fromJson(json['deployment'] as Map<String, dynamic>),
      blockchain:
          AgentBlockchain.fromJson(json['blockchain'] as Map<String, dynamic>),
      auditLog: (json['auditLog'] as List<dynamic>?)
              ?.map(
                  (e) => AgentAuditLogEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GymAgentImplToJson(_$GymAgentImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'pool_id': instance.poolId,
      'name': instance.name,
      'ticker': instance.ticker,
      'description': instance.description,
      'logoUrl': instance.logoUrl,
      'tokenomics': instance.tokenomics,
      'legal': instance.legal,
      'deployment': instance.deployment,
      'blockchain': instance.blockchain,
      'auditLog': instance.auditLog,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
