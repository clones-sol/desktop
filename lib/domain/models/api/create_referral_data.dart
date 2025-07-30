import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_referral_data.freezed.dart';
part 'create_referral_data.g.dart';

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