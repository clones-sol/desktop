// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forge_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgeTaskImpl _$$ForgeTaskImplFromJson(Map<String, dynamic> json) =>
    _$ForgeTaskImpl(
      id: json['id'] as String,
      prompt: json['prompt'] as String,
      uploadLimit: (json['uploadLimit'] as num).toInt(),
      rewardLimit: (json['rewardLimit'] as num).toInt(),
      uploadLimitReached: json['uploadLimitReached'] as bool,
      currentSubmissions: (json['currentSubmissions'] as num).toInt(),
      limitReason: json['limitReason'] as String,
      app: ForgeApp.fromJson(json['app'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ForgeTaskImplToJson(_$ForgeTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prompt': instance.prompt,
      'uploadLimit': instance.uploadLimit,
      'rewardLimit': instance.rewardLimit,
      'uploadLimitReached': instance.uploadLimitReached,
      'currentSubmissions': instance.currentSubmissions,
      'limitReason': instance.limitReason,
      'app': instance.app,
    };
