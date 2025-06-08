import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/application/shared_preferences_factory.dart';
import 'package:viralmind_flutter/application/wallet.dart';
import 'package:viralmind_flutter/infrastructure/connection_token.repository.dart';

part 'connection_token.g.dart';

@riverpod
ConnectionTokenRepositoryImpl connectionTokenRepository(
  Ref ref,
) {
  final sharedPreferencesFactory = ref.watch(sharedPreferencesFactoryProvider);
  return ConnectionTokenRepositoryImpl(sharedPreferencesFactory);
}

@riverpod
class ConnectionTokenNotifier extends _$ConnectionTokenNotifier {
  Timer? _pollingTimer;
  Timer? _connectingTimer;
  bool isConnecting = false;

  @override
  String? build() {
    ref.onDispose(() {
      _pollingTimer?.cancel();
      _connectingTimer?.cancel();
    });

    _loadToken();
    return null;
  }

  Future<void> _loadToken() async {
    final connectionTokenRepository =
        ref.read(connectionTokenRepositoryProvider);
    final token = await connectionTokenRepository.loadToken();
    state = token;
  }

  Future<void> startPolling() async {
    final token = state;
    if (token == null) return;

    _pollingTimer?.cancel();

    isConnecting = true;
    ref.notifyListeners();

    _connectingTimer = Timer(const Duration(seconds: 5), () {
      isConnecting = false;
      ref.notifyListeners();
    });

    _pollingTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      try {
        final checkConnectionResult =
            await ref.read(checkConnectionProvider(token).future);
        if (checkConnectionResult.connected) {
          _pollingTimer?.cancel();
          _pollingTimer = null;
          if (checkConnectionResult.address != null) {
            await ref
                .read(walletRepositoryProvider)
                .setAddress(checkConnectionResult.address);
          }
          ref.invalidate(walletAddressProvider);
        }
      } catch (e) {
        debugPrint('Failed to check connection: $e');
      }
    });
  }

  void stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
    _connectingTimer?.cancel();
    _connectingTimer = null;
  }

  Future<void> disconnectWallet() async {
    await ref.read(walletRepositoryProvider).setAddress(null);
    await ref.read(connectionTokenRepositoryProvider).setToken(null);
    state = null;
    ref.invalidate(walletAddressProvider);
  }
}
