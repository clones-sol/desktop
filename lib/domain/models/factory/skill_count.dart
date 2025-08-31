// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill_count.freezed.dart';
part 'skill_count.g.dart';

@freezed
class SkillCount with _$SkillCount {
  const factory SkillCount({
    required String skill,
    required int count,
  }) = _SkillCount;

  factory SkillCount.fromJson(Map<String, dynamic> json) =>
      _$SkillCountFromJson(json);
}
