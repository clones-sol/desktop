// Tools initialization state utilities for Flutter
//
// Migrated from src/lib/utils/tools.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToolsInitState {
  final bool initializing;
  final int progress;

  ToolsInitState({required this.initializing, required this.progress});

  ToolsInitState copyWith({bool? initializing, int? progress}) {
    return ToolsInitState(
      initializing: initializing ?? this.initializing,
      progress: progress ?? this.progress,
    );
  }
}

// Riverpod provider for tools initialization state
final toolsInitStateProvider = StateProvider<ToolsInitState>(
  (ref) => ToolsInitState(initializing: false, progress: 5),
);
