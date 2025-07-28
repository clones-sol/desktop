import 'package:clones_desktop/domain/models/recording/api_recording.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

enum FactoryHistorySortOrder {
  newest,
  oldest,
}

@freezed
class FactoryHistoryState with _$FactoryHistoryState {
  const factory FactoryHistoryState({
    @Default([]) List<ApiRecording> recordings,
    @Default(FactoryHistorySortOrder.newest) FactoryHistorySortOrder sortOrder,
    @Default('') String searchQuery,
  }) = _FactoryHistoryState;
  const FactoryHistoryState._();
}
