import 'package:clones/application/tools_init/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToolsInitStateNotifier extends StateNotifier<ToolsInitState> {
  ToolsInitStateNotifier()
      : super(const ToolsInitState(initializing: false, progress: 0));

  void startInitialization() {
    state = state.copyWith(initializing: true, progress: 0);
  }

  void updateProgress(double progress) {
    state = state.copyWith(progress: progress);
  }

  void completeInitialization() {
    state = state.copyWith(initializing: false, progress: 1);
  }

  void reset() {
    state = const ToolsInitState(initializing: false, progress: 0);
  }
}

final toolsInitProvider =
    StateNotifierProvider<ToolsInitStateNotifier, ToolsInitState>(
  (ref) => ToolsInitStateNotifier(),
);
