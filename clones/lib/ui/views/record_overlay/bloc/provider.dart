import 'dart:async';
import 'dart:convert';

import 'package:clones/domain/models/quest/quest.dart';
import 'package:clones/ui/views/record_overlay/bloc/state.dart';
import 'package:clones/ui/views/training_session/bloc/state.dart';
import 'package:clones/utils/multi_windows_record.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class RecordOverlayNotifier extends _$RecordOverlayNotifier {
  RecordOverlayNotifier();

  @override
  RecordOverlayState build() {
    ref.onDispose(stopTimer);
    DesktopMultiWindow.setMethodHandler(handleMethodCall);
    return const RecordOverlayState();
  }

  void setDemo(Quest? demo) {
    state = state.copyWith(demo: demo);
  }

  void setRecordingState(RecordingState recordingState) {
    state = state.copyWith(recordingState: recordingState);
  }

  void startTimer() {
    stopTimer();
    setSeconds(0);
    state = state.copyWith(
      timer: Timer.periodic(const Duration(seconds: 1), (timer) {
        debugPrint('timer: ${state.seconds + 1}');
        setSeconds(state.seconds + 1);
      }),
    );
  }

  void stopTimer() {
    state.timer?.cancel();
    setTimer(null);
  }

  void toggleCollapsed() {
    state = state.copyWith(isCollapsed: !state.isCollapsed);
  }

  void toggleLocked() {
    state = state.copyWith(isLocked: !state.isLocked);
  }

  void setFocused(bool focused) {
    state = state.copyWith(focused: focused);
  }

  void resetTimer() {
    state = state.copyWith(seconds: 0);
  }

  void setSeconds(int seconds) {
    state = state.copyWith(seconds: seconds);
  }

  void setTimer(Timer? timer) {
    state = state.copyWith(timer: timer);
  }

  void handleStop() {
    stopTimer();
    MultiWindowsRecord.stopRecording();
  }

  Future<dynamic> handleMethodCall(MethodCall call, int fromWindowId) async {
    if (call.method == MultiWindowsMethod.demoUpdate.name) {
      final demo = call.arguments == null
          ? null
          : Quest.fromJson(jsonDecode(call.arguments as String));
      setDemo(demo);
    } else if (call.method == MultiWindowsMethod.recordingStateUpdate.name) {
      final recordingState =
          RecordingState.values.byName(call.arguments as String);
      setRecordingState(recordingState);
      if (recordingState == RecordingState.recording) {
        startTimer();
      } else {
        stopTimer();
      }
    } else if (call.method == MultiWindowsMethod.recordingComplete.name) {
      stopTimer();
      setRecordingState(RecordingState.off);
    } else if (call.method == 'focus') {
      debugPrint('focus');
      await Future.microtask(() => setFocused(true));
    } else if (call.method == 'blur') {
      debugPrint('blur');
      await Future.microtask(() => setFocused(false));
    }
  }
}
