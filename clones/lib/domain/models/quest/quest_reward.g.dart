// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_reward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestRewardImpl _$$QuestRewardImplFromJson(Map<String, dynamic> json) =>
    _$QuestRewardImpl(
      time: (json['time'] as num).toInt(),
      maxReward: (json['max_reward'] as num).toInt(),
    );

Map<String, dynamic> _$$QuestRewardImplToJson(_$QuestRewardImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'max_reward': instance.maxReward,
    };
