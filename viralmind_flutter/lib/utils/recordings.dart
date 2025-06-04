// Recording utilities for Flutter
//
// Migrated from src/lib/utils/recordings.ts

import 'package:flutter/material.dart';

/// Deletes a recording after confirmation (stub, needs platform/API implementation)
Future<List<dynamic>> deleteRecording(
  BuildContext context,
  String recordingId, {
  required Future<List<dynamic>> Function() refreshRecordings,
  required Future<void> Function(String) deleteRecordingApi,
}) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder:
        (ctx) => AlertDialog(
          title: const Text('Delete Recording'),
          content: const Text(
            'Are you sure you want to delete this recording? This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(true),
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
        showDialog(
          context: context,
          builder:
              (ctx) => AlertDialog(
                title: const Text('Error'),
                content: Text('Recording deletion failed.\n$error'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
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
