import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_audit_log_entry.freezed.dart';
part 'agent_audit_log_entry.g.dart';

@freezed
class AgentAuditLogEntry with _$AgentAuditLogEntry {
  const factory AgentAuditLogEntry({
    required DateTime timestamp,
    required String user,
    required String action,
    Map<String, dynamic>? details,
  }) = _AgentAuditLogEntry;

  factory AgentAuditLogEntry.fromJson(Map<String, dynamic> json) =>
      _$AgentAuditLogEntryFromJson(json);
}
