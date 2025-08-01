import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_info.freezed.dart';
part 'referral_info.g.dart';

@freezed
class ReferralInfo with _$ReferralInfo {
  const factory ReferralInfo({
    required String referralCode,
    required String referralLink,
    required String walletAddress,
    required int totalReferrals,
    required double totalRewards,
    required bool isActive,
    required DateTime createdAt,
    DateTime? lastUpdated,
  }) = _ReferralInfo;

  factory ReferralInfo.fromJson(Map<String, dynamic> json) =>
      _$ReferralInfoFromJson(json);
}
