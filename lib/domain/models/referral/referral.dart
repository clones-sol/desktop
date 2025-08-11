import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral.freezed.dart';
part 'referral.g.dart';

@freezed
class Referral with _$Referral {
  const factory Referral({
    required String referrerAddress,
    required String referreeAddress,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Referral;

  factory Referral.fromJson(Map<String, dynamic> json) =>
      _$ReferralFromJson(json);
}
