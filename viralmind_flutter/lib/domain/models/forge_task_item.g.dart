// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forge_task/forge_task_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgeTaskItemImpl _$$ForgeTaskItemImplFromJson(Map<String, dynamic> json) =>
    _$ForgeTaskItemImpl(
      id: json['id'] as String?,
      prompt: json['prompt'] as String,
      uploadLimit: (json['uploadLimit'] as num?)?.toInt(),
      rewardLimit: (json['rewardLimit'] as num?)?.toInt(),
      completed: json['completed'] as bool?,
      recordingId: json['recordingId'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      uploadLimitReached: json['uploadLimitReached'] as bool?,
      currentSubmissions: (json['currentSubmissions'] as num?)?.toInt(),
      limitReason: json['limitReason'] as String?,
    );

Map<String, dynamic> _$$ForgeTaskItemImplToJson(_$ForgeTaskItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prompt': instance.prompt,
      'uploadLimit': instance.uploadLimit,
      'rewardLimit': instance.rewardLimit,
      'completed': instance.completed,
      'recordingId': instance.recordingId,
      'score': instance.score,
      'uploadLimitReached': instance.uploadLimitReached,
      'currentSubmissions': instance.currentSubmissions,
      'limitReason': instance.limitReason,
    };
