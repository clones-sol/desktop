import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/quest/quest.dart';

part 'recording_meta.freezed.dart';
part 'recording_meta.g.dart';

@freezed
class RecordingMeta with _$RecordingMeta {
  const factory RecordingMeta({
    required String id,
    required String timestamp,
    required int duration_seconds,
    required String status,
    String? reason,
    required String title,
    required String description,
    required String platform,
    required String arch,
    required String version,
    required String locale,
    required MonitorInfo primary_monitor,
    Quest? quest,
  }) = _RecordingMeta;

  factory RecordingMeta.fromJson(Map<String, dynamic> json) =>
      _$RecordingMetaFromJson(json);
}

@freezed
class MonitorInfo with _$MonitorInfo {
  const factory MonitorInfo({
    required int width,
    required int height,
  }) = _MonitorInfo;

  factory MonitorInfo.fromJson(Map<String, dynamic> json) =>
      _$MonitorInfoFromJson(json);
}
