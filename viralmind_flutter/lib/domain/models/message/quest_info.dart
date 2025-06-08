import 'package:freezed_annotation/freezed_annotation.dart';

part 'quest_info.freezed.dart';
part 'quest_info.g.dart';

@freezed
class QuestInfo with _$QuestInfo {
  const factory QuestInfo({
    required String taskId,
    required String title,
    required String originalInstruction,
    required String concreteScenario,
    required String objective,
    required List<String> relevantApplications,
    required List<String> subgoals,
  }) = _QuestInfo;

  factory QuestInfo.fromJson(Map<String, dynamic> json) =>
      _$QuestInfoFromJson(json);
}
