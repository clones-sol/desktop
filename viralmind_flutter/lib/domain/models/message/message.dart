import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String role,
    required String content,
    int? timestamp,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

Message generateAssistantMessage(
  String content, {
  int? timestamp,
  bool audio = true,
  bool delay = true,
}) {
  return Message(
    role: 'assistant',
    content: content,
    timestamp: timestamp,
  );
}

Message generateUserMessage(
  String content, {
  int? timestamp,
}) {
  return Message(
    role: 'user',
    content: content,
    timestamp: timestamp,
  );
}
