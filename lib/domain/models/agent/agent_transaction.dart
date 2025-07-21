// ignore_for_file: invalid_annotation_target

import 'package:clones_desktop/domain/models/agent/agent_deployment.dart';
import 'package:clones_desktop/domain/models/agent/gym_agent.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_transaction.freezed.dart';
part 'agent_transaction.g.dart';

enum AgentTransactionType {
  @JsonValue('TOKEN_CREATION')
  tokenCreation,
  @JsonValue('POOL_CREATION')
  poolCreation,
}

extension AgentTransactionTypeExtension on AgentTransactionType {
  String get jsonValue {
    switch (this) {
      case AgentTransactionType.tokenCreation:
        return 'TOKEN_CREATION';
      case AgentTransactionType.poolCreation:
        return 'POOL_CREATION';
    }
  }
}

@freezed
class UnsignedTransaction with _$UnsignedTransaction {
  const factory UnsignedTransaction({
    required String transaction,
    required String idempotencyKey,
    required double estimatedFeeSol,
  }) = _UnsignedTransaction;

  factory UnsignedTransaction.fromJson(Map<String, dynamic> json) =>
      _$UnsignedTransactionFromJson(json);
}

@freezed
class SignedTransactionRequest with _$SignedTransactionRequest {
  const factory SignedTransactionRequest({
    required AgentTransactionType type,
    required String signedTransaction,
    required String idempotencyKey,
  }) = _SignedTransactionRequest;

  factory SignedTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$SignedTransactionRequestFromJson(json);
}

@freezed
class AgentHealth with _$AgentHealth {
  const factory AgentHealth({
    required String status,
    String? message,
  }) = _AgentHealth;

  factory AgentHealth.fromJson(Map<String, dynamic> json) =>
      _$AgentHealthFromJson(json);
}

@freezed
class AgentMetrics with _$AgentMetrics {
  const factory AgentMetrics({
    required String timeframe,
    required int totalRequests,
    required double errorRate,
    required int averageResponseTimeMs,
  }) = _AgentMetrics;

  factory AgentMetrics.fromJson(Map<String, dynamic> json) =>
      _$AgentMetricsFromJson(json);
}

@freezed
class AgentSearchResponse with _$AgentSearchResponse {
  const factory AgentSearchResponse({
    required List<GymAgent> data,
    required AgentPagination pagination,
  }) = _AgentSearchResponse;

  factory AgentSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$AgentSearchResponseFromJson(json);
}

@freezed
class AgentPagination with _$AgentPagination {
  const factory AgentPagination({
    required int total,
    required int limit,
    required int offset,
  }) = _AgentPagination;

  factory AgentPagination.fromJson(Map<String, dynamic> json) =>
      _$AgentPaginationFromJson(json);
}

@freezed
class SubmitTxResponse with _$SubmitTxResponse {
  const factory SubmitTxResponse({
    required String message,
    required String agentId,
    required AgentDeploymentStatus status,
    required String idempotencyKey,
  }) = _SubmitTxResponse;

  factory SubmitTxResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitTxResponseFromJson(json);
}
