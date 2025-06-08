import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/submission/grade_result.dart';
import 'package:viralmind_flutter/domain/models/submission/meta.dart';
import 'package:viralmind_flutter/domain/models/submission/submission_file.dart';

part 'pool_submission.freezed.dart';
part 'pool_submission.g.dart';

@freezed
class PoolSubmission with _$PoolSubmission {
  const factory PoolSubmission({
    @JsonKey(name: '_id') required String id,
    required String address,
    required Meta meta,
    required String status,
    required List<SubmissionFile> files,
    GradeResult? gradeResult,
    required double reward,
    required double maxReward,
    required double clampedScore,
    required String createdAt,
    required String updatedAt,
  }) = _PoolSubmission;

  factory PoolSubmission.fromJson(Map<String, dynamic> json) =>
      _$PoolSubmissionFromJson(json);
}
