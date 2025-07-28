// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'factory_generate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FactoryGenerateResponseImpl _$$FactoryGenerateResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FactoryGenerateResponseImpl(
      content: FactoryGenerateResponseContent.fromJson(
          json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FactoryGenerateResponseImplToJson(
        _$FactoryGenerateResponseImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

_$FactoryGenerateResponseContentImpl
    _$$FactoryGenerateResponseContentImplFromJson(Map<String, dynamic> json) =>
        _$FactoryGenerateResponseContentImpl(
          name: json['name'] as String,
          apps: (json['apps'] as List<dynamic>)
              .map((e) => ForgeApp.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$FactoryGenerateResponseContentImplToJson(
        _$FactoryGenerateResponseContentImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'apps': instance.apps,
    };
