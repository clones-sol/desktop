// Authentication utilities for API requests
//
// This file provides authentication helpers for API requests,
// similar to src/lib/api/core/auth.ts in the Svelte project.

import 'package:flutter_riverpod/flutter_riverpod.dart';

// Placeholder providers for connection token and wallet address.
// TODO: Connect these to the real state management logic.
final connectionTokenProvider = StateProvider<String>((ref) => '');
final walletAddressProvider = StateProvider<String?>((ref) => null);

/// Gets the current authentication token
String getAuthToken(Ref ref) {
  return ref.read(connectionTokenProvider);
}

/// Gets the current wallet address
String? getCurrentWalletAddress(WidgetRef ref) {
  return ref.read(walletAddressProvider);
}

/// Checks if the user is authenticated
bool isAuthenticated(Ref ref) {
  return getAuthToken(ref).isNotEmpty;
}

/// Creates authentication headers for API requests
Map<String, String> getAuthHeaders(Ref ref) {
  final token = getAuthToken(ref);
  return token.isNotEmpty ? {'x-connect-token': token} : {};
}
