import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/domain/models/demonstration/demonstration_reward.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/components/design_widget/text/app_text.dart';
import 'package:clones_desktop/ui/views/training_session/bloc/provider.dart';
import 'package:clones_desktop/ui/views/training_session/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordPanel extends ConsumerStatefulWidget {
  const RecordPanel({
    super.key,
    required this.title,
    this.reward,
    required this.objectives,
    required this.onStartRecording,
    required this.onComplete,
    required this.onGiveUp,
  });

  final String title;
  final DemonstrationReward? reward;
  final List<String> objectives;
  final Function() onStartRecording;
  final VoidCallback onComplete;
  final VoidCallback onGiveUp;

  @override
  ConsumerState<RecordPanel> createState() => _RecordPanelState();
}

class _RecordPanelState extends ConsumerState<RecordPanel> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(trainingSessionNotifierProvider);
    final recordingState = state.recordingState;
    final recordingLoading = state.recordingLoading;

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: widget.reward != null ? 100 : 0),
              child: Text(
                widget.title,
                style: theme.textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 10),
            if (widget.reward != null)
              Column(
                children: [
                  Text(
                    'Complete the task to get a reward.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Up to: ${widget.reward?.maxReward ?? 0} Tokens',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: VMColors.secondary,
                    ),
                  ),
                ],
              )
            else
              Text(
                'Complete the task to get a reward.',
                style: theme.textTheme.bodyMedium,
              ),
            const SizedBox(height: 10),
            Text(
              'Your Objectives:',
              style: theme.textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            ...widget.objectives.map(
              (obj) => Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• ',
                      style: theme.textTheme.bodyMedium,
                    ),
                    Expanded(
                      child: AppText(
                        text: obj,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildActionButtons(recordingState, recordingLoading),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons(
    RecordingState recordingState,
    bool recordingLoading,
  ) {
    if (recordingState == RecordingState.recording) {
      return Row(
        children: [
          BtnPrimary(
            onTap: widget.onGiveUp,
            btnPrimaryType: BtnPrimaryType.outlinePrimary,
            buttonText: 'Give Up',
          ),
          const SizedBox(width: 10),
          BtnPrimary(
            onTap: widget.onComplete,
            buttonText: 'Complete',
          ),
        ],
      );
    } else {
      return BtnPrimary(
        onTap: () => widget.onStartRecording(),
        buttonText: 'Start Recording',
        isLoading: recordingLoading,
      );
    }
  }
}
