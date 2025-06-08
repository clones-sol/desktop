import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';

part 'forge_task.freezed.dart';
part 'forge_task.g.dart';

@freezed
class ForgeTask with _$ForgeTask {
  const factory ForgeTask({
    required String id,
    required String prompt,
    required int uploadLimit,
    required int rewardLimit,
    required bool uploadLimitReached,
    required int currentSubmissions,
    required String limitReason,
    required ForgeApp app,
  }) = _ForgeTask;

  factory ForgeTask.fromJson(Map<String, dynamic> json) =>
      _$ForgeTaskFromJson(json);
}
