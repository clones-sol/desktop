import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/quest/reward_info.dart';

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
