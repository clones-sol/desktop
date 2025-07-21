// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_audit_log_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentAuditLogEntryImpl _$$AgentAuditLogEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$AgentAuditLogEntryImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      user: json['user'] as String,
      action: json['action'] as String,
      details: json['details'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AgentAuditLogEntryImplToJson(
        _$AgentAuditLogEntryImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'user': instance.user,
      'action': instance.action,
      'details': instance.details,
    };
