import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/quest/quest.dart';
import 'package:viralmind_flutter/domain/models/recording/monitor_info.dart';
import 'package:viralmind_flutter/domain/models/submission/submission_status.dart';

part 'local_recording.freezed.dart';
part 'local_recording.g.dart';

// TODO: Remove this model and use ApiRecording instead?
@freezed
class LocalRecording with _$LocalRecording {
  const factory LocalRecording({
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
    SubmissionStatus? submission,
    String? location,
  }) = _LocalRecording;

  factory LocalRecording.fromJson(Map<String, dynamic> json) =>
      _$LocalRecordingFromJson(json);
}
