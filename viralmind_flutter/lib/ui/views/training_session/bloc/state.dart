import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/quest/quest.dart';

part 'state.freezed.dart';

enum RecordingState { off, recording, saved }

@freezed
class TrainingSessionState with _$TrainingSessionState {
  const factory TrainingSessionState({
    Quest? currentQuest,
    Quest? activeQuest,
    @Default(false) bool recordingLoading,
    @Default(false) bool recordingProcessing,
    @Default(false) bool showUploadConfirmModal,
    String? currentRecordingId,
    @Default(false) bool isUploading,
    @Default(false) bool loadingSftData,
    @Default(RecordingState.off) RecordingState recordingState,
  }) = _TrainingSessionState;
  const TrainingSessionState._();
}
