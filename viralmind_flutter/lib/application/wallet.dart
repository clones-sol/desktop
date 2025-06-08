import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/api/core/client.dart';
import 'package:viralmind_flutter/application/shared_preferences_factory.dart';
import 'package:viralmind_flutter/infrastructure/wallet.repository.dart';

part 'wallet.g.dart';

@riverpod
WalletRepositoryImpl walletRepository(
  Ref ref,
) {
  final apiClient = ref.watch(apiClientProvider);
  final prefsFactory = ref.watch(sharedPreferencesFactoryProvider);
  return WalletRepositoryImpl(apiClient, prefsFactory);
}

@riverpod
Future<String?> walletAddress(Ref ref) async {
  final walletRepository = ref.read(walletRepositoryProvider);
  return walletRepository.getAddress();
}

@riverpod
Future<double> getBalance(Ref ref, {required String address}) async {
  final walletRepository = ref.read(walletRepositoryProvider);
  return walletRepository.getBalance(address: address);
}

@riverpod
Future<({bool connected, String? address})> checkConnection(
  Ref ref,
  String token,
) async {
  final walletRepository = ref.read(walletRepositoryProvider);
  return walletRepository.checkConnection(token);
}

@riverpod
Future<String?> getNickname(Ref ref, {required String address}) async {
  final walletRepository = ref.read(walletRepositoryProvider);
  return walletRepository.getNickname(address: address);
}

@riverpod
Future<void> saveNickname(
  Ref ref, {
  required String address,
  required String nickname,
}) async {
  final walletRepository = ref.read(walletRepositoryProvider);
  return walletRepository.saveNickname(address: address, nickname: nickname);
}

@riverpod
Future<String> setNickname(
  Ref ref, {
  required String address,
  required String nickname,
}) async {
  final walletRepository = ref.read(walletRepositoryProvider);
  return walletRepository.setNickname(address: address, nickname: nickname);
}
