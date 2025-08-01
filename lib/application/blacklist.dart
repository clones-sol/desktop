import 'package:clones_desktop/application/shared_preferences_factory.dart';
import 'package:clones_desktop/infrastructure/blacklist.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blacklist.g.dart';

@riverpod
BlacklistRepositoryImpl blacklistRepository(
  Ref ref,
) {
  final sharedPreferencesFactory = ref.watch(sharedPreferencesFactoryProvider);
  return BlacklistRepositoryImpl(sharedPreferencesFactory);
}

@riverpod
Future<List<String>> getBlacklist(Ref ref) async {
  final blacklistRepository = ref.read(blacklistRepositoryProvider);
  return blacklistRepository.getBlacklist();
}

@riverpod
Future<void> addApp(Ref ref, String appName) async {
  final blacklistRepository = ref.read(blacklistRepositoryProvider);
  return blacklistRepository.addApp(appName);
}

@riverpod
Future<void> removeApp(Ref ref, String appName) async {
  final blacklistRepository = ref.read(blacklistRepositoryProvider);
  return blacklistRepository.removeApp(appName);
}
