import 'package:freezed_annotation/freezed_annotation.dart';

part 'forge_task_item.freezed.dart';
part 'forge_task_item.g.dart';

@freezed
class ForgeTaskItem with _$ForgeTaskItem {
  const factory ForgeTaskItem({
    @JsonKey(name: '_id', includeIfNull: false) String? id,
    required String prompt,
    @JsonKey(includeIfNull: false) int? uploadLimit,
    @JsonKey(includeIfNull: false) double? rewardLimit,
    @JsonKey(includeIfNull: false) bool? completed,
    @JsonKey(includeIfNull: false) String? recordingId,
    @JsonKey(includeIfNull: false) int? score,
    @JsonKey(includeIfNull: false) bool? uploadLimitReached,
    @JsonKey(includeIfNull: false) int? currentSubmissions,
    @JsonKey(includeIfNull: false) String? limitReason,
  }) = _ForgeTaskItem;

  factory ForgeTaskItem.fromJson(Map<String, dynamic> json) =>
      _$ForgeTaskItemFromJson(json);
}
