// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/quest/quest.dart';
import 'package:viralmind_flutter/domain/models/recording/monitor_info.dart';

part 'submission_meta.freezed.dart';
part 'submission_meta.g.dart';

@freezed
class SubmissionMeta with _$SubmissionMeta {
  const factory SubmissionMeta({
    required String id,
    required String timestamp,
    @JsonKey(name: 'duration_seconds') required int durationSeconds,
    required String status,
    required String reason,
    required String title,
    required String description,
    required String platform,
    required String arch,
    required String version,
    required String locale,
    @JsonKey(name: 'primary_monitor') required MonitorInfo primaryMonitor,
    required Quest quest,
    String? poolId,
  }) = _SubmissionMeta;

  factory SubmissionMeta.fromJson(Map<String, dynamic> json) =>
      _$SubmissionMetaFromJson(json);
}
