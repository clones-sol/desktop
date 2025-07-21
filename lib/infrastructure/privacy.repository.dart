import 'package:clones_desktop/domain/local/shared_preferences_factory.dart';

class PrivacyRepositoryImpl {
  PrivacyRepositoryImpl(this._prefsFactory);
  static const _storageKey = 'privacyAccepted';
  final SharedPreferencesFactory _prefsFactory;

  Future<bool> isPrivacyAccepted() async {
    final prefs = await _prefsFactory.create();
    return prefs.getBool(_storageKey) ?? false;
  }

  Future<void> setPrivacyAccepted(bool value) async {
    final prefs = await _prefsFactory.create();
    await prefs.setBool(_storageKey, value);
  }
}
