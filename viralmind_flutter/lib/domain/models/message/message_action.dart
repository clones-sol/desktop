import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_action.freezed.dart';
part 'message_action.g.dart';

@freezed
class MessageAction with _$MessageAction {
  const factory MessageAction({
    required String type, // e.g. primary, warning, destroy, component
    required String text,
    Map<String, dynamic>? props,
  }) = _MessageAction;

  factory MessageAction.fromJson(Map<String, dynamic> json) =>
      _$MessageActionFromJson(json);
}
