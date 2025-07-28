import 'package:clones_desktop/domain/models/training_pool.dart';
import 'package:clones_desktop/ui/views/forge/bloc/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class ForgeNotifier extends _$ForgeNotifier {
  ForgeNotifier();

  @override
  ForgeState build() {
    return const ForgeState();
  }

  void setShowFactoryDetail(bool show) {
    state = state.copyWith(showFactoryDetail: show);
  }

  void setSelectedPool(TrainingPool? pool) {
    state = state.copyWith(selectedPool: pool);
  }

  void setShowGenerateFactoryModal(bool show) {
    state = state.copyWith(showGenerateFactoryModal: show);
  }
}
