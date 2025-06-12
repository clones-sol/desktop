import 'package:freezed_annotation/freezed_annotation.dart';

part 'typing_message.freezed.dart';
part 'typing_message.g.dart';

@freezed
class TypingMessage with _$TypingMessage {
  const factory TypingMessage({
    required String content,
    required String target,
    required int messageIndex,
  }) = _TypingMessage;

  factory TypingMessage.fromJson(Map<String, dynamic> json) =>
      _$TypingMessageFromJson(json);
}
