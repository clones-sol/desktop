// Platform compatibility layer
import 'package:flutter/foundation.dart';

// Conditional imports based on platform
import 'platform_web.dart' if (dart.library.io) 'platform_desktop.dart';

// Re-export platform-specific implementations
export 'platform_web.dart' if (dart.library.io) 'platform_desktop.dart';

class PlatformManager {
  static bool get isWeb => kIsWeb;
  static bool get isDesktop => !kIsWeb;
}
