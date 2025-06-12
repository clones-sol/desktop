import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/infrastructure/tauri_api_client.dart';

///
/// Provider for the Tauri API client.
///
final tauriApiClientProvider = Provider<TauriApiClient>((ref) {
  return TauriApiClient();
});
