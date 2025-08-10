import 'package:clones_desktop/domain/models/referral/referral.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_referral_info_response.freezed.dart';
part 'get_referral_info_response.g.dart';

@freezed
class GetReferralInfoResponse with _$GetReferralInfoResponse {
  const factory GetReferralInfoResponse({
    required String walletAddress,
    required String referralCode,
    required bool isActive,
    required int totalReferrals,
    required double totalRewards,
    required DateTime createdAt,
    required DateTime lastUpdated,
    required DateTime expiresAt,
    required List<Referral> referrals,
  }) = _GetReferralInfoResponse;

  factory GetReferralInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetReferralInfoResponseFromJson(json);
}
