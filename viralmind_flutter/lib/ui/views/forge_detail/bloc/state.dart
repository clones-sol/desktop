import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';

part 'state.freezed.dart';

@freezed
class ForgeDetailState with _$ForgeDetailState {
  const factory ForgeDetailState({
    TrainingPool? pool,
  }) = _ForgeDetailState;
  const ForgeDetailState._();
}
