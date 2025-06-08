import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/api/api_error_detail.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

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
