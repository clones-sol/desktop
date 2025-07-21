// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_deployment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentDeploymentImpl _$$AgentDeploymentImplFromJson(
        Map<String, dynamic> json) =>
    _$AgentDeploymentImpl(
      status: $enumDecode(_$AgentDeploymentStatusEnumMap, json['status']),
      lastError: json['lastError'] as String?,
      consecutiveFailures: (json['consecutiveFailures'] as num?)?.toInt() ?? 0,
      activeVersionTag: json['activeVersionTag'] as String?,
      versions: (json['versions'] as List<dynamic>?)
              ?.map(
                  (e) => DeploymentVersion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AgentDeploymentImplToJson(
        _$AgentDeploymentImpl instance) =>
    <String, dynamic>{
      'status': _$AgentDeploymentStatusEnumMap[instance.status]!,
      'lastError': instance.lastError,
      'consecutiveFailures': instance.consecutiveFailures,
      'activeVersionTag': instance.activeVersionTag,
      'versions': instance.versions,
    };

const _$AgentDeploymentStatusEnumMap = {
  AgentDeploymentStatus.draft: 'DRAFT',
  AgentDeploymentStatus.pendingTokenSignature: 'PENDING_TOKEN_SIGNATURE',
  AgentDeploymentStatus.tokenCreated: 'TOKEN_CREATED',
  AgentDeploymentStatus.pendingPoolSignature: 'PENDING_POOL_SIGNATURE',
  AgentDeploymentStatus.deployed: 'DEPLOYED',
  AgentDeploymentStatus.deactivated: 'DEACTIVATED',
  AgentDeploymentStatus.failed: 'FAILED',
  AgentDeploymentStatus.archived: 'ARCHIVED',
};
