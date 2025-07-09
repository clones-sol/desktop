import 'package:clones/domain/models/forge_task/forge_app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forge_task.freezed.dart';
part 'forge_task.g.dart';

@freezed
class ForgeTask with _$ForgeTask {
  const factory ForgeTask({
    @JsonKey(name: '_id', includeIfNull: false) required String id,
    required String prompt,
    @JsonKey(includeIfNull: false) required int uploadLimit,
    @JsonKey(includeIfNull: false) required int rewardLimit,
    @JsonKey(includeIfNull: false) required bool uploadLimitReached,
    @JsonKey(includeIfNull: false) required int currentSubmissions,
    required String limitReason,
    required ForgeApp app,
  }) = _ForgeTask;

  factory ForgeTask.fromJson(Map<String, dynamic> json) =>
      _$ForgeTaskFromJson(json);
}
