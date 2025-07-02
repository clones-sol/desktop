import 'dart:async';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' hide RequestOptions;
import 'package:flutter/foundation.dart';
import 'package:viralmind_flutter/domain/models/api/request_options.dart';
import 'package:viralmind_flutter/domain/models/upload/upload_metadata.dart';
import 'package:viralmind_flutter/domain/models/upload/upload_progress.dart';
import 'package:viralmind_flutter/utils/api_client.dart';

class UploadRepositoryImpl {
  UploadRepositoryImpl(this._client);
  final ApiClient _client;

  int chunkSize = 15 * 1024 * 1024; // 15MB by default

  Future<String> _calculateHash(Uint8List data) async {
    final digest = sha256.convert(data);
    return digest.toString();
  }

  Future<Map<String, dynamic>> initUpload({
    required UploadMetadata metadata,
    required int totalChunks,
  }) async {
    try {
      final result = await _client.post<Map<String, dynamic>>(
        '/forge/upload/init',
        data: {'totalChunks': totalChunks, 'metadata': metadata.toJson()},
        options: const RequestOptions(
          requiresAuth: true,
          headers: {'Content-Type': 'application/json'},
        ),
      );
      final uploadId = result['uploadId'] as String;
      chunkSize = result['chunkSize'] as int;
      return {'uploadId': uploadId, 'chunkSize': chunkSize};
    } catch (e) {
      throw Exception('Failed to init upload: $e');
    }
  }

  Future<UploadProgress> uploadChunk({
    required String uploadId,
    required Uint8List chunk,
    required int chunkIndex,
  }) async {
    final checksum = await _calculateHash(chunk);

    final formData = FormData.fromMap({
      'chunkIndex': chunkIndex.toString(),
      'checksum': checksum,
      'chunk': MultipartFile.fromBytes(chunk, filename: 'chunk'),
    });

    final response = await _client.post<Map<String, dynamic>>(
      '/forge/upload/chunk/$uploadId',
      data: formData,
      options: const RequestOptions(requiresAuth: true),
    );
    return UploadProgress.fromJson(response);
  }

  Future<Map<String, dynamic>> getUploadStatus(String uploadId) async {
    return _client.get<Map<String, dynamic>>(
      '/forge/upload/status/$uploadId',
      options: const RequestOptions(requiresAuth: true),
    );
  }

  Future<Map<String, dynamic>> completeUpload(String uploadId) async {
    return _client.post<Map<String, dynamic>>(
      '/forge/upload/complete/$uploadId',
      options: const RequestOptions(requiresAuth: true),
    );
  }

  Future<Map<String, dynamic>> cancelUpload(String uploadId) async {
    return _client.delete<Map<String, dynamic>>(
      '/forge/upload/cancel/$uploadId',
      options: const RequestOptions(requiresAuth: true),
    );
  }
}
