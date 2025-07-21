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

  void setShowGymDetail(bool show) {
    state = state.copyWith(showGymDetail: show);
  }

  void setSelectedPool(TrainingPool? pool) {
    state = state.copyWith(selectedPool: pool);
  }

  void setShowGenerateGymModal(bool show) {
    state = state.copyWith(showGenerateGymModal: show);
  }
}
