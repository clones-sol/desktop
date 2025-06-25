import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:viralmind_flutter/application/recording.dart';
import 'package:viralmind_flutter/application/tauri_api.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/recording/api_recording.dart';
import 'package:viralmind_flutter/ui/components/card.dart';
import 'package:viralmind_flutter/ui/components/design_widget/dialog/dialog.dart';
import 'package:viralmind_flutter/utils/format_time.dart';

class RecordingCard extends ConsumerWidget {
  const RecordingCard({super.key, required this.recording});

  final ApiRecording recording;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = recording.submission?.meta.status ?? recording.status;
    final statusColor = _getStatusColor(status);
    final theme = Theme.of(context);

    final maxReward = recording.quest?.reward?.maxReward ?? 0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CardWidget(
        padding: CardPadding.none,
        variant: CardVariant.secondary,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              recording.quest?.iconUrl ?? '',
                              width: 20,
                              height: 20,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                Icons.web,
                                size: 20,
                                color: VMColors.primaryText,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              recording.title,
                              style: theme.textTheme.titleMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Text(
                          recording.description.isNotEmpty
                              ? recording.description
                              : 'No description',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: statusColor,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: statusColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              status.toUpperCase(),
                              style: TextStyle(
                                color: statusColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: VMColors.secondaryText,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        DateFormat.yMMMd()
                            .format(DateTime.parse(recording.timestamp)),
                        style: theme.textTheme.bodySmall,
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: VMColors.secondaryText,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        DateFormat.jm()
                            .format(DateTime.parse(recording.timestamp)),
                        style: theme.textTheme.bodySmall,
                      ),
                      const SizedBox(width: 16),
                      if (recording.location == 'local')
                        Row(
                          children: [
                            Icon(
                              Icons.folder_outlined,
                              size: 14,
                              color: VMColors.secondaryText,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Local',
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        )
                      else
                        Row(
                          children: [
                            Icon(
                              Icons.cloud_outlined,
                              size: 14,
                              color: VMColors.secondaryText,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Cloud',
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: VMColors.secondaryText,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Duration: ${formatDuration(recording.durationSeconds)}',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      PopupMenuButton<String>(
                        color: Colors.black.withValues(alpha: 0.9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: Colors.black.withValues(alpha: 0.9),
                        icon: Icon(
                          Icons.more_vert,
                          color: VMColors.secondaryText,
                          size: 20,
                        ),
                        onSelected: (value) {
                          // TODO(reddwarf03): add actions
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'upload',
                            child: Text(
                              'Upload',
                              style: theme.textTheme.bodySmall,
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'Export Zip',
                            child: Text(
                              'Export Zip',
                              style: theme.textTheme.bodySmall,
                            ),
                            onTap: () async {
                              try {
                                final zipData = await ref
                                    .read(tauriApiClientProvider)
                                    .getRecordingZip(recording.id);
                                final outputFile =
                                    await FilePicker.platform.saveFile(
                                  dialogTitle: 'Please select an output file:',
                                  fileName: 'recording_${recording.id}.zip',
                                );

                                if (outputFile != null) {
                                  final file = File(outputFile);
                                  await file.writeAsBytes(zipData);
                                }
                                // TODO(reddwarf03): maybe add a toast
                              } catch (e) {
                                // TODO(reddwarf03): maybe add a toast
                              }
                            },
                          ),
                          PopupMenuItem<String>(
                            value: 'delete',
                            child: Text(
                              'Delete',
                              style: theme.textTheme.bodySmall,
                            ),
                            onTap: () async {
                              await AppDialogs.showConfirmDialog(
                                context,
                                ref,
                                'Confirm Deletion',
                                'Are you sure you want to delete this recording?',
                                'Delete',
                                () async {
                                  await ref
                                      .read(tauriApiClientProvider)
                                      .deleteRecording(recording.id);
                                  ref.invalidate(mergedRecordingsProvider);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  if (recording.submission?.reward != null &&
                      recording.submission!.reward! > 0)
                    Text(
                      '${recording.submission!.reward!.toStringAsFixed(2)} \$VIRAL',
                      style: theme.textTheme.bodySmall,
                    )
                  else if (maxReward > 0)
                    Text(
                      '${maxReward.toStringAsFixed(2)} \$VIRAL (unclaimed)',
                      style: theme.textTheme.bodySmall,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'failed':
      case 'error':
        return Colors.red;
      case 'processing':
      case 'zipping':
      case 'uploading':
        return Colors.orange;
      case 'pending':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
