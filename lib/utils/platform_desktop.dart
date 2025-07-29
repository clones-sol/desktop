// Platform-specific implementations for desktop
import 'dart:ui' show Size;

import 'package:screen_retriever/screen_retriever.dart' as sr;
import 'package:window_manager/window_manager.dart' as wm;

export 'package:screen_retriever/screen_retriever.dart';
export 'package:window_manager/window_manager.dart';

class WindowManagerWeb {
  static Future<void> ensureInitialized() =>
      wm.windowManager.ensureInitialized();
  static Future<void> waitUntilReadyToShow() =>
      wm.windowManager.waitUntilReadyToShow();
  static Future<void> setTitle(String title) =>
      wm.windowManager.setTitle(title);
  static Future<void> setSize(Size size) => wm.windowManager.setSize(size);
  static Future<void> setMinimumSize(Size size) =>
      wm.windowManager.setMinimumSize(size);
  static Future<void> center() => wm.windowManager.center();
  static Future<void> show() => wm.windowManager.show();
  static Future<void> setSkipTaskbar(bool skip) =>
      wm.windowManager.setSkipTaskbar(skip);
  static Future<void> setAlwaysOnTop(bool alwaysOnTop) =>
      wm.windowManager.setAlwaysOnTop(alwaysOnTop);
}

class ScreenRetrieverWeb {
  static Future<List<sr.Display>> getAllDisplays() =>
      sr.screenRetriever.getAllDisplays();
  static Future<sr.Display> getPrimaryDisplay() =>
      sr.screenRetriever.getPrimaryDisplay();
}
