/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';
import 'dart:math';

import 'package:clones/application/session/state.dart';
import 'package:clones/infrastructure/wallet.repository.dart';
import 'package:clones/utils/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class SessionNotifier extends _$SessionNotifier {
  SessionNotifier();

  Timer? _pollingTimer;
  Timer? _connectingTimer;

  @override
  Session build() {
    ref.onDispose(() {
      _pollingTimer?.cancel();
      _connectingTimer?.cancel();
    });

    return const Session();
  }

  Future<void> cancelConnection() async {
    state = state.copyWith(
      connectionToken: null,
      address: null,
      balance: null,
    );
  }

  Future<void> startPolling() async {
    final token = state.connectionToken;
    if (token == null) {
      state = state.copyWith(
        address: null,
        balance: null,
      );
      return;
    }

    _pollingTimer?.cancel();

    ref.notifyListeners();

    _connectingTimer = Timer(const Duration(seconds: 5), () {
      ref.notifyListeners();
    });

    _pollingTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      try {
        final checkConnectionResult =
            await ref.read(checkWalletConnectionProvider(token).future);
        if (checkConnectionResult.connected) {
          _pollingTimer?.cancel();
          _pollingTimer = null;
          if (checkConnectionResult.address != null) {
            state = state.copyWith(
              address: checkConnectionResult.address,
            );
            await setBalance();
          }
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

  Future<void> setBalance() async {
    if (state.address == null) {
      state = state.copyWith(balance: null);
      return;
    }
    final walletRepository = ref.read(walletRepositoryProvider);
    final balance = await walletRepository.getBalance(address: state.address!);
    state = state.copyWith(balance: balance);
  }

  Future<void> getConnectionUrl() async {
    String _generateToken() {
      final random = Random();
      final randomPart = random.nextDouble().toStringAsFixed(16).substring(2);
      final randomBase36 = BigInt.parse(randomPart).toRadixString(36);
      final timestampPart =
          DateTime.now().millisecondsSinceEpoch.toRadixString(36);
      return '$randomBase36$timestampPart';
    }

    final token = _generateToken();
    state = state.copyWith(connectionToken: token);
  }
}

@riverpod
Future<({bool connected, String? address})> checkWalletConnection(
  Ref ref,
  String token,
) async {
  final walletRepository = ref.read(walletRepositoryProvider);
  return walletRepository.checkConnection(token);
}

@riverpod
WalletRepositoryImpl walletRepository(
  Ref ref,
) {
  final apiClient = ref.watch(apiClientProvider);
  return WalletRepositoryImpl(apiClient);
}
