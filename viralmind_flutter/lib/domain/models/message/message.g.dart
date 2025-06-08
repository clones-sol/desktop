// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      role: $enumDecode(_$MessageRoleEnumMap, json['role']),
      parts: (json['parts'] as List<dynamic>)
          .map((e) => MessagePart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'role': _$MessageRoleEnumMap[instance.role]!,
      'parts': instance.parts,
    };

const _$MessageRoleEnumMap = {
  MessageRole.assistant: 'assistant',
  MessageRole.user: 'user',
  MessageRole.system: 'system',
};
