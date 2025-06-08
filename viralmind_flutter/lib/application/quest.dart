import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/api/core/client.dart';
import 'package:viralmind_flutter/domain/models/quest/quest.dart';
import 'package:viralmind_flutter/infrastructure/quest.repository.dart';

part 'quest.g.dart';

@riverpod
QuestRepositoryImpl questRepository(
  Ref ref,
) {
  final apiClient = ref.watch(apiClientProvider);
  return QuestRepositoryImpl(apiClient);
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
