// Error handling for API requests
//
// This file provides error classes and utilities for API requests,
// migrated from src/lib/api/core/errors.ts.

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'errors.freezed.dart';
part 'errors.g.dart';

@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    required bool success,
    dynamic data,
    ApiErrorDetail? error,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}

@freezed
class ApiErrorDetail with _$ApiErrorDetail {
  const factory ApiErrorDetail({
    required ErrorCode code,
    required String message,
    Map<String, dynamic>? details,
  }) = _ApiErrorDetail;

  factory ApiErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorDetailFromJson(json);
}

@JsonEnum()
enum ErrorCode {
  // Client errors (4xx)
  @JsonValue('BAD_REQUEST')
  badRequest,
  @JsonValue('UNAUTHORIZED')
  unauthorized,
  @JsonValue('INVALID_WALLET_SIGNATURE')
  invalidWalletSignature,
  @JsonValue('FORBIDDEN')
  forbidden,
  @JsonValue('NOT_FOUND')
  notFound,
  @JsonValue('VALIDATION_ERROR')
  validationError,
  @JsonValue('RATE_LIMIT_EXCEEDED')
  rateLimitExceeded,
  @JsonValue('CONFLICT')
  conflict,
  @JsonValue('PAYMENT_REQUIRED')
  paymentRequired,
  @JsonValue('GONE')
  gone,

  // Server errors (5xx)
  @JsonValue('INTERNAL_SERVER_ERROR')
  internalServerError,
  @JsonValue('SERVICE_UNAVAILABLE')
  serviceUnavailable,

  // Domain-specific errors
  @JsonValue('INSUFFICIENT_FUNDS')
  insufficientFunds,
  @JsonValue('TRANSACTION_FAILED')
  transactionFailed,
  @JsonValue('CHALLENGE_EXPIRED')
  challengeExpired,
  @JsonValue('UPLOAD_INCOMPLETE')
  uploadIncomplete,
  @JsonValue('UNKNOWN_ERROR')
  unknownError,
}

/// Custom API error class
class ApiError implements Exception {
  final int status;
  final String statusText;
  final String message;
  final dynamic data;

  ApiError(this.status, this.statusText, this.message, [this.data]);

  @override
  String toString() =>
      'ApiError($status $statusText): $message${data != null ? '\n$data' : ''}';
}

/// Handles API errors consistently
Future<Never> handleApiError(http.Response response) async {
  ApiResponse? data;
  String errorMessage = '${response.statusCode} ${response.reasonPhrase}';

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
    response.statusCode,
    response.reasonPhrase ?? '',
    errorMessage,
    data,
  );
}

/// Utility to create a timeout error
ApiError createTimeoutError(int timeoutMs) {
  return ApiError(
    408,
    'Request Timeout',
    'Request timed out after ${timeoutMs}ms',
    {'timeoutMs': timeoutMs},
  );
}
