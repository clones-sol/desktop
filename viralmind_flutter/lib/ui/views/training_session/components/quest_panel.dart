import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/domain/models/quest/quest_reward.dart';
import 'package:viralmind_flutter/ui/components/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/views/training_session/bloc/provider.dart';
import 'package:viralmind_flutter/ui/views/training_session/bloc/state.dart';

class QuestPanel extends ConsumerStatefulWidget {
  const QuestPanel({
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
  ConsumerState<QuestPanel> createState() => _QuestPanelState();
}

class _QuestPanelState extends ConsumerState<QuestPanel> {
  final int _fps = 30;
  // final List<int> _fpsOptions = [24, 30, 60, 120];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(trainingSessionNotifierProvider);
    final recordingState = state.recordingState;
    final recordingLoading = state.recordingLoading;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900]?.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(right: widget.reward != null ? 100 : 0),
                child: Text(
                  widget.title,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Objectives:',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              ...widget.objectives.map(
                (obj) => Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '• ',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      Expanded(
                        child: Text(
                          obj,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            height: 1.5,
                          ),
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
          if (widget.reward != null)
            Positioned(
              top: 0,
              right: 0,
              child: _buildReward(widget.reward!),
            ),
        ],
      ),
    );
  }

  Widget _buildReward(QuestReward reward) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Up to',
          style: TextStyle(
            fontSize: 10,
            color: Colors.greenAccent.withValues(alpha: 0.8),
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 2),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '${reward.maxReward} VIRAL',
            style: const TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
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
          Expanded(
            child: BtnPrimary(
              onTap: widget.onGiveUp,
              btnPrimaryType: BtnPrimaryType.outlinePrimary,
              buttonText: 'Give Up',
              icon: Icons.close,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: BtnPrimary(
              onTap: widget.onComplete,
              buttonText: 'Complete',
              icon: Icons.check,
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          /* Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (recordingState != RecordingState.recording)
              _buildSettingsButton(),
            ],
          ),
          const SizedBox(height: 10),*/
          BtnPrimary(
            onTap: () => widget.onStartRecording(_fps),
            buttonText: 'Start Recording',
            isLoading: recordingLoading,
          ),
        ],
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
