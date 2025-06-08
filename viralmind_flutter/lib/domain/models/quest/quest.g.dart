// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestImpl _$$QuestImplFromJson(Map<String, dynamic> json) => _$QuestImpl(
      title: json['title'] as String,
      app: json['app'] as String,
      iconUrl: json['iconUrl'] as String,
      objectives: (json['objectives'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      content: json['content'] as String,
      poolId: json['poolId'] as String?,
      reward: json['reward'] == null
          ? null
          : RewardInfo.fromJson(json['reward'] as Map<String, dynamic>),
      taskId: json['taskId'] as String?,
    );

Map<String, dynamic> _$$QuestImplToJson(_$QuestImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'app': instance.app,
      'iconUrl': instance.iconUrl,
      'objectives': instance.objectives,
      'content': instance.content,
      'poolId': instance.poolId,
      'reward': instance.reward,
      'taskId': instance.taskId,
    };
