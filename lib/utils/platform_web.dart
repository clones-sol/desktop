// Platform-specific implementations for web
import 'dart:html' as html;

class WindowManagerWeb {
  static Future<void> ensureInitialized() async {
    // No-op for web
  }

  static Future<void> waitUntilReadyToShow() async {
    // No-op for web
  }

  static Future<void> setTitle(String title) async {
    html.document.title = title;
  }

  static Future<void> setSize(Size size) async {
    // No-op for web - browser controls window size
  }

  static Future<void> setMinimumSize(Size size) async {
    // No-op for web
  }

  static Future<void> center() async {
    // No-op for web
  }

  static Future<void> show() async {
    // No-op for web
  }

  static Future<void> setSkipTaskbar(bool skip) async {
    // No-op for web
  }

  static Future<void> setAlwaysOnTop(bool alwaysOnTop) async {
    // No-op for web
  }
}

class ScreenRetrieverWeb {
  static Future<List<Display>> getAllDisplays() async {
    // Return a default display for web
    return [
      Display(
        id: 0,
        name: 'Web Display',
        size: Size(
          html.window.screen!.width!.toDouble(),
          html.window.screen!.height!.toDouble(),
        ),
        workArea: Rect.fromLTWH(
          0,
          0,
          html.window.screen!.width!.toDouble(),
          html.window.screen!.height!.toDouble(),
        ),
        scaleFactor: html.window.devicePixelRatio.toDouble(),
        rotation: 0,
      ),
    ];
  }

  static Future<Display> getPrimaryDisplay() async {
    final displays = await getAllDisplays();
    return displays.first;
  }
}

class PathProviderWeb {
  static Future<String> getApplicationDocumentsDirectory() async {
    // For web, we can't access file system directly
    // Return a placeholder or use IndexedDB/localStorage
    return '/web-documents';
  }

  static Future<String> getTemporaryDirectory() async {
    return '/web-temp';
  }
}

// Mock classes for web compatibility
class Size {
  const Size(this.width, this.height);
  final double width;
  final double height;
}

class Rect {
  const Rect.fromLTWH(this.left, this.top, this.width, this.height);
  final double left;
  final double top;
  final double width;
  final double height;
}

class Display {
  const Display({
    required this.id,
    required this.name,
    required this.size,
    required this.workArea,
    required this.scaleFactor,
    required this.rotation,
  });
  final int id;
  final String name;
  final Size size;
  final Rect workArea;
  final double scaleFactor;
  final int rotation;
}
