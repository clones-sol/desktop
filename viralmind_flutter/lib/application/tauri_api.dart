import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/infrastructure/tauri_api_client.dart';

part 'tauri_api.g.dart';

///
/// Provider for the Tauri API client.
///

@riverpod
TauriApiClient tauriApiClient(Ref ref) {
  return TauriApiClient();
}
