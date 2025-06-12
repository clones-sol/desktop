import 'package:viralmind_flutter/api/core/client.dart';
import 'package:viralmind_flutter/domain/models/quest/quest.dart';
import 'package:viralmind_flutter/domain/models/quest/quest_reward.dart';
import 'package:viralmind_flutter/domain/models/quest/reward_info.dart';
import 'package:viralmind_flutter/infrastructure/pool.repository.dart';

class QuestRepositoryImpl {
  QuestRepositoryImpl(this._client);
  final ApiClient _client;

  Future<Quest> generateQuest({
    required String prompt,
    required String address,
    String? poolId,
    String? taskId,
  }) async {
    // TODO: Get the list of installed applications (equivalent Tauri)
    const appList = ''; // Placeholder

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

  Future<Map<String, dynamic>> checkQuestProgress(
    Quest quest,
  ) async {
    // TODO: Take a screenshot (equivalent Tauri)
    const screenshot = null; // Placeholder

    return _client.post<Map<String, dynamic>>(
      '/gym/progress',
      data: {
        'quest': quest.toJson(),
        'screenshots': [screenshot],
      },
    );
  }
}
