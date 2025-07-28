import 'dart:convert';

import 'package:clones_desktop/domain/models/factory_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  SettingsRepository(this._prefs);
  final SharedPreferences _prefs;

  static const String _factorySettingsKey = 'factorySettings';

  Future<FactorySettings> getFactorySettings() async {
    final jsonString = _prefs.getString(_factorySettingsKey);
    if (jsonString != null) {
      return FactorySettings.fromJson(jsonDecode(jsonString));
    }
    return const FactorySettings(); // Return default settings if none are stored
  }

  Future<void> saveFactorySettings(FactorySettings settings) async {
    final jsonString = jsonEncode(settings.toJson());
    await _prefs.setString(_factorySettingsKey, jsonString);
  }
}
