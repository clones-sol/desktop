import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/application/shared_preferences_factory.dart';
import 'package:viralmind_flutter/domain/models/gym_settings.dart';
import 'package:viralmind_flutter/infrastructure/settings_repository.dart';

part 'settings.g.dart';

// TODO(reddwarf03): To test
@Riverpod(keepAlive: true)
Future<SettingsRepository> settingsRepository(Ref ref) async {
  final prefs = await ref.watch(sharedPreferencesFactoryProvider).create();
  return SettingsRepository(prefs);
}

@riverpod
class GymSettingsNotifier extends _$GymSettingsNotifier {
  Future<SettingsRepository> _getRepo() async {
    return await ref.watch(settingsRepositoryProvider.future);
  }

  @override
  Future<GymSettings> build() async {
    final repo = await _getRepo();
    return repo.getGymSettings();
  }

  Future<void> saveGymSettings(GymSettings settings) async {
    final repo = await _getRepo();
    await repo.saveGymSettings(settings);
    state = AsyncValue.data(settings);
  }
}
