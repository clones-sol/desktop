import 'package:clones_desktop/domain/models/forge_task/forge_task_item.dart';
import 'package:clones_desktop/domain/models/forge_task/pool_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forge_app.freezed.dart';
part 'forge_app.g.dart';

@freezed
class ForgeApp with _$ForgeApp {
  const factory ForgeApp({
    @JsonKey(name: '_id', includeIfNull: false) String? id,
    required String name,
    required String domain,
    required String description,
    @Default([]) List<String> categories,
    @Default([]) List<ForgeTaskItem> tasks,
    @JsonKey(name: 'pool_id', includeIfNull: false) PoolId? poolId,
    @JsonKey(includeIfNull: false) bool? seen,
    @JsonKey(includeIfNull: false) bool? factoryLimitReached,
    @JsonKey(includeIfNull: false) int? factorySubmissions,
    @JsonKey(includeIfNull: false) String? factoryLimitType,
    @JsonKey(includeIfNull: false) int? factoryLimitValue,
  }) = _ForgeApp;

  factory ForgeApp.fromJson(Map<String, dynamic> json) =>
      _$ForgeAppFromJson(json);
}
