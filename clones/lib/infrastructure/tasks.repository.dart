import 'package:clones/domain/models/forge_task/forge_task.dart';
import 'package:clones/utils/api_client.dart';

class TasksRepositoryImpl {
  TasksRepositoryImpl(this._client);
  final ApiClient _client;

  Future<List<ForgeTask>> getTasksForGym({
    Map<String, dynamic>? filter,
  }) async {
    try {
      final params = <String, dynamic>{};

      if (filter != null) {
        if (filter['poolId'] != null) params['pool_id'] = filter['poolId'];
        if (filter['minReward'] != null) {
          params['min_reward'] = filter['minReward'];
        }
        if (filter['maxReward'] != null) {
          params['max_reward'] = filter['maxReward'];
        }
        if (filter['categories'] != null) {
          params['categories'] = filter['categories'];
        }
        if (filter['query'] != null) params['query'] = filter['query'];
        if (filter['hideAdult'] != null) {
          params['hide_adult'] = filter['hideAdult'];
        }
      }

      final tasks = await _client.get<List<dynamic>>(
        '/forge/apps/tasks',
        params: params,
        fromJson: (json) => (json as List)
            .map((e) => ForgeTask.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
      return tasks.cast<ForgeTask>();
    } catch (e) {
      throw Exception('Failed to get tasks: $e');
    }
  }
}
