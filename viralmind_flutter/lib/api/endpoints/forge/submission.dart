// SubmissionStatus and PoolSubmission models for Forge endpoints
//
// Migrated from src/lib/types/forge.ts

import 'package:freezed_annotation/freezed_annotation.dart';

part 'submission.freezed.dart';
part 'submission.g.dart';

@freezed
class PoolSubmission with _$PoolSubmission {
  const factory PoolSubmission({
    required String id,
    required String address,
    required Map<String, dynamic> meta,
    required String status,
    required List<Map<String, dynamic>> files,
    dynamic gradeResult,
    required double reward,
    required double maxReward,
    required double clampedScore,
    required String createdAt,
    required String updatedAt,
  }) = _PoolSubmission;

  factory PoolSubmission.fromJson(Map<String, dynamic> json) =>
      _$PoolSubmissionFromJson(json);
}

@freezed
class SubmissionStatus with _$SubmissionStatus {
  const factory SubmissionStatus({
    required String id,
    required String address,
    required Map<String, dynamic> meta,
    required String status,
    required List<Map<String, dynamic>> files,
    String? error,
    required String createdAt,
    required String updatedAt,
    required double clampedScore,
    dynamic gradeResult,
    required double maxReward,
    required double reward,
    Map<String, dynamic>? treasuryTransfer,
  }) = _SubmissionStatus;

  factory SubmissionStatus.fromJson(Map<String, dynamic> json) =>
      _$SubmissionStatusFromJson(json);
}
