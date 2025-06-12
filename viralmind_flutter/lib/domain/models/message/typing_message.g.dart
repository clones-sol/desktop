// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typing_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TypingMessageImpl _$$TypingMessageImplFromJson(Map<String, dynamic> json) =>
    _$TypingMessageImpl(
      content: json['content'] as String,
      target: json['target'] as String,
      messageIndex: (json['messageIndex'] as num).toInt(),
    );

Map<String, dynamic> _$$TypingMessageImplToJson(_$TypingMessageImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'target': instance.target,
      'messageIndex': instance.messageIndex,
    };
