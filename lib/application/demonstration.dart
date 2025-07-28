import 'package:clones_desktop/application/tauri_api.dart';
import 'package:clones_desktop/domain/models/demonstration/demonstration.dart';
import 'package:clones_desktop/infrastructure/demonstration.repository.dart';
import 'package:clones_desktop/utils/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'demonstration.g.dart';

@riverpod
DemonstrationRepositoryImpl demonstrationRepository(
  Ref ref,
) {
  final apiClient = ref.watch(apiClientProvider);
  final tauriClient = ref.watch(tauriApiClientProvider);
  return DemonstrationRepositoryImpl(apiClient, tauriClient);
}

@riverpod
Future<Demonstration> generateDemonstration(
  Ref ref, {
  required String prompt,
  required String address,
  String? poolId,
  String? taskId,
}) async {
  final demonstrationRepository = ref.read(demonstrationRepositoryProvider);
  return demonstrationRepository.generateDemonstration(
    prompt: prompt,
    address: address,
    poolId: poolId,
    taskId: taskId,
  );
}

@riverpod
Future<Map<String, dynamic>> checkDemonstrationProgress(
  Ref ref, {
  required Demonstration demonstration,
}) async {
  final demonstrationRepository = ref.read(demonstrationRepositoryProvider);
  return demonstrationRepository.checkDemonstrationProgress(demonstration);
}
