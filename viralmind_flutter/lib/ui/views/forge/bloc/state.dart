import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';

part 'state.freezed.dart';

@freezed
class ForgeState with _$ForgeState {
  const factory ForgeState({
    @Default(false) bool showGymDetail,
    TrainingPool? selectedPool,
  }) = _ForgeState;
  const ForgeState._();
}
