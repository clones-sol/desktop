import 'package:clones/ui/views/record_overlay/bloc/provider.dart';
import 'package:clones/ui/views/training_session/bloc/state.dart';
import 'package:clones/utils/format_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordOverlayHeader extends ConsumerWidget {
  const RecordOverlayHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordOverlay = ref.watch(recordOverlayNotifierProvider);
    String statusText;
    Color statusColor;

    switch (recordOverlay.recordingState) {
      case RecordingState.starting:
        statusText = 'Starting';
        statusColor = Colors.red;
        break;
      case RecordingState.recording:
        statusText = 'Recording';
        statusColor = Colors.red;
        break;
      case RecordingState.stopping:
        statusText = 'Stopping';
        statusColor = Colors.green;
        break;
      case RecordingState.off:
        statusText = 'Stopped';
        statusColor = Colors.grey;
        break;
      case RecordingState.saved:
        statusText = 'Saved';
        statusColor = Colors.green;
    }

    return Opacity(
      opacity: recordOverlay.focused ? 1.0 : 0.7,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              statusText,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const Spacer(),
            Text(
              formatTimeWithHours(recordOverlay.seconds),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(width: 8),
            _buildIconButton(
              recordOverlay.isCollapsed
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              ref.read(recordOverlayNotifierProvider.notifier).toggleCollapsed,
            ),
            _buildIconButton(
              recordOverlay.isLocked ? Icons.lock : Icons.lock_open,
              ref.read(recordOverlayNotifierProvider.notifier).toggleLocked,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: 24,
      height: 24,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, color: Colors.white, size: 18),
        onPressed: onPressed,
      ),
    );
  }
}
