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
    required bool success,
    required CreateReferralData data,
    String? message,
  }) = _CreateReferralResponse;

  factory CreateReferralResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateReferralResponseFromJson(json);
}

@freezed
class CreateReferralData with _$CreateReferralData {
  const factory CreateReferralData({
    required String referralCode,
    required String referralLink,
    required String walletAddress,
  }) = _CreateReferralData;

  factory CreateReferralData.fromJson(Map<String, dynamic> json) =>
      _$CreateReferralDataFromJson(json);
}

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

@freezed
class GetReferralInfoData with _$GetReferralInfoData {
  const factory GetReferralInfoData({
    required int totalReferrals,
    required double totalRewards,
    required String referralCode,
    required List<dynamic> referrals,
  }) = _GetReferralInfoData;

  factory GetReferralInfoData.fromJson(Map<String, dynamic> json) =>
      _$GetReferralInfoDataFromJson(json);
} 