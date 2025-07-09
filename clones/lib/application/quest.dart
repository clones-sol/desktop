import 'package:clones/application/tauri_api.dart';
import 'package:clones/domain/models/quest/quest.dart';
import 'package:clones/infrastructure/quest.repository.dart';
import 'package:clones/utils/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quest.g.dart';

@riverpod
QuestRepositoryImpl questRepository(
  Ref ref,
) {
  final apiClient = ref.watch(apiClientProvider);
  final tauriClient = ref.watch(tauriApiClientProvider);
  return QuestRepositoryImpl(apiClient, tauriClient);
}

@riverpod
Future<Quest> generateQuest(
  Ref ref, {
  required String prompt,
  required String address,
  String? poolId,
  String? taskId,
}) async {
  final questRepository = ref.read(questRepositoryProvider);
  return questRepository.generateQuest(
    prompt: prompt,
    address: address,
    poolId: poolId,
    taskId: taskId,
  );
}

@riverpod
Future<Map<String, dynamic>> checkQuestProgress(
  Ref ref, {
  required Quest quest,
}) async {
  final questRepository = ref.read(questRepositoryProvider);
  return questRepository.checkQuestProgress(quest);
}
