import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_api.freezed.dart';
part 'referral_api.g.dart';

@freezed
class CreateReferralRequest with _$CreateReferralRequest {
  const factory CreateReferralRequest({
    required String walletAddress,
  }) = _CreateReferralRequest;

  factory CreateReferralRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReferralRequestFromJson(json);
}

@freezed
class CreateReferralResponse with _$CreateReferralResponse {
  const factory CreateReferralResponse({
    required String referralCode,
    required String referralLink,
    required String walletAddress,
    required bool success,
    String? message,
  }) = _CreateReferralResponse;

  factory CreateReferralResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateReferralResponseFromJson(json);
}

@freezed
class GetReferralInfoResponse with _$GetReferralInfoResponse {
  const factory GetReferralInfoResponse({
    required String referralCode,
    required String referralLink,
    required String walletAddress,
    required int totalReferrals,
    required double totalRewards,
    required bool isActive,
    required DateTime createdAt,
    DateTime? lastUpdated,
    required bool success,
    String? message,
  }) = _GetReferralInfoResponse;

  factory GetReferralInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetReferralInfoResponseFromJson(json);
} 