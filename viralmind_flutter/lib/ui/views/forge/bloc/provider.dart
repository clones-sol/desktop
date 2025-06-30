import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/ui/views/forge/bloc/state.dart';

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
