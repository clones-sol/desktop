import 'package:freezed_annotation/freezed_annotation.dart';
import 'get_referral_info_data.dart';

part 'get_referral_info_response.freezed.dart';
part 'get_referral_info_response.g.dart';

@freezed
class GetReferralInfoResponse with _$GetReferralInfoResponse {
  const factory GetReferralInfoResponse({
    required bool success,
    required GetReferralInfoData data,
    String? message,
  }) = _GetReferralInfoResponse;

  factory GetReferralInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetReferralInfoResponseFromJson(json);
} 