import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFactory {
  Future<SharedPreferences> create() async {
    return SharedPreferences.getInstance();
  }
}
