// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_socket_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentStatusUpdateDataImpl _$$AgentStatusUpdateDataImplFromJson(
        Map<String, dynamic> json) =>
    _$AgentStatusUpdateDataImpl(
      agentId: json['agentId'] as String,
      status: $enumDecode(_$AgentDeploymentStatusEnumMap, json['status']),
      details: json['details'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AgentStatusUpdateDataImplToJson(
        _$AgentStatusUpdateDataImpl instance) =>
    <String, dynamic>{
      'agentId': instance.agentId,
      'status': _$AgentDeploymentStatusEnumMap[instance.status]!,
      'details': instance.details,
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

_$TxSubmittedDataImpl _$$TxSubmittedDataImplFromJson(
        Map<String, dynamic> json) =>
    _$TxSubmittedDataImpl(
      agentId: json['agentId'] as String,
      type: json['type'] as String,
      idempotencyKey: json['idempotencyKey'] as String,
    );

Map<String, dynamic> _$$TxSubmittedDataImplToJson(
        _$TxSubmittedDataImpl instance) =>
    <String, dynamic>{
      'agentId': instance.agentId,
      'type': instance.type,
      'idempotencyKey': instance.idempotencyKey,
    };
