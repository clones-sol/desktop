import 'package:clones_desktop/domain/models/referral/referral.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_referral_info_response.freezed.dart';
part 'get_referral_info_response.g.dart';

@freezed
class GetReferralInfoResponse with _$GetReferralInfoResponse {
  const factory GetReferralInfoResponse({
    required int totalReferrals,
    required double totalRewards,
    required String referralCode,
    required List<Referral> referrals,
  }) = _GetReferralInfoResponse;

  factory GetReferralInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetReferralInfoResponseFromJson(json);
}
