// Quest model for Gym endpoints
//
// Migrated from src/lib/types/gym.ts

import 'package:freezed_annotation/freezed_annotation.dart';

part 'quest.freezed.dart';
part 'quest.g.dart';

@freezed
class Quest with _$Quest {
  const factory Quest({
    required String title,
    required String app,
    required String iconUrl,
    required List<String> objectives,
    required String content,
    String? poolId,
    RewardInfo? reward,
    String? taskId,
  }) = _Quest;

  factory Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);
}

@freezed
class RewardInfo with _$RewardInfo {
  const factory RewardInfo({required int time, required int maxReward}) =
      _RewardInfo;

  factory RewardInfo.fromJson(Map<String, dynamic> json) =>
      _$RewardInfoFromJson(json);
}
