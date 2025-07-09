import 'package:clones/utils/format_time.dart';
import 'package:flutter/material.dart';

// TODO(reddwarf03): Doublon?
enum RecordingState {
  off,
  starting,
  recording,
  saving,
  saved,
  stopped,
  stopping
}

class RecordingBadge extends StatelessWidget {
  const RecordingBadge({
    super.key,
    this.state = RecordingState.off,
    this.time = 0,
  });
  final RecordingState state;
  final int time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: state == RecordingState.recording
                ? Colors.red.shade600
                : Colors.grey.shade600,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            state == RecordingState.recording
                ? 'Recording'
                : state == RecordingState.stopping
                    ? 'Saving...'
                    : '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if (state != RecordingState.stopped)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              formatTime(time),
              style: const TextStyle(
                color: Colors.redAccent,
                fontFamily: 'monospace',
              ),
            ),
          ),
      ],
    );
  }
}
