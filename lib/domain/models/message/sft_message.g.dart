// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sft_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SftMessageImpl _$$SftMessageImplFromJson(Map<String, dynamic> json) =>
    _$SftMessageImpl(
      role: json['role'] as String,
      content: json['content'],
      timestamp: (json['timestamp'] as num).toInt(),
      masked: json['masked'] as bool? ?? false,
    );

Map<String, dynamic> _$$SftMessageImplToJson(_$SftMessageImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
      'timestamp': instance.timestamp,
      'masked': instance.masked,
    };
