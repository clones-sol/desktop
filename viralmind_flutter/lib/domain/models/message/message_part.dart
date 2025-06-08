import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/message/message_action.dart';
import 'package:viralmind_flutter/domain/models/message/quest_info.dart';

part 'message_part.freezed.dart';
part 'message_part.g.dart';

enum MessagePartType { text, embed, quest, loading }

@freezed
class MessagePart with _$MessagePart {
  const factory MessagePart({
    QuestInfo? quest,
    List<MessageAction>? actions,
    required MessagePartType type,
    required dynamic content,
  }) = _MessagePart;

  factory MessagePart.fromJson(Map<String, dynamic> json) =>
      _$MessagePartFromJson(json);
}
