import 'dart:convert';
import 'package:clones/domain/local/shared_preferences_factory.dart';

class BlacklistRepositoryImpl {
  BlacklistRepositoryImpl(this._prefsFactory);
  static const _storageKey = 'appBlacklist';

  final SharedPreferencesFactory _prefsFactory;

  Future<List<String>> getBlacklist() async {
    try {
      final prefs = await _prefsFactory.create();
      final jsonString = prefs.getString(_storageKey);
      if (jsonString != null) {
        final decoded = jsonDecode(jsonString);
        return (decoded as List).cast<String>();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to load blacklist: $e');
    }
  }

  Future<void> addApp(String appName) async {
    final prefs = await _prefsFactory.create();
    final list = await getBlacklist();
    if (!list.contains(appName)) {
      list.add(appName);
      await prefs.setString(_storageKey, jsonEncode(list));
    }
  }

  Future<void> removeApp(String appName) async {
    final prefs = await _prefsFactory.create();
    final list = await getBlacklist();
    if (list.contains(appName)) {
      list.remove(appName);
      await prefs.setString(_storageKey, jsonEncode(list));
    }
  }

  Future<void> setBlacklist(List<String> apps) async {
    final prefs = await _prefsFactory.create();
    await prefs.setString(_storageKey, jsonEncode(apps));
  }
}
