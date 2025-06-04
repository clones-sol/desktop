// Wallet endpoints API
//
// Migrated from src/lib/api/endpoints/wallet.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/client.dart';

// Modèle pour la réponse de connexion
class WalletConnectionResult {
  final bool connected;
  final String? address;

  WalletConnectionResult({required this.connected, this.address});

  factory WalletConnectionResult.fromJson(Map<String, dynamic> json) =>
      WalletConnectionResult(
        connected: json['connected'] as bool,
        address: json['address'] as String?,
      );
}

// Vérifie la connexion du wallet
Future<WalletConnectionResult> checkConnection(
  WidgetRef ref,
  String token,
) async {
  final client = ref.read(apiClientProvider);
  return await client.get<WalletConnectionResult>(
    '/wallet/connection',
    params: {'token': token},
    fromJson:
        (json) => WalletConnectionResult.fromJson(json as Map<String, dynamic>),
  );
}

// Récupère le nickname d'une adresse
Future<String> getNickname(WidgetRef ref, String address) async {
  final client = ref.read(apiClientProvider);
  return await client.get<String>(
    '/wallet/nickname',
    params: {'address': address},
  );
}

// Définit le nickname d'une adresse (auth requis)
Future<String> setNickname(
  WidgetRef ref,
  String address,
  String nickname,
) async {
  final client = ref.read(apiClientProvider);
  return await client.put<String>(
    '/wallet/nickname',
    data: {'address': address, 'nickname': nickname},
    options: const RequestOptions(requiresAuth: true),
  );
}
