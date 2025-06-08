import 'package:viralmind_flutter/api/core/client.dart';
import 'package:viralmind_flutter/domain/local/shared_preferences_factory.dart';
import 'package:viralmind_flutter/domain/models/api/request_options.dart';

class WalletRepositoryImpl {
  WalletRepositoryImpl(this._client, this._prefsFactory);
  final ApiClient _client;

  static const _storageKey = 'walletAddress';
  final SharedPreferencesFactory _prefsFactory;

  Future<String?> getAddress() async {
    final prefs = await _prefsFactory.create();
    return prefs.getString(_storageKey);
  }

  Future<void> setAddress(String? address) async {
    final prefs = await _prefsFactory.create();
    if (address != null) {
      await prefs.setString(_storageKey, address);
    } else {
      await prefs.remove(_storageKey);
    }
  }

  Future<double> getBalance({
    required String address,
  }) async {
    try {
      final data = await _client.get<Map<String, dynamic>>(
        '/wallet/balance/$address',
        options: const RequestOptions(requiresAuth: true),
      );
      return data['balance']?.toDouble() ?? 0;
    } catch (e) {
      throw Exception('Failed to get balance: $e');
    }
  }

  Future<({bool connected, String? address})> checkConnection(
    String token,
  ) async {
    try {
      final data = await _client.get<Map<String, dynamic>>(
        '/wallet/connection',
        params: {'token': token},
      );
      return (
        connected: data['connected'] as bool,
        address: data['address'] as String?,
      );
    } catch (e) {
      throw Exception('Failed to check connection: $e');
    }
  }

  Future<String?> getNickname({required String address}) async {
    try {
      return await _client.get<String>(
        '/wallet/nickname',
        params: {'address': address},
      );
    } catch (e) {
      throw Exception('Failed to get nickname: $e');
    }
  }

  // TODO: Check if this is needed
  Future<void> saveNickname({
    required String address,
    required String nickname,
  }) async {
    try {
      await _client.post(
        '/gym/leaderboards/nickname',
        data: {'address': address, 'nickname': nickname},
        options: const RequestOptions(requiresAuth: true),
      );
    } catch (e) {
      throw Exception('Failed to save nickname: $e');
    }
  }

  Future<String> setNickname({
    required String address,
    required String nickname,
  }) async {
    try {
      return await _client.put<String>(
        '/wallet/nickname',
        data: {'address': address, 'nickname': nickname},
        options: const RequestOptions(requiresAuth: true),
      );
    } catch (e) {
      throw Exception('Failed to set nickname: $e');
    }
  }
}
