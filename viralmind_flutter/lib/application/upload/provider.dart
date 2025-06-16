import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/application/tauri_api.dart';
import 'package:viralmind_flutter/application/upload.dart';
import 'package:viralmind_flutter/application/upload/state.dart';
import 'package:viralmind_flutter/application/wallet.dart';
import 'package:viralmind_flutter/domain/models/submission/submission_status.dart';
import 'package:viralmind_flutter/domain/models/upload/upload_metadata.dart';

final uploadQueueProvider =
    StateNotifierProvider<UploadQueueNotifier, Map<String, UploadTaskState>>(
  UploadQueueNotifier.new,
);

class UploadQueueNotifier extends StateNotifier<Map<String, UploadTaskState>> {
  UploadQueueNotifier(this.ref) : super({});
  final Ref ref;
  final Map<String, Timer> statusIntervals = {};

  void _updateTaskState(String recordingId, UploadTaskState taskState) {
    state = {
      ...state,
      recordingId: taskState,
    };
  }

  Future<void> setUploadDataAllowed(bool allowed) async {
    await ref.read(tauriApiClientProvider).setUploadDataAllowed(allowed);
    ref.invalidate(isUploadDataAllowedProvider);
  }

  Future<void> upload(String recordingId, String name) async {
    final walletAddress = await ref.read(walletAddressProvider.future);
    if (walletAddress == null) {
      throw Exception('Wallet address is null');
    }

    final isConfirmed = await ref.read(isUploadDataAllowedProvider.future);
    if (!isConfirmed) {
      throw Exception('Upload data is not allowed');
    }

    _updateTaskState(
      recordingId,
      UploadTaskState(
        recordingId: recordingId,
        name: name,
        uploadStatus: UploadStatus.zipping,
      ),
    );

    final zipBytes =
        await ref.read(getRecordingZipProvider(recordingId).future);

    final chunks =
        _splitIntoChunks(Uint8List.fromList(zipBytes), 15 * 1024 * 1024);
    final totalBytes = zipBytes.length;

    _updateTaskState(
      recordingId,
      UploadTaskState(
        recordingId: recordingId,
        name: name,
        uploadStatus: UploadStatus.uploading,
        totalBytes: totalBytes,
      ),
    );

    final initResult = await ref.read(uploadRepositoryProvider).initUpload(
          metadata: UploadMetadata(
            id: recordingId,
          ),
          totalChunks: chunks.length,
        );

    final uploadId = initResult['uploadId'] as String;

    debugPrint('uploadId: $uploadId');

    _updateTaskState(
      recordingId,
      UploadTaskState(
        recordingId: recordingId,
        name: name,
        uploadId: uploadId,
        uploadStatus: UploadStatus.uploading,
        totalBytes: totalBytes,
      ),
    );

    var uploadedBytes = 0;
    for (var i = 0; i < chunks.length; i++) {
      debugPrint('uploading chunk $i of ${chunks.length}');
      await ref.read(uploadRepositoryProvider).uploadChunk(
            uploadId: uploadId,
            chunk: chunks[i],
            chunkIndex: i,
          );

      uploadedBytes += chunks[i].length;

      _updateTaskState(
        recordingId,
        UploadTaskState(
          recordingId: recordingId,
          name: name,
          uploadId: uploadId,
          uploadStatus: UploadStatus.uploading,
          totalBytes: totalBytes,
          uploadedBytes: uploadedBytes,
        ),
      );
    }

    await completeUpload(uploadId);

    _updateTaskState(
      recordingId,
      state[recordingId]!.copyWith(
        uploadStatus: UploadStatus.processing,
      ),
    );

    pollSubmissionStatus(recordingId);

    _updateTaskState(
      recordingId,
      state[recordingId]!.copyWith(
        uploadStatus: UploadStatus.done,
      ),
    );
  }

  Future<void> completeUpload(String uploadId) async {
    await ref.read(uploadRepositoryProvider).completeUpload(uploadId);
  }

  void pollSubmissionStatus(String recordingId) {
    if (statusIntervals.containsKey(recordingId)) {
      statusIntervals[recordingId]?.cancel();
    }

    statusIntervals[recordingId] =
        Timer.periodic(const Duration(seconds: 5), (timer) async {
      try {
        final task = state[recordingId];
        if (task == null || task.uploadId == null) {
          timer.cancel();
          statusIntervals.remove(recordingId);
          return;
        }
        final status =
            await ref.read(uploadRepositoryProvider).getStatus(task.uploadId!);

        final submissionStatus = SubmissionStatus.fromJson(status);

        if (submissionStatus.status == 'completed') {
          timer.cancel();
          statusIntervals.remove(recordingId);
          _updateTaskState(
            recordingId,
            state[recordingId]!.copyWith(uploadStatus: UploadStatus.done),
          );
        } else if (submissionStatus.status == 'failed') {
          timer.cancel();
          statusIntervals.remove(recordingId);
          _updateTaskState(
            recordingId,
            state[recordingId]!
                .copyWith(uploadStatus: UploadStatus.error, error: 'Failed'),
          );
        }
      } catch (error) {
        debugPrint('Failed to get submission status: $error');
        timer.cancel();
        statusIntervals.remove(recordingId);
        _updateTaskState(
          recordingId,
          state[recordingId]!.copyWith(
            uploadStatus: UploadStatus.error,
            error: error.toString(),
          ),
        );
      }
    });
  }

  List<Uint8List> _splitIntoChunks(Uint8List data, int chunkSize) {
    final chunks = <Uint8List>[];
    var start = 0;

    while (start < data.length) {
      final end =
          (start + chunkSize > data.length) ? data.length : start + chunkSize;
      chunks.add(Uint8List.sublistView(data, start, end));
      start = end;
    }

    return chunks;
  }
}
