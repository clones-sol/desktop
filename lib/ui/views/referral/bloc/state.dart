import 'package:clones_desktop/domain/models/referral/referral_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class ReferralState with _$ReferralState {
  const factory ReferralState.initial() = Initial;
  const factory ReferralState.loading() = Loading;
  const factory ReferralState.success(
    ReferralInfo referralInfo, {
    @Default(false) bool showConfirmation,
  }) = Success;
  const factory ReferralState.error(String message) = Error;
} 