import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState({
    @Default(false) bool isLoading,
    @Default(false) bool awaitingCallback,
    String? error,
    String? lastSuccessfulTx,
    String? currentTransactionType,
    String? currentSessionId,
  }) = _TransactionState;

  factory TransactionState.fromJson(Map<String, dynamic> json) =>
      _$TransactionStateFromJson(json);
}
