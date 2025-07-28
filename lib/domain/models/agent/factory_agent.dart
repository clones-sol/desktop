import 'package:clones_desktop/domain/models/agent/agent_audit_log_entry.dart';
import 'package:clones_desktop/domain/models/agent/agent_blockchain.dart';
import 'package:clones_desktop/domain/models/agent/agent_deployment.dart';
import 'package:clones_desktop/domain/models/agent/agent_legal.dart';
import 'package:clones_desktop/domain/models/agent/agent_tokenomics.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'factory_agent.freezed.dart';
part 'factory_agent.g.dart';

@freezed
class FactoryAgent with _$FactoryAgent {
  const factory FactoryAgent({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'pool_id') required String poolId,
    required String name,
    required String ticker,
    required String description,
    String? logoUrl,
    required AgentTokenomics tokenomics,
    required AgentLegal legal,
    required AgentDeployment deployment,
    required AgentBlockchain blockchain,
    @Default([]) List<AgentAuditLogEntry> auditLog,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _FactoryAgent;

  factory FactoryAgent.fromJson(Map<String, dynamic> json) =>
      _$FactoryAgentFromJson(json);
}
