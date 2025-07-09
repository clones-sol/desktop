import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
class ToolsInitState with _$ToolsInitState {
  const factory ToolsInitState({
    required bool initializing,
    required double progress,
  }) = _ToolsInitState;

  factory ToolsInitState.fromJson(Map<String, dynamic> json) =>
      _$ToolsInitStateFromJson(json);
}
