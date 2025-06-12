import 'package:freezed_annotation/freezed_annotation.dart';

part 'quest_reward.freezed.dart';
part 'quest_reward.g.dart';

@freezed
class QuestReward with _$QuestReward {
  const factory QuestReward({
    required int time,
    @JsonKey(name: 'max_reward') required int maxReward,
  }) = _QuestReward;

  factory QuestReward.fromJson(Map<String, dynamic> json) =>
      _$QuestRewardFromJson(json);
}
