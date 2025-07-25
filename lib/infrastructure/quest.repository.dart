import 'package:clones_desktop/domain/models/quest/quest.dart';
import 'package:clones_desktop/domain/models/quest/quest_reward.dart';
import 'package:clones_desktop/infrastructure/pool.repository.dart';
import 'package:clones_desktop/infrastructure/tauri_api_client.dart';
import 'package:clones_desktop/utils/api_client.dart';

class QuestRepositoryImpl {
  QuestRepositoryImpl(this._client, this._tauriClient);
  final ApiClient _client;
  final TauriApiClient _tauriClient;
  // TODO(reddwarf03): Not used ?
  Future<Quest> generateQuest({
    required String prompt,
    required String address,
    String? poolId,
    String? taskId,
  }) async {
    final apps = await _tauriClient.listApps();
    final appList = apps.map((app) => app.name).join('\n');

    final quest = await _client.post<Quest>(
      '/gym/quest',
      data: {
        'installed_applications': appList,
        'address': address,
        'prompt': prompt,
      },
      fromJson: (json) => Quest.fromJson(json as Map<String, dynamic>),
    );

    if (poolId != null) {
      final rewardInfo = await PoolsRepositoryImpl(_client).getReward(
        poolId: poolId,
        taskId: taskId,
      );
      return quest.copyWith(
        poolId: poolId,
        reward: QuestReward(
          time: rewardInfo.time,
          maxReward: rewardInfo.maxReward,
        ),
        taskId: taskId,
      );
    }

    return quest;
  }

  // TODO(reddwarf03): Not used ?
  Future<Map<String, dynamic>> checkQuestProgress(
    Quest quest,
  ) async {
    final screenshot = await _tauriClient.takeScreenshot();

    return _client.post<Map<String, dynamic>>(
      '/gym/progress',
      data: {
        'quest': quest.toJson(),
        'screenshots': [screenshot],
      },
    );
  }
}
