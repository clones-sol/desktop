// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';

part 'extended_pool.freezed.dart';
part 'extended_pool.g.dart';

@freezed
class ExtendedPool with _$ExtendedPool {
  const factory ExtendedPool({
    required TrainingPool base,
    @Default(false) bool unsavedName,
    @Default(false) bool unsavedPrice,
    @Default(false) bool unsavedSkills,
    double? tokenBalance,
    // TODO: remove this field once we have a proper sol balance
    double? solBalanceOverride,
    String? createdAt,
  }) = _ExtendedPool;

  factory ExtendedPool.fromJson(Map<String, dynamic> json) =>
      _$ExtendedPoolFromJson(json);
}
