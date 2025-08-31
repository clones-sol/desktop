import 'package:clones_desktop/domain/models/factory/factory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class ForgeState with _$ForgeState {
  const factory ForgeState({
    @Default(false) bool showFactoryDetail,
    @Default(false) bool showGenerateFactoryModal,
    Factory? selectedFactory,
  }) = _ForgeState;
  const ForgeState._();
}
