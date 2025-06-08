// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:viralmind_flutter/api/core/client.dart';
import 'package:viralmind_flutter/domain/models/api/request_options.dart';
import 'package:viralmind_flutter/domain/models/upload/upload_metadata.dart';
import 'package:viralmind_flutter/domain/models/upload/upload_progress.dart';

class UploadRepositoryImpl {
  UploadRepositoryImpl(this._client);
  final ApiClient _client;

  String? uploadId;
  int chunkSize = 15 * 1024 * 1024; // 15MB by default
  int totalChunks = 0;
  final Set<int> uploadedChunks = {};

  Future<String> _calculateHash(Uint8List data) async {
    final digest = sha256.convert(data);
    return digest.toString();
  }

  Future<Map<String, dynamic>> initUpload({
    required UploadMetadata metadata,
  }) async {
    try {
      final result = await _client.post<Map<String, dynamic>>(
        '/forge/upload/init',
        data: {'totalChunks': totalChunks, 'metadata': metadata.toJson()},
        options: const RequestOptions(requiresAuth: true),
      );
      uploadId = result['uploadId'] as String;
      chunkSize = result['chunkSize'] as int;
      return result;
    } catch (e) {
      throw Exception('Failed to init upload: $e');
    }
  }

  Future<UploadProgress> uploadChunk({
    required Uint8List chunk,
    required int chunkIndex,
  }) async {
    if (uploadId == null) throw Exception('Upload not initialized');
    // TODO: fix it
    // final token = _client.getAuthToken();

    final checksum = await _calculateHash(chunk);

    final url = Uri.parse('${_client.baseUrl}/forge/upload/chunk/$uploadId');
    final request = http.MultipartRequest('POST', url)
      // ..headers['x-connect-token'] = token
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

  Future<Map<String, dynamic>> getStatus() async {
    if (uploadId == null) throw Exception('Upload not initialized');
    return _client.get<Map<String, dynamic>>(
      '/forge/upload/status/$uploadId',
      options: const RequestOptions(requiresAuth: true),
    );
  }

  Future<Map<String, dynamic>> completeUpload() async {
    if (uploadId == null) throw Exception('Upload not initialized');
    return _client.post<Map<String, dynamic>>(
      '/forge/upload/complete/$uploadId',
      options: const RequestOptions(requiresAuth: true),
    );
  }

  Future<Map<String, dynamic>> cancelUpload() async {
    if (uploadId == null) throw Exception('Upload not initialized');
    return _client.delete<Map<String, dynamic>>(
      '/forge/upload/cancel/$uploadId',
      options: const RequestOptions(requiresAuth: true),
    );
  }

  // TODO: Move to a utils file
  List<Uint8List> splitIntoChunks(Uint8List data) {
    final chunks = <Uint8List>[];
    var start = 0;
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
