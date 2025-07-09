import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToolsInitState {
  ToolsInitState({this.initializing = true, this.progress = 0.0});
  final bool initializing;
  final double progress;

  ToolsInitState copyWith({bool? initializing, double? progress}) {
    return ToolsInitState(
      initializing: initializing ?? this.initializing,
      progress: progress ?? this.progress,
    );
  }
}

class ToolsInitNotifier extends StateNotifier<ToolsInitState> {
  ToolsInitNotifier() : super(ToolsInitState());

  void setInitializing(bool value) {
    state = state.copyWith(initializing: value);
  }

  void setProgress(double value) {
    state = state.copyWith(progress: value);
  }
}

final toolsInitProvider =
    StateNotifierProvider<ToolsInitNotifier, ToolsInitState>((ref) {
  return ToolsInitNotifier();
});
