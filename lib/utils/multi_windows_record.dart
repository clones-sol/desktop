import 'package:desktop_multi_window/desktop_multi_window.dart';

enum MultiWindowsMethod {
  demoUpdate,
  recordingStateUpdate,
  recordingComplete,
  stopRecording,
}

const kMainWindowId = 0;

class MultiWindowsRecord {
  static Future<void> recordingComplete(int? overlayWindowId) async {
    if (overlayWindowId != null) {
      await DesktopMultiWindow.invokeMethod(
        overlayWindowId,
        MultiWindowsMethod.recordingComplete.name,
      );
      final window = WindowController.fromWindowId(overlayWindowId);
      await window.close();
    }
  }

  static Future<void> recordingStateUpdate(
    int? overlayWindowId,
    dynamic arguments,
  ) async {
    if (overlayWindowId != null) {
      await DesktopMultiWindow.invokeMethod(
        overlayWindowId,
        MultiWindowsMethod.recordingStateUpdate.name,
        arguments,
      );
    }
  }

  static Future<void> demoUpdate(
    int? overlayWindowId,
    dynamic arguments,
  ) async {
    if (overlayWindowId != null) {
      await DesktopMultiWindow.invokeMethod(
        overlayWindowId,
        MultiWindowsMethod.demoUpdate.name,
        arguments,
      );
    }
  }

  static Future<void> stopRecording() async {
    await DesktopMultiWindow.invokeMethod(
      kMainWindowId,
      MultiWindowsMethod.stopRecording.name,
    );
  }
}
