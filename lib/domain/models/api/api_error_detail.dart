import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_detail.freezed.dart';
part 'api_error_detail.g.dart';

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
