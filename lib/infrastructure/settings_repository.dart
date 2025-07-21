import 'dart:convert';

import 'package:clones_desktop/domain/models/gym_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  SettingsRepository(this._prefs);
  final SharedPreferences _prefs;

  static const String _gymSettingsKey = 'gymSettings';

  Future<GymSettings> getGymSettings() async {
    final jsonString = _prefs.getString(_gymSettingsKey);
    if (jsonString != null) {
      return GymSettings.fromJson(jsonDecode(jsonString));
    }
    return const GymSettings(); // Return default settings if none are stored
  }

  Future<void> saveGymSettings(GymSettings settings) async {
    final jsonString = jsonEncode(settings.toJson());
    await _prefs.setString(_gymSettingsKey, jsonString);
  }
}
