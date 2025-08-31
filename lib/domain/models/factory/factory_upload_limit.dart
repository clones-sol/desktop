// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'factory_upload_limit.freezed.dart';
part 'factory_upload_limit.g.dart';

/// Factory upload limit type
enum UploadLimitType {
  @JsonValue('per-task')
  perTask,
  @JsonValue('per-day')
  perDay,
  @JsonValue('total')
  total,
}

/// Factory upload limit configuration
@freezed
class FactoryUploadLimit with _$FactoryUploadLimit {
  const factory FactoryUploadLimit({
    required int value,
    required UploadLimitType type,
  }) = _FactoryUploadLimit;

  factory FactoryUploadLimit.fromJson(Map<String, dynamic> json) =>
      _$FactoryUploadLimitFromJson(json);
}
