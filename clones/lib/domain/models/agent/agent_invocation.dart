// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_invocation.freezed.dart';
part 'agent_invocation.g.dart';

@freezed
class AgentInvocation with _$AgentInvocation {
  const factory AgentInvocation({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'agentId') required String agentId,
    required String versionTag,
    required DateTime timestamp,
    required int durationMs,
    required bool isSuccess,
    int? httpStatus,
    DateTime? createdAt,
  }) = _AgentInvocation;

  factory AgentInvocation.fromJson(Map<String, dynamic> json) =>
      _$AgentInvocationFromJson(json);
}
