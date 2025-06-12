import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/ui/views/training_session/bloc/state.dart';

part 'provider.g.dart';

@riverpod
class TrainingSessionNotifier extends _$TrainingSessionNotifier {
  TrainingSessionNotifier();

  @override
  TrainingSessionState build() => const TrainingSessionState();
}
