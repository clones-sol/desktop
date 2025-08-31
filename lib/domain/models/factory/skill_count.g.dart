// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillCountImpl _$$SkillCountImplFromJson(Map<String, dynamic> json) =>
    _$SkillCountImpl(
      skill: json['skill'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$SkillCountImplToJson(_$SkillCountImpl instance) =>
    <String, dynamic>{
      'skill': instance.skill,
      'count': instance.count,
    };
