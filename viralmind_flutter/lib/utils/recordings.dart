import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Deletes a recording after confirmation (stub, needs platform/API implementation)
Future<List<dynamic>> deleteRecording(
  BuildContext context,
  String recordingId, {
  required Future<List<dynamic>> Function() refreshRecordings,
  required Future<void> Function(String) deleteRecordingApi,
}) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Delete Recording'),
      content: const Text(
        'Are you sure you want to delete this recording? This action cannot be undone.',
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => context.pop(true),
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          child: const Text('Delete'),
        ),
      ],
    ),
  );

  if (confirmed == true) {
    try {
      await deleteRecordingApi(recordingId);
      // Refresh recordings list
      return await refreshRecordings();
    } catch (error) {
      if (context.mounted) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Error'),
            content: Text('Recording deletion failed.\n$error'),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }
  return [];
}
