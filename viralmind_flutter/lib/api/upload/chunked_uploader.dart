// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:freezed_annotation/freezed_annotation.dart';
import '../core/client.dart';
import '../core/auth.dart';

part 'chunked_uploader.freezed.dart';
part 'chunked_uploader.g.dart';

/// --- MODELS ---

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

@freezed
class UploadMetadata with _$UploadMetadata {
  const factory UploadMetadata({
    String? poolId,
    int? generatedTime,
    required String id,
  }) = _UploadMetadata;

  factory UploadMetadata.fromJson(Map<String, dynamic> json) =>
      _$UploadMetadataFromJson(json);
}

/// --- CHUNKED UPLOADER ---

class ChunkedUploader {
  String? uploadId;
  int chunkSize = 15 * 1024 * 1024; // 15MB par défaut
  int totalChunks = 0;
  final Set<int> uploadedChunks = {};
  final Ref ref;
  final ApiClient apiClient;

  ChunkedUploader(this.ref) : apiClient = ref.read(apiClientProvider);

  /// Calcule le hash SHA-256 d'un chunk
  Future<String> calculateHash(Uint8List data) async {
    final digest = sha256.convert(data);
    return digest.toString();
  }

  /// Initialise une session d'upload
  Future<Map<String, dynamic>> initUpload(UploadMetadata metadata) async {
    final result = await apiClient.post<Map<String, dynamic>>(
      '/forge/upload/init',
      data: {'totalChunks': totalChunks, 'metadata': metadata.toJson()},
      options: const RequestOptions(requiresAuth: true),
    );
    uploadId = result['uploadId'] as String;
    chunkSize = result['chunkSize'] as int;
    return result;
  }

  /// Upload un chunk (multipart, nécessite un appel direct)
  Future<UploadProgress> uploadChunk(Uint8List chunk, int chunkIndex) async {
    if (uploadId == null) throw Exception('Upload not initialized');
    final token = getAuthToken(ref);

    final checksum = await calculateHash(chunk);

    final url = Uri.parse('${apiClient.baseUrl}/forge/upload/chunk/$uploadId');
    final request =
        http.MultipartRequest('POST', url)
          ..headers['x-connect-token'] = token
          ..fields['chunkIndex'] = chunkIndex.toString()
          ..fields['checksum'] = checksum
          ..files.add(
            http.MultipartFile.fromBytes(
              'chunk',
              chunk,
              filename: 'chunk_$chunkIndex',
            ),
          );

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Failed to upload chunk: ${response.body}');
    }

    final result = jsonDecode(response.body) as Map<String, dynamic>;
    uploadedChunks.add(chunkIndex);
    return UploadProgress.fromJson(result);
  }

  /// Récupère le statut de l'upload
  Future<Map<String, dynamic>> getStatus() async {
    if (uploadId == null) throw Exception('Upload not initialized');
    return await apiClient.get<Map<String, dynamic>>(
      '/forge/upload/status/$uploadId',
      options: const RequestOptions(requiresAuth: true),
    );
  }

  /// Termine l'upload
  Future<Map<String, dynamic>> completeUpload() async {
    if (uploadId == null) throw Exception('Upload not initialized');
    return await apiClient.post<Map<String, dynamic>>(
      '/forge/upload/complete/$uploadId',
      options: const RequestOptions(requiresAuth: true),
    );
  }

  /// Annule l'upload
  Future<Map<String, dynamic>> cancelUpload() async {
    if (uploadId == null) throw Exception('Upload not initialized');
    return await apiClient.delete<Map<String, dynamic>>(
      '/forge/upload/cancel/$uploadId',
      options: const RequestOptions(requiresAuth: true),
    );
  }

  /// Découpe un fichier en chunks
  List<Uint8List> splitIntoChunks(Uint8List data) {
    final chunks = <Uint8List>[];
    int start = 0;
    while (start < data.length) {
      final end =
          (start + chunkSize < data.length) ? start + chunkSize : data.length;
      chunks.add(data.sublist(start, end));
      start = end;
    }
    totalChunks = chunks.length;
    return chunks;
  }
}
