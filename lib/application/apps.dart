import 'package:clones_desktop/application/recording.dart';
import 'package:clones_desktop/domain/models/forge_task/forge_app.dart';
import 'package:clones_desktop/domain/models/ui/factory_filter.dart';
import 'package:clones_desktop/infrastructure/apps.repository.dart';
import 'package:clones_desktop/utils/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'apps.g.dart';

@riverpod
AppsRepositoryImpl appsRepository(
  Ref ref,
) {
  final apiClient = ref.watch(apiClientProvider);
  return AppsRepositoryImpl(apiClient);
}

@riverpod
Future<Map<String, dynamic>> generateApps(
  Ref ref, {
  required String prompt,
}) async {
  final appsRepository = ref.read(appsRepositoryProvider);
  return appsRepository.generateApps(prompt: prompt);
}

@riverpod
Future<List<ForgeApp>> getAppsForHistory(Ref ref) async {
  final appsRepository = ref.read(appsRepositoryProvider);
  final recordings = await ref.read(listRecordingsProvider.future);
  return appsRepository.getAppsForHistory(recordings);
}

@riverpod
Future<List<ForgeApp>> getAppsForSkills(Ref ref) async {
  final appsRepository = ref.read(appsRepositoryProvider);
  final recordings = await ref.read(listRecordingsProvider.future);
  return appsRepository.getAppsForSkills(recordings);
}

@riverpod
Future<List<ForgeApp>> getAppsForFactory(
  Ref ref, {
  required FactoryFilter filter,
}) async {
  final appsRepository = ref.read(appsRepositoryProvider);
  final apps = await appsRepository.getAppsForFactory(filter: filter.toJson());
  return apps;
}

@riverpod
Future<List<String>> getFactoryCategories(Ref ref) async {
  final appsRepository = ref.read(appsRepositoryProvider);
  return appsRepository.getFactoryCategories();
}
