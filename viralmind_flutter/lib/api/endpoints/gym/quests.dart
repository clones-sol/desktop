// Gym quests endpoints API
//
// Migrated from src/lib/api/endpoints/gym/quests.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../gym/quest.dart';
import '../../core/client.dart';
import '../forge/pools.dart';

// Génère une quest à partir d'un prompt
Future<Quest> generateQuest(
  WidgetRef ref,
  String prompt,
  String address, {
  String? poolId,
  String? taskId,
}) async {
  final client = ref.read(apiClientProvider);

  // TODO: Récupérer la liste des applications installées (équivalent Tauri)
  final appList = ''; // Placeholder

  // Appel à l'API pour générer la quest
  final quest = await client.post<Quest>(
    '/gym/quest',
    data: {
      'installed_applications': appList,
      'address': address,
      'prompt': prompt,
    },
    fromJson: (json) => Quest.fromJson(json as Map<String, dynamic>),
  );

  // Si poolId fourni, enrichir la quest avec la reward
  if (poolId != null) {
    final rewardInfo = await getReward(ref, poolId, taskId);
    return quest.copyWith(
      poolId: poolId,
      reward: RewardInfo(
        time: rewardInfo['time'] as int,
        maxReward: rewardInfo['max_reward'] as int,
      ),
      taskId: taskId,
    );
  }

  return quest;
}

// Vérifie la progression d'une quest
Future<Map<String, dynamic>> checkQuestProgress(
  WidgetRef ref,
  Quest quest,
) async {
  final client = ref.read(apiClientProvider);

  // TODO: Prendre une capture d'écran (équivalent Tauri)
  final screenshot = null; // Placeholder

  return await client.post<Map<String, dynamic>>(
    '/gym/progress',
    data: {
      'quest': quest.toJson(),
      'screenshots': [screenshot],
    },
  );
}
