import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_referral_request.freezed.dart';
part 'create_referral_request.g.dart';

@freezed
class CreateReferralRequest with _$CreateReferralRequest {
  const factory CreateReferralRequest({
    required String walletAddress,
  }) = _CreateReferralRequest;

  factory CreateReferralRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReferralRequestFromJson(json);
}
