// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessagePartImpl _$$MessagePartImplFromJson(Map<String, dynamic> json) =>
    _$MessagePartImpl(
      quest: json['quest'] == null
          ? null
          : QuestInfo.fromJson(json['quest'] as Map<String, dynamic>),
      actions: (json['actions'] as List<dynamic>?)
          ?.map((e) => MessageAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: $enumDecode(_$MessagePartTypeEnumMap, json['type']),
      content: json['content'],
    );

Map<String, dynamic> _$$MessagePartImplToJson(_$MessagePartImpl instance) =>
    <String, dynamic>{
      'quest': instance.quest,
      'actions': instance.actions,
      'type': _$MessagePartTypeEnumMap[instance.type]!,
      'content': instance.content,
    };

const _$MessagePartTypeEnumMap = {
  MessagePartType.text: 'text',
  MessagePartType.embed: 'embed',
  MessagePartType.quest: 'quest',
  MessagePartType.loading: 'loading',
};
