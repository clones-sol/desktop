import 'package:clones_desktop/application/recording.dart';
import 'package:clones_desktop/domain/models/recording/api_recording.dart';
import 'package:clones_desktop/ui/views/gym_history/bloc/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class GymHistoryNotifier extends _$GymHistoryNotifier {
  GymHistoryNotifier();

  @override
  GymHistoryState build() {
    final mergedRecordings =
        ref.watch(mergedRecordingsProvider).valueOrNull ?? [];

    final preparedRecordings = List<ApiRecording>.from(mergedRecordings)
      ..sort((a, b) {
        return DateTime.parse(b.timestamp)
            .compareTo(DateTime.parse(a.timestamp));
      });

    return GymHistoryState(recordings: preparedRecordings);
  }

  void setSortOrder(GymHistorySortOrder sortOrder) {
    state = state.copyWith(sortOrder: sortOrder);
    sortRecordings();
  }

  void setSearchQuery(String searchQuery) {
    state = state.copyWith(searchQuery: searchQuery);
    final preparedRecordings = state.recordings
        .where(
          (r) =>
              (r.title.toLowerCase().contains(searchQuery.toLowerCase())) ||
              (r.description.toLowerCase().contains(searchQuery.toLowerCase())),
        )
        .toList();
    setRecordings(preparedRecordings);
    sortRecordings();
  }

  void setRecordings(List<ApiRecording> recordings) {
    state = state.copyWith(recordings: recordings);
  }

  void sortRecordings() {
    final preparedRecordings = List<ApiRecording>.from(state.recordings)
      ..sort((a, b) {
        if (state.sortOrder == GymHistorySortOrder.newest) {
          return DateTime.parse(b.timestamp)
              .compareTo(DateTime.parse(a.timestamp));
        } else {
          return DateTime.parse(a.timestamp)
              .compareTo(DateTime.parse(b.timestamp));
        }
      });
    setRecordings(preparedRecordings);
  }
}
