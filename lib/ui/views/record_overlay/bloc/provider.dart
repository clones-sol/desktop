import 'dart:async';

import 'package:clones_desktop/ui/views/record_overlay/bloc/state.dart';
import 'package:clones_desktop/ui/views/training_session/bloc/provider.dart';
import 'package:clones_desktop/ui/views/training_session/bloc/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:window_manager/window_manager.dart';

part 'provider.g.dart';

@riverpod
class RecordOverlayNotifier extends _$RecordOverlayNotifier {
  RecordOverlayNotifier();

  @override
  RecordOverlayState build() {
    ref.onDispose(stopTimer);

    ref.listen(trainingSessionNotifierProvider, (previous, next) {
      if (next.recordingState == RecordingState.recording) {
        startTimer();
      } else {
        stopTimer();
      }
    });

    return const RecordOverlayState();
  }

  void startTimer() {
    stopTimer();
    setSeconds(0);
    state = state.copyWith(
      timer: Timer.periodic(const Duration(seconds: 1), (timer) {
        setSeconds(state.seconds + 1);
      }),
    );
  }

  void stopTimer() {
    state.timer?.cancel();
    setTimer(null);
  }

  Future<void> toggleCollapsed() async {
    state = state.copyWith(isCollapsed: !state.isCollapsed);
    if (state.isCollapsed) {
      await windowManager.setSize(kRecordOverlayCollapsedSize);
    } else {
      await windowManager.setSize(kRecordOverlaySize);
    }
  }

  Future<void> toggleLocked() async {
    state = state.copyWith(isLocked: !state.isLocked);
    if (state.isLocked) {
      await windowManager.setResizable(false);
    } else {
      await windowManager.setResizable(true);
    }
  }

  void setFocused(bool focused) {
    state = state.copyWith(focused: focused);
    if (focused) {
      windowManager.setOpacity(1);
    } else {
      windowManager.setOpacity(0.3);
    }
  }

  void setSeconds(int seconds) {
    state = state.copyWith(seconds: seconds);
  }

  void setTimer(Timer? timer) {
    state = state.copyWith(timer: timer);
  }

  void handleStop() {
    stopTimer();
  }
}
