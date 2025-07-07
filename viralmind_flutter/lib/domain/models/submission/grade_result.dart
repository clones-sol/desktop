// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/utils/format_string.dart';

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

extension GradeResultExtension on GradeResult {
  static final regexGradeResult = RegExp(r'^\((.*?)\)\s*(.*)$');
  String get reasoningSystem =>
      regexGradeResult
          .firstMatch(reasoning)
          ?.group(1)
          ?.replaceAll('system:', '')
          .trim()
          .capitalize() ??
      '';

  String get reasoningForUser =>
      regexGradeResult.firstMatch(reasoning)?.group(2)?.trim() ?? '';
}
