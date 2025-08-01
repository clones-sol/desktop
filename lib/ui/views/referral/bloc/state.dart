import 'package:clones_desktop/domain/models/referral/referral_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class ReferralState with _$ReferralState {
  const factory ReferralState({
    ReferralInfo? referralInfo,
    @Default(false) bool showConfirmation,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _ReferralState;
  const ReferralState._();
}
