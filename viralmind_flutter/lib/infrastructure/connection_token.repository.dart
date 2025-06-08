import 'dart:math';

import 'package:viralmind_flutter/domain/local/shared_preferences_factory.dart';
import 'package:viralmind_flutter/utils/env.dart';

class ConnectionTokenRepositoryImpl {
  ConnectionTokenRepositoryImpl(this._prefsFactory);
  static const _storageKey = 'connectionToken';
  final SharedPreferencesFactory _prefsFactory;

  Future<String?> loadToken() async {
    final prefs = await _prefsFactory.create();
    return prefs.getString(_storageKey);
  }

  Future<void> setToken(String? token) async {
    final prefs = await _prefsFactory.create();
    if (token != null) {
      await prefs.setString(_storageKey, token);
    } else {
      await prefs.remove(_storageKey);
    }
  }

  String _generateToken() {
    final random = Random();
    final randomPart = random.nextDouble().toStringAsFixed(16).substring(2);
    final randomBase36 = BigInt.parse(randomPart).toRadixString(36);
    final timestampPart =
        DateTime.now().millisecondsSinceEpoch.toRadixString(36);
    return '$randomBase36$timestampPart';
  }

  Future<String> getConnectionUrl() async {
    var token = await loadToken();
    if (token == null) {
      token = _generateToken();
      await setToken(token);
    }
    return '${Env.apiUrl}/connect?token=$token';
  }
}
