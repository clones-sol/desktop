import 'package:clones_desktop/domain/models/agent/deployment_version.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_deployment.freezed.dart';
part 'agent_deployment.g.dart';

enum AgentDeploymentStatus {
  @JsonValue('DRAFT')
  draft,
  @JsonValue('PENDING_TOKEN_SIGNATURE')
  pendingTokenSignature,
  @JsonValue('TOKEN_CREATED')
  tokenCreated,
  @JsonValue('PENDING_POOL_SIGNATURE')
  pendingPoolSignature,
  @JsonValue('DEPLOYED')
  deployed,
  @JsonValue('DEACTIVATED')
  deactivated,
  @JsonValue('FAILED')
  failed,
  @JsonValue('ARCHIVED')
  archived,
}

extension AgentDeploymentStatusExtension on AgentDeploymentStatus {
  String get jsonValue {
    switch (this) {
      case AgentDeploymentStatus.draft:
        return 'DRAFT';
      case AgentDeploymentStatus.pendingTokenSignature:
        return 'PENDING_TOKEN_SIGNATURE';
      case AgentDeploymentStatus.tokenCreated:
        return 'TOKEN_CREATED';
      case AgentDeploymentStatus.pendingPoolSignature:
        return 'PENDING_POOL_SIGNATURE';
      case AgentDeploymentStatus.deployed:
        return 'DEPLOYED';
      case AgentDeploymentStatus.deactivated:
        return 'DEACTIVATED';
      case AgentDeploymentStatus.failed:
        return 'FAILED';
      case AgentDeploymentStatus.archived:
        return 'ARCHIVED';
    }
  }

  bool get isActive => this == AgentDeploymentStatus.deployed;
  bool get isDeploying =>
      this == AgentDeploymentStatus.pendingTokenSignature ||
      this == AgentDeploymentStatus.pendingPoolSignature;
  bool get canEdit => this == AgentDeploymentStatus.draft;
  bool get canDeploy => this == AgentDeploymentStatus.draft;
  bool get canRetry => this == AgentDeploymentStatus.failed;
}

@freezed
class AgentDeployment with _$AgentDeployment {
  const factory AgentDeployment({
    required AgentDeploymentStatus status,
    String? lastError,
    @Default(0) int consecutiveFailures,
    String? activeVersionTag,
    @Default([]) List<DeploymentVersion> versions,
  }) = _AgentDeployment;

  factory AgentDeployment.fromJson(Map<String, dynamic> json) =>
      _$AgentDeploymentFromJson(json);
}
