import 'package:flutter/material.dart';

class RecordingPanel extends StatelessWidget {
  const RecordingPanel({
    super.key,
    required this.recordingId,
  });

  final String recordingId;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.video_camera_back),
        title: const Text('Recording'),
        subtitle: Text(recordingId),
      ),
    );
  }
}
