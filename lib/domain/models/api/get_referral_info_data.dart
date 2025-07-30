import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_referral_info_data.freezed.dart';
part 'get_referral_info_data.g.dart';

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