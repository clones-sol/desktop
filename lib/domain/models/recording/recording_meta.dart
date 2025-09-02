import 'package:clones_desktop/domain/models/demonstration/demonstration.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recording_meta.freezed.dart';
part 'recording_meta.g.dart';

@freezed
class RecordingMeta with _$RecordingMeta {
  const factory RecordingMeta({
    required String id,
    required String timestamp,
    @JsonKey(name: 'duration_seconds') required int durationSeconds,
    required String status,
    String? reason,
    required String title,
    required String description,
    required String platform,
    required String arch,
    required String version,
    required String locale,
    @JsonKey(name: 'quest') required Demonstration demonstration,
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
