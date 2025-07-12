import 'package:clones/assets.dart';
import 'package:clones/domain/models/quest/reward_info.dart';
import 'package:clones/domain/models/quest/quest_reward.dart';
import 'package:clones/domain/models/token.dart';
import 'package:clones/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones/ui/components/design_widget/text/app_text.dart';
import 'package:clones/ui/views/training_session/bloc/provider.dart';
import 'package:clones/ui/views/training_session/bloc/state.dart';
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
  final QuestReward? reward;
  final List<String> objectives;
  final Function(int fps) onStartRecording;
  final VoidCallback onComplete;
  final VoidCallback onGiveUp;

  @override
  ConsumerState<RecordPanel> createState() => _RecordPanelState();
}

class _RecordPanelState extends ConsumerState<RecordPanel> {
  final int _fps = 30;
  // final List<int> _fpsOptions = [24, 30, 60, 120];

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
            widget.reward != null
                ? Column(
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
                : Text(
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
        onTap: () => widget.onStartRecording(_fps),
        buttonText: 'Start Recording',
        isLoading: recordingLoading,
      );
    }
  }

/*  Widget _buildSettingsButton() {
    return PopupMenuButton<int>(
      onSelected: (int fps) {
        setState(() {
          _fps = fps;
        });
      },
      itemBuilder: (BuildContext context) {
        return _fpsOptions.map((int choice) {
          return PopupMenuItem<int>(
            value: choice,
            child: Text('$choice FPS'),
          );
        }).toList();
      },
      icon: const Icon(Icons.settings, color: Colors.white),
      tooltip: 'Recording Settings',
    );
  }*/
}
