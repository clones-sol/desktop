import 'package:clones_desktop/domain/models/recording/api_recording.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

enum GymHistorySortOrder {
  newest,
  oldest,
}

@freezed
class GymHistoryState with _$GymHistoryState {
  const factory GymHistoryState({
    @Default([]) List<ApiRecording> recordings,
    @Default(GymHistorySortOrder.newest) GymHistorySortOrder sortOrder,
    @Default('') String searchQuery,
  }) = _GymHistoryState;
  const GymHistoryState._();
}
