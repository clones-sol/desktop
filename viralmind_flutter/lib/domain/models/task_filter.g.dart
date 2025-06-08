// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskFilterImpl _$$TaskFilterImplFromJson(Map<String, dynamic> json) =>
    _$TaskFilterImpl(
      poolId: json['poolId'] as String?,
      minReward: (json['minReward'] as num?)?.toInt(),
      maxReward: (json['maxReward'] as num?)?.toInt(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      query: json['query'] as String?,
      hideAdult: json['hideAdult'] as bool? ?? true,
    );

Map<String, dynamic> _$$TaskFilterImplToJson(_$TaskFilterImpl instance) =>
    <String, dynamic>{
      'poolId': instance.poolId,
      'minReward': instance.minReward,
      'maxReward': instance.maxReward,
      'categories': instance.categories,
      'query': instance.query,
      'hideAdult': instance.hideAdult,
    };
