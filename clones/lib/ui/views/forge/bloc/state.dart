import 'package:clones/domain/models/training_pool.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class ForgeState with _$ForgeState {
  const factory ForgeState({
    @Default(false) bool showGymDetail,
    @Default(false) bool showGenerateGymModal,
    TrainingPool? selectedPool,
  }) = _ForgeState;
  const ForgeState._();
}
