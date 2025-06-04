// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl _$$ApiResponseImplFromJson(Map<String, dynamic> json) =>
    _$ApiResponseImpl(
      success: json['success'] as bool,
      data: json['data'],
      error:
          json['error'] == null
              ? null
              : ApiErrorDetail.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApiResponseImplToJson(_$ApiResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

_$ApiErrorDetailImpl _$$ApiErrorDetailImplFromJson(Map<String, dynamic> json) =>
    _$ApiErrorDetailImpl(
      code: $enumDecode(_$ErrorCodeEnumMap, json['code']),
      message: json['message'] as String,
      details: json['details'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ApiErrorDetailImplToJson(
  _$ApiErrorDetailImpl instance,
) => <String, dynamic>{
  'code': _$ErrorCodeEnumMap[instance.code]!,
  'message': instance.message,
  'details': instance.details,
};

const _$ErrorCodeEnumMap = {
  ErrorCode.badRequest: 'BAD_REQUEST',
  ErrorCode.unauthorized: 'UNAUTHORIZED',
  ErrorCode.invalidWalletSignature: 'INVALID_WALLET_SIGNATURE',
  ErrorCode.forbidden: 'FORBIDDEN',
  ErrorCode.notFound: 'NOT_FOUND',
  ErrorCode.validationError: 'VALIDATION_ERROR',
  ErrorCode.rateLimitExceeded: 'RATE_LIMIT_EXCEEDED',
  ErrorCode.conflict: 'CONFLICT',
  ErrorCode.paymentRequired: 'PAYMENT_REQUIRED',
  ErrorCode.gone: 'GONE',
  ErrorCode.internalServerError: 'INTERNAL_SERVER_ERROR',
  ErrorCode.serviceUnavailable: 'SERVICE_UNAVAILABLE',
  ErrorCode.insufficientFunds: 'INSUFFICIENT_FUNDS',
  ErrorCode.transactionFailed: 'TRANSACTION_FAILED',
  ErrorCode.challengeExpired: 'CHALLENGE_EXPIRED',
  ErrorCode.uploadIncomplete: 'UPLOAD_INCOMPLETE',
  ErrorCode.unknownError: 'UNKNOWN_ERROR',
};
