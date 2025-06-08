import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:viralmind_flutter/domain/models/api/api_error.dart';
import 'package:viralmind_flutter/domain/models/api/api_response.dart';

/// Handles API errors consistently
Future<Never> handleApiError(http.Response response) async {
  ApiResponse? data;
  var errorMessage = '${response.statusCode} ${response.reasonPhrase}';

  try {
    final json = jsonDecode(response.body);
    data = ApiResponse.fromJson(json);
    if (data.error != null) {
      errorMessage =
          '${data.error!.code.name}: ${data.error!.message}${data.error!.details != null ? '\n${data.error!.details}' : ''}';
    }
  } catch (_) {
    data = null;
  }

  throw ApiError(
    status: response.statusCode,
    statusText: response.reasonPhrase ?? '',
    message: errorMessage,
    data: data,
  );
}

/// Utility to create a timeout error
ApiError createTimeoutError(int timeoutMs) {
  return ApiError(
    status: 408,
    statusText: 'Request Timeout',
    message: 'Request timed out after ${timeoutMs}ms',
    data: {'timeoutMs': timeoutMs},
  );
}
