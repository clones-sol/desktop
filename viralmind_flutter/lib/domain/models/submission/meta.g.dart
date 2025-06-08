// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      quest: Quest.fromJson(json['quest'] as Map<String, dynamic>),
      poolId: json['poolId'] as String,
      id: json['id'] as String,
      generatedTime: (json['generatedTime'] as num).toInt(),
      extra: json['extra'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'quest': instance.quest,
      'poolId': instance.poolId,
      'id': instance.id,
      'generatedTime': instance.generatedTime,
      'extra': instance.extra,
    };
