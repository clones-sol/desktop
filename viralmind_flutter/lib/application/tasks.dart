import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/api/core/client.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_task.dart';
import 'package:viralmind_flutter/infrastructure/tasks.repository.dart';

part 'tasks.g.dart';

@riverpod
TasksRepositoryImpl tasksRepository(
  Ref ref,
) {
  final apiClient = ref.watch(apiClientProvider);
  return TasksRepositoryImpl(apiClient);
}

@riverpod
Future<List<ForgeTask>> getTasksForGym(
  Ref ref, {
  Map<String, dynamic>? filter,
}) async {
  final tasksRepository = ref.read(tasksRepositoryProvider);
  return tasksRepository.getTasksForGym(filter: filter);
}
