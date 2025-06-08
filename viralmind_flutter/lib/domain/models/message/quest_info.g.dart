// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestInfoImpl _$$QuestInfoImplFromJson(Map<String, dynamic> json) =>
    _$QuestInfoImpl(
      taskId: json['taskId'] as String,
      title: json['title'] as String,
      originalInstruction: json['originalInstruction'] as String,
      concreteScenario: json['concreteScenario'] as String,
      objective: json['objective'] as String,
      relevantApplications: (json['relevantApplications'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      subgoals:
          (json['subgoals'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$QuestInfoImplToJson(_$QuestInfoImpl instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'title': instance.title,
      'originalInstruction': instance.originalInstruction,
      'concreteScenario': instance.concreteScenario,
      'objective': instance.objective,
      'relevantApplications': instance.relevantApplications,
      'subgoals': instance.subgoals,
    };
