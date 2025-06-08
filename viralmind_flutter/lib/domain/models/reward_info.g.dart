// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest/reward_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RewardInfoImpl _$$RewardInfoImplFromJson(Map<String, dynamic> json) =>
    _$RewardInfoImpl(
      time: (json['time'] as num).toInt(),
      maxReward: (json['maxReward'] as num).toInt(),
    );

Map<String, dynamic> _$$RewardInfoImplToJson(_$RewardInfoImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'maxReward': instance.maxReward,
    };
