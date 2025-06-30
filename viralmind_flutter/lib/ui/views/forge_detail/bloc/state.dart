import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';

part 'state.freezed.dart';

enum ViewModeTasks {
  edit,
  preview,
}

@freezed
class ForgeDetailState with _$ForgeDetailState {
  const factory ForgeDetailState({
    @Default('') String gymName,
    @Default(1) double pricePerDemo,
    @Default(10) int uploadLimitValue,
    @Default('none') String uploadLimitType,
    @Default('') String alertEmail,
    @Default(TrainingPoolStatus.noFunds) TrainingPoolStatus? gymStatus,
    TrainingPool? pool,
    @Default(ViewModeTasks.edit) ViewModeTasks viewModeTasks,
    String? error,
    @Default(false) bool isUpdateGymStatusSuccess,
    @Default(false) bool isUpdatePoolSuccess,
    @Default(false) bool isRefreshBalanceSuccess,
    @Default(false) bool hasUnsavedChanges,
  }) = _ForgeDetailState;
  const ForgeDetailState._();
}
