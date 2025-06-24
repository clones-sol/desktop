import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/application/recording.dart';
import 'package:viralmind_flutter/application/tauri_api.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/recording/api_recording.dart';
import 'package:viralmind_flutter/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/components/design_widget/message_box/message_box.dart';
import 'package:viralmind_flutter/ui/views/gym_history/layouts/components/recording_card.dart';

class GymHistoryView extends ConsumerStatefulWidget {
  const GymHistoryView({super.key});

  static const String routeName = '/gym_history';

  @override
  ConsumerState<GymHistoryView> createState() => _GymHistoryViewState();
}

class _GymHistoryViewState extends ConsumerState<GymHistoryView> {
  String _searchQuery = '';
  String _sortOrder = 'newest';

  @override
  Widget build(BuildContext context) {
    final mergedRecordings = ref.watch(mergedRecordingsProvider).valueOrNull;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gym History',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5,
                  color: VMColors.secondaryText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          _buildToolbar(),
          _builList(mergedRecordings ?? []),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BtnPrimary(
                onTap: () =>
                    ref.read(tauriApiClientProvider).openRecordingsFolder(),
                buttonText: 'Open Recordings Folder',
                btnPrimaryType: BtnPrimaryType.outlinePrimary,
              ),
              const SizedBox(width: 10),
              // TODO(reddwarf03): Bugs with Tauri: thread 'tokio-runtime-worker' has overflowed its stack
              if (mergedRecordings != null && mergedRecordings.isNotEmpty)
                BtnPrimary(
                  onTap: () =>
                      ref.read(tauriApiClientProvider).exportRecordings(),
                  buttonText: 'Export Recordings',
                  btnPrimaryType: BtnPrimaryType.outlinePrimary,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _builList(List<ApiRecording> recordings) {
    final filteredRecordings = _prepareRecordings(recordings);
    if (filteredRecordings.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: MessageBox(
                messageBoxType: MessageBoxType.info,
                content: Text(
                  'No recordings found.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: filteredRecordings.length,
        itemBuilder: (context, index) {
          return RecordingCard(recording: filteredRecordings[index]);
        },
      ),
    );
  }

  List<ApiRecording> _prepareRecordings(List<ApiRecording> recordings) {
    var preparedRecordings = List<ApiRecording>.from(recordings);

    if (_searchQuery.isNotEmpty) {
      preparedRecordings = preparedRecordings
          .where(
            (r) =>
                (r.title.toLowerCase().contains(_searchQuery.toLowerCase())) ||
                (r.description
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase())),
          )
          .toList();
    }

    // Sort
    preparedRecordings.sort((a, b) {
      if (_sortOrder == 'newest') {
        return DateTime.parse(b.timestamp)
            .compareTo(DateTime.parse(a.timestamp));
      } else {
        return DateTime.parse(a.timestamp)
            .compareTo(DateTime.parse(b.timestamp));
      }
    });

    return preparedRecordings;
  }

  Widget _buildToolbar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search recordings',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 6),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      width: 0.5,
                    ),
                    gradient: VMColors.gradientInputFormBackground,
                  ),
                  child: TextField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    onChanged: (value) => setState(() => _searchQuery = value),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      hintText: 'Gym name',
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sort by',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 6),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      width: 0.5,
                    ),
                    gradient: VMColors.gradientInputFormBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      value: _sortOrder,
                      isExpanded: true,
                      underline: const SizedBox(),
                      dropdownColor: Colors.black.withValues(alpha: 0.9),
                      style: Theme.of(context).textTheme.bodyMedium,
                      items: [
                        DropdownMenuItem(
                            value: 'newest',
                            child: Text(
                              'Newest First',
                              style: Theme.of(context).textTheme.bodyMedium,
                            )),
                        DropdownMenuItem(
                          value: 'oldest',
                          child: Text(
                            'Oldest First',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                      onChanged: (val) {
                        if (val != null) {
                          setState(() => _sortOrder = val);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
