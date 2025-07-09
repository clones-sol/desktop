import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A provider that holds the current route path.
final currentRouteProvider = StateProvider<String>((ref) {
  // The initial value doesn't matter much as it will be updated by the router listener.
  return '';
});
