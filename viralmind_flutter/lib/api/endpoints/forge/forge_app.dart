// ForgeApp model for Forge endpoints
//
// Migrated from src/lib/types/gym.ts

import 'package:freezed_annotation/freezed_annotation.dart';

part 'forge_app.freezed.dart';
part 'forge_app.g.dart';

@freezed
class ForgeTask with _$ForgeTask {
  const factory ForgeTask({
    String? id,
    String? prompt,
    int? uploadLimit,
    int? rewardLimit,
    bool? completed,
    String? recordingId,
    double? score,
    bool? uploadLimitReached,
    int? currentSubmissions,
    String? limitReason,
  }) = _ForgeTask;

  factory ForgeTask.fromJson(Map<String, dynamic> json) =>
      _$ForgeTaskFromJson(json);
}

@freezed
class ForgeAppPool with _$ForgeAppPool {
  const factory ForgeAppPool({
    required String id,
    required String name,
    required String status,
    required double pricePerDemo,
  }) = _ForgeAppPool;

  factory ForgeAppPool.fromJson(Map<String, dynamic> json) =>
      _$ForgeAppPoolFromJson(json);
}

@freezed
class ForgeApp with _$ForgeApp {
  const factory ForgeApp({
    required String name,
    required String domain,
    required String description,
    required List<String> categories,
    required List<ForgeTask> tasks,
    required ForgeAppPool poolId,
    bool? seen,
    bool? gymLimitReached,
    int? gymSubmissions,
    String? gymLimitType,
    int? gymLimitValue,
  }) = _ForgeApp;

  factory ForgeApp.fromJson(Map<String, dynamic> json) =>
      _$ForgeAppFromJson(json);
}
