// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
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
    double? tokenBalance,
    DateTime? createdAt,
  }) = _TrainingPool;

  factory TrainingPool.fromJson(Map<String, dynamic> json) =>
      _$TrainingPoolFromJson(json);
}
