import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/application/tauri_api.dart';
import 'package:viralmind_flutter/domain/models/quest/quest.dart';
import 'package:viralmind_flutter/infrastructure/recording.repository.dart';

part 'recording.g.dart';

@riverpod
RecordingRepositoryImpl recordingRepository(
  Ref ref,
) {
  return RecordingRepositoryImpl();
}

@riverpod
Future<void> startRecording(Ref ref, {Quest? quest, int fps = 30}) async {
  final recordingRepository = ref.read(recordingRepositoryProvider);
  return recordingRepository.startRecording(quest: quest, fps: fps);
}

@riverpod
Future<String> stopRecording(Ref ref, {String? reason}) async {
  final recordingRepository = ref.read(recordingRepositoryProvider);
  return recordingRepository.stopRecording(reason: reason);
}

@riverpod
Future<void> writeRecordingFile(
  Ref ref, {
  required String recordingId,
  required String filename,
  required String content,
}) async {
  final tauriApiClient = ref.read(tauriApiClientProvider);
  await tauriApiClient.writeRecordingFile(
    recordingId: recordingId,
    filename: filename,
    content: content,
  );
}
