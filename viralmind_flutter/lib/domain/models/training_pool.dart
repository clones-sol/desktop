// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/agent_deployment_info.dart';
import 'package:viralmind_flutter/domain/models/token.dart';
import 'package:viralmind_flutter/domain/models/upload/upload_limit.dart';

part 'training_pool.freezed.dart';
part 'training_pool.g.dart';

const kMinSolBalance = 0.017;

enum TrainingPoolStatus {
  @JsonValue('live')
  live,
  @JsonValue('paused')
  paused,
  @JsonValue('no-funds')
  noFunds,
  @JsonValue('no-gas')
  noGas,
}

extension TrainingPoolStatusExtension on TrainingPoolStatus {
  String get jsonValue {
    switch (this) {
      case TrainingPoolStatus.live:
        return 'live';
      case TrainingPoolStatus.paused:
        return 'paused';
      case TrainingPoolStatus.noFunds:
        return 'no-funds';
      case TrainingPoolStatus.noGas:
        return 'no-gas';
    }
  }
}

@freezed
class TrainingPool with _$TrainingPool {
  const factory TrainingPool({
    @JsonKey(name: '_id') required String id,
    required String name,
    required TrainingPoolStatus status,
    required int demonstrations,
    required double funds,
    double? solBalance,
    required Token token,
    required String skills,
    String? ownerEmail,
    required String ownerAddress,
    required String depositAddress,
    @Default(false) bool expanded,
    @Default(false) bool unsavedSkills,
    double? pricePerDemo,
    @Default(false) bool unsavedPrice,
    UploadLimit? uploadLimit,
    @Default(false) bool unsavedUploadLimit,
    DateTime? createdAt,
    AgentDeploymentInfo? agentDeploymentInfo,
  }) = _TrainingPool;

  factory TrainingPool.fromJson(Map<String, dynamic> json) =>
      _$TrainingPoolFromJson(json);
}
