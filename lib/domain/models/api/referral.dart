import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral.freezed.dart';
part 'referral.g.dart';

@freezed
class Referral with _$Referral {
  const factory Referral({
    required String referrerAddress,
    required String referreeAddress,
    required String referralCode,
    required String referralLink,
    required String firstActionType,
    Map<String, dynamic>? firstActionData,
    String? onChainTxHash,
    int? onChainSlot,
    @Default(0) double rewardAmount,
    @Default(false) bool rewardProcessed,
    @Default('pending') String status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Referral;

  factory Referral.fromJson(Map<String, dynamic> json) =>
      _$ReferralFromJson(json);
} 