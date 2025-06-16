import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/api/core/client.dart';
import 'package:viralmind_flutter/application/tauri_api.dart';
import 'package:viralmind_flutter/infrastructure/upload.repository.dart';

part 'upload.g.dart';

@riverpod
UploadRepositoryImpl uploadRepository(Ref ref) {
  return UploadRepositoryImpl(ref.watch(apiClientProvider));
}

@riverpod
Future<bool> isUploadDataAllowed(Ref ref) async {
  final apiClient = ref.watch(tauriApiClientProvider);
  return apiClient.getUploadDataAllowed();
}

@riverpod
Future<Uint8List> getRecordingZip(
  Ref ref,
  String recordingId,
) async {
  final apiClient = ref.watch(tauriApiClientProvider);
  return apiClient.getRecordingZip(recordingId);
}
