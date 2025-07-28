// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnsignedTransactionImpl _$$UnsignedTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$UnsignedTransactionImpl(
      transaction: json['transaction'] as String,
      idempotencyKey: json['idempotencyKey'] as String,
      estimatedFeeSol: (json['estimatedFeeSol'] as num).toDouble(),
    );

Map<String, dynamic> _$$UnsignedTransactionImplToJson(
        _$UnsignedTransactionImpl instance) =>
    <String, dynamic>{
      'transaction': instance.transaction,
      'idempotencyKey': instance.idempotencyKey,
      'estimatedFeeSol': instance.estimatedFeeSol,
    };

_$SignedTransactionRequestImpl _$$SignedTransactionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SignedTransactionRequestImpl(
      type: $enumDecode(_$AgentTransactionTypeEnumMap, json['type']),
      signedTransaction: json['signedTransaction'] as String,
      idempotencyKey: json['idempotencyKey'] as String,
    );

Map<String, dynamic> _$$SignedTransactionRequestImplToJson(
        _$SignedTransactionRequestImpl instance) =>
    <String, dynamic>{
      'type': _$AgentTransactionTypeEnumMap[instance.type]!,
      'signedTransaction': instance.signedTransaction,
      'idempotencyKey': instance.idempotencyKey,
    };

const _$AgentTransactionTypeEnumMap = {
  AgentTransactionType.tokenCreation: 'TOKEN_CREATION',
  AgentTransactionType.poolCreation: 'POOL_CREATION',
};

_$AgentHealthImpl _$$AgentHealthImplFromJson(Map<String, dynamic> json) =>
    _$AgentHealthImpl(
      status: json['status'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$AgentHealthImplToJson(_$AgentHealthImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

_$AgentMetricsImpl _$$AgentMetricsImplFromJson(Map<String, dynamic> json) =>
    _$AgentMetricsImpl(
      timeframe: json['timeframe'] as String,
      totalRequests: (json['totalRequests'] as num).toInt(),
      errorRate: (json['errorRate'] as num).toDouble(),
      averageResponseTimeMs: (json['averageResponseTimeMs'] as num).toInt(),
    );

Map<String, dynamic> _$$AgentMetricsImplToJson(_$AgentMetricsImpl instance) =>
    <String, dynamic>{
      'timeframe': instance.timeframe,
      'totalRequests': instance.totalRequests,
      'errorRate': instance.errorRate,
      'averageResponseTimeMs': instance.averageResponseTimeMs,
    };

_$AgentSearchResponseImpl _$$AgentSearchResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AgentSearchResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => FactoryAgent.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          AgentPagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AgentSearchResponseImplToJson(
        _$AgentSearchResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
    };

_$AgentPaginationImpl _$$AgentPaginationImplFromJson(
        Map<String, dynamic> json) =>
    _$AgentPaginationImpl(
      total: (json['total'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
    );

Map<String, dynamic> _$$AgentPaginationImplToJson(
        _$AgentPaginationImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
    };

_$SubmitTxResponseImpl _$$SubmitTxResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmitTxResponseImpl(
      message: json['message'] as String,
      agentId: json['agentId'] as String,
      status: $enumDecode(_$AgentDeploymentStatusEnumMap, json['status']),
      idempotencyKey: json['idempotencyKey'] as String,
    );

Map<String, dynamic> _$$SubmitTxResponseImplToJson(
        _$SubmitTxResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'agentId': instance.agentId,
      'status': _$AgentDeploymentStatusEnumMap[instance.status]!,
      'idempotencyKey': instance.idempotencyKey,
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
