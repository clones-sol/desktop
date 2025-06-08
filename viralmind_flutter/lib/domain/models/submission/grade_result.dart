// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'grade_result.freezed.dart';
part 'grade_result.g.dart';

@freezed
class GradeResult with _$GradeResult {
  const factory GradeResult({
    required String summary,
    required int score,
    required String reasoning,
    @JsonKey(name: '_id') required String id,
  }) = _GradeResult;

  factory GradeResult.fromJson(Map<String, dynamic> json) =>
      _$GradeResultFromJson(json);
}
