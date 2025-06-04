// API client for HTTP requests
//
// Migrated from src/lib/api/core/client.ts

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth.dart';
import 'errors.dart';
import '../../utils/env.dart';

class RequestOptions {
  final bool requiresAuth;
  final Map<String, String>? headers;

  const RequestOptions({this.requiresAuth = false, this.headers});
}

class ApiClient {
  final String baseUrl;
  final Ref ref;

  ApiClient(this.ref, {String? baseUrl})
    : baseUrl = baseUrl ?? '${Env.apiUrl}/api/v1';

  String _getAuthToken() => getAuthToken(ref);

  Map<String, String> _getHeaders(RequestOptions options) {
    final headers = <String, String>{};
    if (options.headers != null) {
      headers.addAll(options.headers!);
    }
    if (options.requiresAuth) {
      final token = _getAuthToken();
      if (token.isNotEmpty) {
        headers['x-connect-token'] = token;
      }
    }
    return headers;
  }

  Future<T> get<T>(
    String endpoint, {
    Map<String, dynamic>? params,
    RequestOptions options = const RequestOptions(),
    T Function(dynamic)? fromJson,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint').replace(
      queryParameters: params?.map((k, v) => MapEntry(k, v.toString())),
    );

    final response = await http.get(uri, headers: _getHeaders(options));

    if (response.statusCode < 200 || response.statusCode >= 300) {
      await handleApiError(response);
    }

    final json = jsonDecode(response.body);
    final apiResponse = ApiResponse.fromJson(json);

    if (!apiResponse.success || apiResponse.data == null) {
      throw ApiError(
        400,
        'Error',
        apiResponse.error?.message ?? 'GET: $endpoint',
        apiResponse,
      );
    }
    if (fromJson != null) {
      return fromJson(apiResponse.data);
    }
    return apiResponse.data as T;
  }

  Future<T> post<T>(
    String endpoint, {
    dynamic data,
    RequestOptions options = const RequestOptions(),
    T Function(dynamic)? fromJson,
  }) async {
    final headers = _getHeaders(options);
    Object? body;
    if (data != null) {
      headers['Content-Type'] = 'application/json';
      body = jsonEncode(data);
    }

    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: body,
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      await handleApiError(response);
    }

    final json = jsonDecode(response.body);
    final apiResponse = ApiResponse.fromJson(json);

    if (!apiResponse.success || apiResponse.data == null) {
      throw ApiError(
        400,
        'Error',
        apiResponse.error?.message ?? 'POST: $endpoint',
        apiResponse,
      );
    }
    if (fromJson != null) {
      return fromJson(apiResponse.data);
    }
    return apiResponse.data as T;
  }

  Future<T> put<T>(
    String endpoint, {
    dynamic data,
    RequestOptions options = const RequestOptions(),
    T Function(dynamic)? fromJson,
  }) async {
    final headers = _getHeaders(options);
    Object? body;
    if (data != null) {
      headers['Content-Type'] = 'application/json';
      body = jsonEncode(data);
    }

    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: body,
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      await handleApiError(response);
    }

    final json = jsonDecode(response.body);
    final apiResponse = ApiResponse.fromJson(json);

    if (!apiResponse.success || apiResponse.data == null) {
      throw ApiError(
        400,
        'Error',
        apiResponse.error?.message ?? 'PUT: $endpoint',
        apiResponse,
      );
    }
    if (fromJson != null) {
      return fromJson(apiResponse.data);
    }
    return apiResponse.data as T;
  }

  Future<T> delete<T>(
    String endpoint, {
    RequestOptions options = const RequestOptions(),
    T Function(dynamic)? fromJson,
  }) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: _getHeaders(options),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      await handleApiError(response);
    }

    final json = jsonDecode(response.body);
    final apiResponse = ApiResponse.fromJson(json);

    if (!apiResponse.success || apiResponse.data == null) {
      throw ApiError(
        400,
        'Error',
        apiResponse.error?.message ?? 'DELETE: $endpoint',
        apiResponse,
      );
    }
    if (fromJson != null) {
      return fromJson(apiResponse.data);
    }
    return apiResponse.data as T;
  }
}

// Riverpod provider for ApiClient (singleton per Ref)
final apiClientProvider = Provider<ApiClient>((ref) => ApiClient(ref));
