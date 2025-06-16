// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forge_task_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgeTaskItemImpl _$$ForgeTaskItemImplFromJson(Map<String, dynamic> json) =>
    _$ForgeTaskItemImpl(
      id: json['_id'] as String?,
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
      if (instance.id case final value?) '_id': value,
      'prompt': instance.prompt,
      if (instance.uploadLimit case final value?) 'uploadLimit': value,
      if (instance.rewardLimit case final value?) 'rewardLimit': value,
      if (instance.completed case final value?) 'completed': value,
      if (instance.recordingId case final value?) 'recordingId': value,
      if (instance.score case final value?) 'score': value,
      if (instance.uploadLimitReached case final value?)
        'uploadLimitReached': value,
      if (instance.currentSubmissions case final value?)
        'currentSubmissions': value,
      if (instance.limitReason case final value?) 'limitReason': value,
    };
