import 'dart:async';

import 'package:clones_desktop/domain/models/quest/quest.dart';
import 'package:clones_desktop/ui/views/training_session/bloc/state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class RecordOverlayState with _$RecordOverlayState {
  const factory RecordOverlayState({
    Quest? demo,
    @Default(RecordingState.off) RecordingState recordingState,
    @Default(null) Timer? timer,
    @Default(0) int seconds,
    @Default(false) bool isLocked,
    @Default(false) bool isCollapsed,
    @Default(true) bool focused,
  }) = _RecordOverlayState;
  const RecordOverlayState._();
}
