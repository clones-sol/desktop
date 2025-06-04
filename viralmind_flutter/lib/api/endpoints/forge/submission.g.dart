// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoolSubmissionImpl _$$PoolSubmissionImplFromJson(Map<String, dynamic> json) =>
    _$PoolSubmissionImpl(
      id: json['id'] as String,
      address: json['address'] as String,
      meta: json['meta'] as Map<String, dynamic>,
      status: json['status'] as String,
      files:
          (json['files'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
      gradeResult: json['gradeResult'],
      reward: (json['reward'] as num).toDouble(),
      maxReward: (json['maxReward'] as num).toDouble(),
      clampedScore: (json['clampedScore'] as num).toDouble(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$PoolSubmissionImplToJson(
  _$PoolSubmissionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'address': instance.address,
  'meta': instance.meta,
  'status': instance.status,
  'files': instance.files,
  'gradeResult': instance.gradeResult,
  'reward': instance.reward,
  'maxReward': instance.maxReward,
  'clampedScore': instance.clampedScore,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

_$SubmissionStatusImpl _$$SubmissionStatusImplFromJson(
  Map<String, dynamic> json,
) => _$SubmissionStatusImpl(
  id: json['id'] as String,
  address: json['address'] as String,
  meta: json['meta'] as Map<String, dynamic>,
  status: json['status'] as String,
  files:
      (json['files'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
  error: json['error'] as String?,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  clampedScore: (json['clampedScore'] as num).toDouble(),
  gradeResult: json['gradeResult'],
  maxReward: (json['maxReward'] as num).toDouble(),
  reward: (json['reward'] as num).toDouble(),
  treasuryTransfer: json['treasuryTransfer'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$SubmissionStatusImplToJson(
  _$SubmissionStatusImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'address': instance.address,
  'meta': instance.meta,
  'status': instance.status,
  'files': instance.files,
  'error': instance.error,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'clampedScore': instance.clampedScore,
  'gradeResult': instance.gradeResult,
  'maxReward': instance.maxReward,
  'reward': instance.reward,
  'treasuryTransfer': instance.treasuryTransfer,
};
