// Forge tasks endpoints API
//
// Migrated from src/lib/api/endpoints/forge/tasks.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../forge/forge_app.dart';
import '../../core/client.dart';

// Récupère les tâches pour un gym avec filtres optionnels
Future<List<ForgeTask>> getTasksForGym(
  WidgetRef ref, {
  Map<String, dynamic>? filter,
}) async {
  final client = ref.read(apiClientProvider);
  final params = <String, dynamic>{};

  if (filter != null) {
    if (filter['poolId'] != null) params['pool_id'] = filter['poolId'];
    if (filter['minReward'] != null) params['min_reward'] = filter['minReward'];
    if (filter['maxReward'] != null) params['max_reward'] = filter['maxReward'];
    if (filter['categories'] != null) {
      params['categories'] = filter['categories'];
    }
    if (filter['query'] != null) params['query'] = filter['query'];
    if (filter['hideAdult'] != null) params['hide_adult'] = filter['hideAdult'];
  }

  final tasks = await client.get<List<dynamic>>(
    '/forge/apps/tasks',
    params: params,
    fromJson:
        (json) =>
            (json as List)
                .map((e) => ForgeTask.fromJson(e as Map<String, dynamic>))
                .toList(),
  );
  return tasks.cast<ForgeTask>();
}
