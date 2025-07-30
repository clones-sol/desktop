import 'package:freezed_annotation/freezed_annotation.dart';
import 'create_referral_data.dart';

part 'create_referral_response.freezed.dart';
part 'create_referral_response.g.dart';

@freezed
class CreateReferralResponse with _$CreateReferralResponse {
  const factory CreateReferralResponse({
    required bool success,
    required CreateReferralData data,
    String? message,
  }) = _CreateReferralResponse;

  factory CreateReferralResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateReferralResponseFromJson(json);
} 