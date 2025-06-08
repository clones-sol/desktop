import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:viralmind_flutter/application/connection_token.dart';
import 'package:viralmind_flutter/domain/models/api/api_error.dart';
import 'package:viralmind_flutter/domain/models/api/api_response.dart';
import 'package:viralmind_flutter/domain/models/api/request_options.dart';
import 'package:viralmind_flutter/utils/env.dart';
import 'package:viralmind_flutter/utils/errors.dart';

class ApiClient {
  ApiClient(this.ref, {String? baseUrl})
      : baseUrl = baseUrl ?? '${Env.apiUrl}/api/v1';
  final String baseUrl;
  final Ref ref;

  Future<Map<String, String>> _getHeaders(RequestOptions options) async {
    final headers = <String, String>{};
    if (options.headers != null) {
      headers.addAll(options.headers!);
    }
    if (options.requiresAuth) {
      final token =
          await ref.read(connectionTokenRepositoryProvider).loadToken();
      if (token != null && token.isNotEmpty) {
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

    final response = await http.get(uri, headers: await _getHeaders(options));

    if (response.statusCode < 200 || response.statusCode >= 300) {
      await handleApiError(response);
    }

    final json = jsonDecode(response.body);
    final apiResponse = ApiResponse.fromJson(json);

    if (!apiResponse.success || apiResponse.data == null) {
      throw ApiError(
        status: 400,
        statusText: 'Error',
        message: apiResponse.error?.message ?? 'GET: $endpoint',
        data: apiResponse,
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
    final headers = await _getHeaders(options);
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
        status: 400,
        statusText: 'Error',
        message: apiResponse.error?.message ?? 'POST: $endpoint',
        data: apiResponse,
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
    final headers = await _getHeaders(options);
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
        status: 400,
        statusText: 'Error',
        message: apiResponse.error?.message ?? 'PUT: $endpoint',
        data: apiResponse,
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
      headers: await _getHeaders(options),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      await handleApiError(response);
    }

    final json = jsonDecode(response.body);
    final apiResponse = ApiResponse.fromJson(json);

    if (!apiResponse.success || apiResponse.data == null) {
      throw ApiError(
        status: 400,
        statusText: 'Error',
        message: apiResponse.error?.message ?? 'DELETE: $endpoint',
        data: apiResponse,
      );
    }
    if (fromJson != null) {
      return fromJson(apiResponse.data);
    }
    return apiResponse.data as T;
  }
}

final apiClientProvider = Provider<ApiClient>(ApiClient.new);
