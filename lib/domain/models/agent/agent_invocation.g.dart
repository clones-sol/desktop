// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_invocation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentInvocationImpl _$$AgentInvocationImplFromJson(
        Map<String, dynamic> json) =>
    _$AgentInvocationImpl(
      id: json['_id'] as String,
      agentId: json['agentId'] as String,
      versionTag: json['versionTag'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      durationMs: (json['durationMs'] as num).toInt(),
      isSuccess: json['isSuccess'] as bool,
      httpStatus: (json['httpStatus'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AgentInvocationImplToJson(
        _$AgentInvocationImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'agentId': instance.agentId,
      'versionTag': instance.versionTag,
      'timestamp': instance.timestamp.toIso8601String(),
      'durationMs': instance.durationMs,
      'isSuccess': instance.isSuccess,
      'httpStatus': instance.httpStatus,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
