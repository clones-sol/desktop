import 'package:clones_desktop/domain/models/training_pool.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class ForgeState with _$ForgeState {
  const factory ForgeState({
    @Default(false) bool showFactoryDetail,
    @Default(false) bool showGenerateFactoryModal,
    TrainingPool? selectedPool,
  }) = _ForgeState;
  const ForgeState._();
}
