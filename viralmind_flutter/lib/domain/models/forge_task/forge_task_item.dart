import 'package:freezed_annotation/freezed_annotation.dart';

part 'forge_task_item.freezed.dart';
part 'forge_task_item.g.dart';

@freezed
class ForgeTaskItem with _$ForgeTaskItem {
  const factory ForgeTaskItem({
    String? id,
    required String prompt,
    int? uploadLimit,
    int? rewardLimit,
    bool? completed,
    String? recordingId,
    double? score,
    bool? uploadLimitReached,
    int? currentSubmissions,
    String? limitReason,
  }) = _ForgeTaskItem;

  factory ForgeTaskItem.fromJson(Map<String, dynamic> json) =>
      _$ForgeTaskItemFromJson(json);
}
