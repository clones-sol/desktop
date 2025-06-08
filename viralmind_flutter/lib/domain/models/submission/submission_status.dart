// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/submission/grade_result.dart';
import 'package:viralmind_flutter/domain/models/submission/submission_file.dart';
import 'package:viralmind_flutter/domain/models/submission/submission_meta.dart';
import 'package:viralmind_flutter/domain/models/submission/treasury_transfer.dart';

part 'submission_status.freezed.dart';
part 'submission_status.g.dart';

@freezed
class SubmissionStatus with _$SubmissionStatus {
  const factory SubmissionStatus({
    @JsonKey(name: '_id') required String id,
    required String address,
    required SubmissionMeta meta,
    required String status,
    required List<SubmissionFile> files,
    String? error,
    required String createdAt,
    required String updatedAt,
    required int clampedScore,
    @JsonKey(name: 'grade_result') required GradeResult gradeResult,
    required int maxReward,
    required int reward,
    TreasuryTransfer? treasuryTransfer,
  }) = _SubmissionStatus;

  factory SubmissionStatus.fromJson(Map<String, dynamic> json) =>
      _$SubmissionStatusFromJson(json);
}
