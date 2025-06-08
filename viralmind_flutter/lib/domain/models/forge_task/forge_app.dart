import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_task_item.dart';
import 'package:viralmind_flutter/domain/models/forge_task/pool_id.dart';

part 'forge_app.freezed.dart';
part 'forge_app.g.dart';

@freezed
class ForgeApp with _$ForgeApp {
  const factory ForgeApp({
    required String name,
    required String domain,
    required String description,
    required List<String> categories,
    required List<ForgeTaskItem> tasks,
    PoolId? poolId,
    bool? seen,
    bool? gymLimitReached,
    int? gymSubmissions,
    String? gymLimitType,
    int? gymLimitValue,
  }) = _ForgeApp;

  factory ForgeApp.fromJson(Map<String, dynamic> json) =>
      _$ForgeAppFromJson(json);
}
