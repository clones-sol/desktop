import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_progress.freezed.dart';
part 'upload_progress.g.dart';

@freezed
class UploadProgress with _$UploadProgress {
  const factory UploadProgress({
    required String uploadId,
    required int chunkIndex,
    required int received,
    required int total,
    required double progress,
  }) = _UploadProgress;

  factory UploadProgress.fromJson(Map<String, dynamic> json) =>
      _$UploadProgressFromJson(json);
}
