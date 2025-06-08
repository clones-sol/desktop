import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/message/message_part.dart';

part 'message.freezed.dart';
part 'message.g.dart';

enum MessageRole { assistant, user, system }


@freezed
class Message with _$Message {
  const factory Message({
    required MessageRole role,
    required List<MessagePart> parts,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
