// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmissionStatusImpl _$$SubmissionStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmissionStatusImpl(
      id: json['_id'] as String,
      address: json['address'] as String,
      meta: SubmissionMeta.fromJson(json['meta'] as Map<String, dynamic>),
      status: json['status'] as String,
      files: (json['files'] as List<dynamic>)
          .map((e) => SubmissionFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      clampedScore: (json['clampedScore'] as num).toInt(),
      gradeResult:
          GradeResult.fromJson(json['grade_result'] as Map<String, dynamic>),
      maxReward: (json['maxReward'] as num).toInt(),
      reward: (json['reward'] as num).toInt(),
      treasuryTransfer: json['treasuryTransfer'] == null
          ? null
          : TreasuryTransfer.fromJson(
              json['treasuryTransfer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SubmissionStatusImplToJson(
        _$SubmissionStatusImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'address': instance.address,
      'meta': instance.meta,
      'status': instance.status,
      'files': instance.files,
      'error': instance.error,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'clampedScore': instance.clampedScore,
      'grade_result': instance.gradeResult,
      'maxReward': instance.maxReward,
      'reward': instance.reward,
      'treasuryTransfer': instance.treasuryTransfer,
    };
