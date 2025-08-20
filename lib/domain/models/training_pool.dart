// ignore_for_file: invalid_annotation_target

import 'package:clones_desktop/domain/models/token.dart';
import 'package:clones_desktop/domain/models/upload/upload_limit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_pool.freezed.dart';
part 'training_pool.g.dart';

const kMinEthBalance = 0.01;

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
    double? ethBalance,
    required Token token,
    required String skills,
    required String ownerAddress,
    required String depositAddress,
    @Default(false) bool expanded,
    @Default(false) bool unsavedSkills,
    double? pricePerDemo,
    @Default(false) bool unsavedPrice,
    UploadLimit? uploadLimit,
    @Default(false) bool unsavedUploadLimit,
    DateTime? createdAt,
  }) = _TrainingPool;

  factory TrainingPool.fromJson(Map<String, dynamic> json) =>
      _$TrainingPoolFromJson(json);
}
