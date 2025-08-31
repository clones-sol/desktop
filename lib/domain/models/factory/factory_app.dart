// ignore_for_file: invalid_annotation_target

import 'package:clones_desktop/domain/models/factory/factory_task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'factory_app.freezed.dart';
part 'factory_app.g.dart';

/// Factory app definition
@freezed
class FactoryApp with _$FactoryApp {
  const factory FactoryApp({
    @JsonKey(name: '_id') String? id,
    required String name,
    required String domain,
    String? description,
    @Default([]) List<String> categories,
    @Default([]) List<FactoryTask> tasks,
    @JsonKey(name: 'pool_id') String? poolId,
  }) = _FactoryApp;

  factory FactoryApp.fromJson(Map<String, dynamic> json) =>
      _$FactoryAppFromJson(json);
}
