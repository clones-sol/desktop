// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_generate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GymGenerateResponseImpl _$$GymGenerateResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GymGenerateResponseImpl(
      content: GymGenerateResponseContent.fromJson(
          json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GymGenerateResponseImplToJson(
        _$GymGenerateResponseImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

_$GymGenerateResponseContentImpl _$$GymGenerateResponseContentImplFromJson(
        Map<String, dynamic> json) =>
    _$GymGenerateResponseContentImpl(
      name: json['name'] as String,
      apps: (json['apps'] as List<dynamic>)
          .map((e) => ForgeApp.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GymGenerateResponseContentImplToJson(
        _$GymGenerateResponseContentImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'apps': instance.apps,
    };
