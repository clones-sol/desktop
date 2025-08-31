import 'package:clones_desktop/domain/models/factory/factory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class FactoryFundsModalState with _$FactoryFundsModalState {
  const factory FactoryFundsModalState({
    Factory? factory,
    @Default(false) bool isShown,
    @Default('') String fundingAmount,
    @Default(false) bool isLoading,
    @Default(false) bool isFunding,
    String? estimatedGasCost,
    String? error,
    @Default(false) bool gasExceedsReward,
  }) = _FactoryFundsModalState;
  const FactoryFundsModalState._();
}
