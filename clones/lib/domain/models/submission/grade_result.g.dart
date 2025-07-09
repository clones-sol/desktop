// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GradeResultImpl _$$GradeResultImplFromJson(Map<String, dynamic> json) =>
    _$GradeResultImpl(
      summary: json['summary'] as String,
      score: (json['score'] as num).toInt(),
      reasoning: json['reasoning'] as String,
      scratchpad: json['scratchpad'] as String?,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$GradeResultImplToJson(_$GradeResultImpl instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'score': instance.score,
      'reasoning': instance.reasoning,
      'scratchpad': instance.scratchpad,
      '_id': instance.id,
    };
