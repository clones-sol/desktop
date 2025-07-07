import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/application/session/provider.dart';
import 'package:viralmind_flutter/application/tauri_api.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/components/design_widget/message_box/message_box.dart';
import 'package:viralmind_flutter/ui/components/wallet_not_connected.dart';
import 'package:viralmind_flutter/ui/views/gym_history/bloc/provider.dart';
import 'package:viralmind_flutter/ui/views/gym_history/bloc/state.dart';
import 'package:viralmind_flutter/ui/views/gym_history/layouts/components/recording_card.dart';

class GymHistoryView extends ConsumerWidget {
  const GymHistoryView({super.key});

  static const String routeName = '/history-gym';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionNotifierProvider);
    if (session.isConnected == false) {
      return const WalletNotConnected();
    }

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 30),
          _buildToolbar(context, ref),
          _buildList(context, ref),
          const SizedBox(height: 10),
          _buildFooter(context, ref),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
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
    );
  }

  Widget _buildFooter(BuildContext context, WidgetRef ref) {
    final gymHistory = ref.watch(gymHistoryNotifierProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BtnPrimary(
          onTap: () => ref.read(tauriApiClientProvider).openRecordingsFolder(),
          buttonText: 'Open Recordings Folder',
          btnPrimaryType: BtnPrimaryType.outlinePrimary,
        ),
        const SizedBox(width: 10),
        if (gymHistory.recordings.isNotEmpty)
          BtnPrimary(
            onTap: () => ref.read(tauriApiClientProvider).exportRecordings(),
            buttonText: 'Export Recordings',
            btnPrimaryType: BtnPrimaryType.outlinePrimary,
          ),
      ],
    );
  }

  Widget _buildList(BuildContext context, WidgetRef ref) {
    final gymHistory = ref.watch(gymHistoryNotifierProvider);

    if (gymHistory.recordings.isEmpty) {
      return const Expanded(
        child: Center(
          child: MessageBox(
            messageBoxType: MessageBoxType.info,
            content: Text('No recordings found.'),
          ),
        ),
      );
    }
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: gymHistory.recordings.length,
        itemBuilder: (context, index) {
          return RecordingCard(recording: gymHistory.recordings[index]);
        },
      ),
    );
  }

  Widget _buildToolbar(BuildContext context, WidgetRef ref) {
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
                    onChanged: (value) => ref
                        .read(gymHistoryNotifierProvider.notifier)
                        .setSearchQuery(value),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                      hintText: 'Gym name',
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.color!
                                    .withValues(alpha: 0.2),
                              ),
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
                      value:
                          ref.watch(gymHistoryNotifierProvider).sortOrder.name,
                      isExpanded: true,
                      underline: const SizedBox(),
                      dropdownColor: Colors.black.withValues(alpha: 0.9),
                      style: Theme.of(context).textTheme.bodyMedium,
                      items: [
                        DropdownMenuItem(
                          value: GymHistorySortOrder.newest.name,
                          child: Text(
                            'Newest First',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        DropdownMenuItem(
                          value: GymHistorySortOrder.oldest.name,
                          child: Text(
                            'Oldest First',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                      onChanged: (val) {
                        if (val != null) {
                          ref
                              .read(gymHistoryNotifierProvider.notifier)
                              .setSortOrder(
                                GymHistorySortOrder.values.byName(val),
                              );
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
