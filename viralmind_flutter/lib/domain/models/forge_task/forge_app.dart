import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_task_item.dart';
import 'package:viralmind_flutter/domain/models/forge_task/pool_id.dart';

part 'forge_app.freezed.dart';
part 'forge_app.g.dart';

@freezed
class ForgeApp with _$ForgeApp {
  const factory ForgeApp({
    @JsonKey(name: '_id', includeIfNull: false) String? id,
    required String name,
    required String domain,
    required String description,
    required List<String> categories,
    required List<ForgeTaskItem> tasks,
    @JsonKey(name: 'pool_id', includeIfNull: false) PoolId? poolId,
    @JsonKey(includeIfNull: false) bool? seen,
    @JsonKey(includeIfNull: false) bool? gymLimitReached,
    @JsonKey(includeIfNull: false) int? gymSubmissions,
    @JsonKey(includeIfNull: false) String? gymLimitType,
    @JsonKey(includeIfNull: false) int? gymLimitValue,
  }) = _ForgeApp;

  factory ForgeApp.fromJson(Map<String, dynamic> json) =>
      _$ForgeAppFromJson(json);
}
