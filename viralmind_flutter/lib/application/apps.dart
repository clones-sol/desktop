import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/api/core/client.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';
import 'package:viralmind_flutter/infrastructure/apps.repository.dart';

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

/*
@riverpod
Future<List<ForgeApp>> getAppsForHistory(Ref ref) async {
  final appsRepository = ref.read(appsRepositoryProvider);
  return appsRepository.getAppsForHistory();
}

@riverpod
Future<List<ForgeApp>> getAppsForSkills(Ref ref) async {
  final appsRepository = ref.read(appsRepositoryProvider);
  return appsRepository.getAppsForSkills();
}
*/

@riverpod
Future<List<ForgeApp>> getAppsForGym(
  Ref ref, {
  Map<String, dynamic>? filter,
}) async {
  final appsRepository = ref.read(appsRepositoryProvider);
  return appsRepository.getAppsForGym(filter: filter);
}

@riverpod
Future<List<String>> getGymCategories(Ref ref) async {
  final appsRepository = ref.read(appsRepositoryProvider);
  return appsRepository.getGymCategories();
}
