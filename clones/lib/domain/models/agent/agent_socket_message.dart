// ignore_for_file: invalid_annotation_target

import 'package:clones/domain/models/agent/agent_deployment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_socket_message.freezed.dart';
part 'agent_socket_message.g.dart';

/// Represents the generic structure of a message received from the WebSocket.
@freezed
class AgentSocketMessage with _$AgentSocketMessage {
  const factory AgentSocketMessage.unknown(Map<String, dynamic> data) =
      _UnknownMessage;

  const factory AgentSocketMessage.error({
    required String error,
  }) = _ErrorMessage;

  const factory AgentSocketMessage.subscriptionSuccess({
    required bool success,
    required String message,
  }) = _SubscriptionSuccessMessage;

  const factory AgentSocketMessage.agentStatusUpdate({
    required String event,
    required AgentStatusUpdateData data,
  }) = _AgentStatusUpdateMessage;

  const factory AgentSocketMessage.txSubmitted({
    required String event,
    required TxSubmittedData data,
  }) = _TxSubmittedMessage;

  factory AgentSocketMessage.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('event')) {
      final event = json['event'] as String;
      if (event == 'agentStatusUpdate') {
        return AgentSocketMessage.agentStatusUpdate(
          event: event,
          data: AgentStatusUpdateData.fromJson(json['data']),
        );
      } else if (event == 'txSubmitted') {
        return AgentSocketMessage.txSubmitted(
          event: event,
          data: TxSubmittedData.fromJson(json['data']),
        );
      }
    }
    if (json.containsKey('error')) {
      return AgentSocketMessage.error(
        error: json['error'],
      );
    }
    if (json.containsKey('success')) {
      return AgentSocketMessage.subscriptionSuccess(
        success: json['success'],
        message: json['message'],
      );
    }
    return AgentSocketMessage.unknown(json);
  }
}

/// Data payload for the 'agentStatusUpdate' event.
@freezed
class AgentStatusUpdateData with _$AgentStatusUpdateData {
  const factory AgentStatusUpdateData({
    required String agentId,
    required AgentDeploymentStatus status,
    // The 'details' field can have a dynamic structure based on the status.
    // Using a Map is flexible enough to handle this.
    Map<String, dynamic>? details,
  }) = _AgentStatusUpdateData;

  factory AgentStatusUpdateData.fromJson(Map<String, dynamic> json) =>
      _$AgentStatusUpdateDataFromJson(json);
}

/// Data payload for the 'txSubmitted' event.
@freezed
class TxSubmittedData with _$TxSubmittedData {
  const factory TxSubmittedData({
    required String agentId,
    required String type,
    required String idempotencyKey,
  }) = _TxSubmittedData;

  factory TxSubmittedData.fromJson(Map<String, dynamic> json) =>
      _$TxSubmittedDataFromJson(json);
}
