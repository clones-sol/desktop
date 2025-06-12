import 'package:freezed_annotation/freezed_annotation.dart';

part 'sft_message.freezed.dart';
part 'sft_message.g.dart';

@freezed
class SftMessage with _$SftMessage {
  const factory SftMessage({
    required String role,
    required dynamic content,
    required int timestamp,
  }) = _SftMessage;

  factory SftMessage.fromJson(Map<String, dynamic> json) =>
      _$SftMessageFromJson(json);
}
