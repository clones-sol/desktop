import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_limit.freezed.dart';
part 'upload_limit.g.dart';

enum UploadLimitType {
  @JsonValue('per-task')
  perTask,
  @JsonValue('per-day')
  perDay,
  @JsonValue('total')
  total,
}

@freezed
class UploadLimit with _$UploadLimit {
  const factory UploadLimit({
    required int type,
    required UploadLimitType limitType,
  }) = _UploadLimit;

  factory UploadLimit.fromJson(Map<String, dynamic> json) =>
      _$UploadLimitFromJson(json);
}
