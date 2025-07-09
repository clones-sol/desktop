import 'package:clones/domain/models/quest/quest.dart';
import 'package:clones/domain/models/recording/monitor_info.dart';
import 'package:clones/domain/models/submission/submission_status.dart';
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
    Quest? quest,
    String? location,
    SubmissionStatus? submission,
  }) = _ApiRecording;

  factory ApiRecording.fromJson(Map<String, dynamic> json) =>
      _$ApiRecordingFromJson(json);
}
