import 'package:clones_desktop/domain/models/demonstration/demonstration.dart';
import 'package:clones_desktop/domain/models/recording/monitor_info.dart';
import 'package:clones_desktop/domain/models/submission/submission_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_recording.freezed.dart';
part 'api_recording.g.dart';

@freezed
class ApiRecording with _$ApiRecording {
  const factory ApiRecording({
    required String id,
    required String timestamp,
    required int durationSeconds,
    required String status,
    required String title,
    required String description,
    required String platform,
    required String arch,
    required String version,
    required String locale,
    required MonitorInfo primaryMonitor,
    @JsonKey(name: 'quest') Demonstration? demonstration,
    String? location,
    SubmissionStatus? submission,
  }) = _ApiRecording;

  factory ApiRecording.fromJson(Map<String, dynamic> json) =>
      _$ApiRecordingFromJson(json);
}
