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

  void setPool(TrainingPool pool) {
    state = state.copyWith(pool: pool);
  }

  Future<void> save() async {}
}
