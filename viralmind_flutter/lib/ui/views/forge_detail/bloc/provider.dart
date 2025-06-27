import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/bloc/state.dart';

part 'provider.g.dart';

@riverpod
class ForgeDetailNotifier extends _$ForgeDetailNotifier {
  ForgeDetailNotifier();

  @override
  ForgeDetailState build() {
    return const ForgeDetailState();
  }

  void setPool(TrainingPool pool) {
    state = state.copyWith(pool: pool);
  }

  Future<void> save() async {}
}
