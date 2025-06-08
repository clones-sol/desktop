// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pool_submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoolSubmissionImpl _$$PoolSubmissionImplFromJson(Map<String, dynamic> json) =>
    _$PoolSubmissionImpl(
      id: json['_id'] as String,
      address: json['address'] as String,
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      status: json['status'] as String,
      files: (json['files'] as List<dynamic>)
          .map((e) => SubmissionFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      gradeResult: json['gradeResult'] == null
          ? null
          : GradeResult.fromJson(json['gradeResult'] as Map<String, dynamic>),
      reward: (json['reward'] as num).toDouble(),
      maxReward: (json['maxReward'] as num).toDouble(),
      clampedScore: (json['clampedScore'] as num).toDouble(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$PoolSubmissionImplToJson(
        _$PoolSubmissionImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
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
