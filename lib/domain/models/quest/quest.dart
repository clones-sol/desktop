import 'package:clones_desktop/domain/models/quest/quest_reward.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quest.freezed.dart';
part 'quest.g.dart';

@freezed
class Quest with _$Quest {
  const factory Quest({
    required String title,
    required String app,
    @JsonKey(name: 'icon_url') required String iconUrl,
    required List<String> objectives,
    required String content,
    @JsonKey(name: 'pool_id') String? poolId,
    QuestReward? reward,
    @JsonKey(name: 'task_id') String? taskId,
  }) = _Quest;

  factory Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);
}
