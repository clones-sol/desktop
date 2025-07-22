import 'package:clones_desktop/domain/models/quest/quest.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/components/design_widget/text/app_text.dart';
import 'package:clones_desktop/ui/views/record_overlay/bloc/provider.dart';
import 'package:clones_desktop/ui/views/training_session/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordOverlayObjectives extends ConsumerWidget {
  const RecordOverlayObjectives({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordOverlay = ref.watch(recordOverlayNotifierProvider);

    if (recordOverlay.isCollapsed) {
      return const SizedBox.shrink();
    }

    final demo = recordOverlay.demo;

    return Opacity(
      opacity: recordOverlay.focused ? 1.0 : 0.7,
      child: Column(
        children: [
          if (demo != null) _buildQuestDetails(demo, context),
          if (demo == null)
            const Padding(
              padding: EdgeInsets.all(8),
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
          _buildControls(ref),
        ],
      ),
    );
  }

  Widget _buildQuestDetails(Quest quest, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(quest.title, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 8),
          if (quest.objectives.isNotEmpty)
            SizedBox(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: quest.objectives.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• ',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Expanded(
                          child: AppText(
                            text: quest.objectives[index],
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildControls(WidgetRef ref) {
    final recordOverlay = ref.watch(recordOverlayNotifierProvider);
    final recordingState = recordOverlay.recordingState;

    return Row(
      children: [
        if (recordingState == RecordingState.recording)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BtnPrimary(
                widthExpanded: true,
                buttonText: 'Stop',
                onTap:
                    ref.read(recordOverlayNotifierProvider.notifier).handleStop,
              ),
            ),
          ),
        if (recordingState == RecordingState.starting ||
            recordingState == RecordingState.stopping)
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
