import 'package:clones_desktop/application/shared_preferences_factory.dart';
import 'package:clones_desktop/domain/models/factory_settings.dart';
import 'package:clones_desktop/infrastructure/settings_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings.g.dart';

// TODO(reddwarf03): To test
@Riverpod(keepAlive: true)
Future<SettingsRepository> settingsRepository(Ref ref) async {
  final prefs = await ref.watch(sharedPreferencesFactoryProvider).create();
  return SettingsRepository(prefs);
}

@riverpod
class FactorySettingsNotifier extends _$FactorySettingsNotifier {
  Future<SettingsRepository> _getRepo() async {
    return await ref.watch(settingsRepositoryProvider.future);
  }

  @override
  Future<FactorySettings> build() async {
    final repo = await _getRepo();
    return repo.getFactorySettings();
  }

  Future<void> saveFactorySettings(FactorySettings settings) async {
    final repo = await _getRepo();
    await repo.saveFactorySettings(settings);
    state = AsyncValue.data(settings);
  }
}
