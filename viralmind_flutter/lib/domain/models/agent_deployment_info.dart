// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_deployment_info.freezed.dart';
part 'agent_deployment_info.g.dart';

enum AgentDeploymentInfoStatus {
  none,
  tokenSPLDeployed,
  poolCreated,
}

@freezed
class AgentDeploymentInfo with _$AgentDeploymentInfo {
  const factory AgentDeploymentInfo({
    required String name,
    required String ticker,
    required String description,
    List<int>? logo,
    List<int>? proofOfExecutionVideo,
    @Default(0) int supplyPreset,
  }) = _AgentDeploymentInfo;

  factory AgentDeploymentInfo.fromJson(Map<String, dynamic> json) =>
      _$AgentDeploymentInfoFromJson(json);
}
