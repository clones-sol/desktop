import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

enum UploadStatus {
  idle,
  zipping,
  uploading,
  processing,
  done,
  error,
}

@freezed
class UploadTaskState with _$UploadTaskState {
  const factory UploadTaskState({
    required String recordingId,
    String? name,
    required UploadStatus uploadStatus,
    @Default(0) int totalBytes,
    @Default(0) int uploadedBytes,
    String? uploadId,
    String? error,
  }) = _UploadTaskState;
  const UploadTaskState._();

  double getProgress() {
    if (uploadStatus == UploadStatus.done) {
      return 1;
    }
    if (uploadStatus == UploadStatus.error ||
        uploadStatus == UploadStatus.idle) {
      return 0;
    }
    if (totalBytes == 0) {
      // Return intermediate progress for states before upload starts
      if (uploadStatus == UploadStatus.zipping) {
        return 0.1;
      }
      return 0;
    }

    const zippingProgress = 0.1;
    final uploadProgress = (uploadedBytes / totalBytes) * 0.8;
    final processingAndDoneProgress = uploadStatus == UploadStatus.processing
        ? 0.9
        : (uploadStatus == UploadStatus.done ? 1.0 : 0);

    if (uploadedBytes > 0) {
      return zippingProgress + uploadProgress;
    }

    if (processingAndDoneProgress > 0) {
      return processingAndDoneProgress.toDouble();
    }

    return zippingProgress;
  }
}
