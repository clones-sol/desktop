// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageActionImpl _$$MessageActionImplFromJson(Map<String, dynamic> json) =>
    _$MessageActionImpl(
      type: json['type'] as String,
      text: json['text'] as String,
      props: json['props'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MessageActionImplToJson(_$MessageActionImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'props': instance.props,
    };
