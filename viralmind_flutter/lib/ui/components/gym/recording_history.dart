import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:viralmind_flutter/application/recording.dart';
import 'package:viralmind_flutter/domain/models/recording/api_recording.dart';

class RecordingHistory extends ConsumerStatefulWidget {
  const RecordingHistory({super.key});

  @override
  ConsumerState<RecordingHistory> createState() => _RecordingHistoryState();
}

class _RecordingHistoryState extends ConsumerState<RecordingHistory> {
  String _searchQuery = '';
  String _sortOrder = 'newest';

  String _formatDuration(int seconds) {
    if (seconds == 0) return '0:00';
    final duration = Duration(seconds: seconds);
    final minutes = duration.inMinutes;
    final remainingSeconds = duration.inSeconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  double _getMaxReward(ApiRecording recording) {
    return (recording.quest?.reward?.maxReward ?? 0).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    final mergedRecordingsAsync = ref.watch(mergedRecordingsProvider);

    return Column(
      children: [
        _buildToolbar(),
        Expanded(
          child: mergedRecordingsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
            data: (recordings) {
              final filteredRecordings = _prepareRecordings(recordings);
              if (filteredRecordings.isEmpty) {
                return const Center(child: Text('No recordings found.'));
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filteredRecordings.length,
                itemBuilder: (context, index) {
                  return _buildRecordingTile(filteredRecordings[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  List<ApiRecording> _prepareRecordings(List<ApiRecording> recordings) {
    var preparedRecordings = List<ApiRecording>.from(recordings);

    // Filter
    if (_searchQuery.isNotEmpty) {
      preparedRecordings = preparedRecordings
          .where(
            (r) =>
                (r.title.toLowerCase().contains(_searchQuery.toLowerCase())) ||
                (r.description
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase())),
          )
          .toList();
    }

    // Sort
    preparedRecordings.sort((a, b) {
      if (_sortOrder == 'newest') {
        return DateTime.parse(b.timestamp)
            .compareTo(DateTime.parse(a.timestamp));
      } else {
        return DateTime.parse(a.timestamp)
            .compareTo(DateTime.parse(b.timestamp));
      }
    });

    return preparedRecordings;
  }

  Widget _buildToolbar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search recordings...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          const SizedBox(width: 16),
          DropdownButton<String>(
            value: _sortOrder,
            items: const [
              DropdownMenuItem(value: 'newest', child: Text('Newest First')),
              DropdownMenuItem(value: 'oldest', child: Text('Oldest First')),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() => _sortOrder = value);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecordingTile(ApiRecording recording) {
    final status = recording.submission?.meta.status ?? recording.status;
    final statusColor = _getStatusColor(status);
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: const Color(0xFF2d2d2d), // Equivalent to bg-gray-800
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Color(0xFF4a4a4a),
        ), // Equivalent to border-gray-700
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Top section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: recording.location == 'local'
                        ? Colors.blue.withValues(alpha: 0.2)
                        : Colors.green.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    recording.location == 'local'
                        ? Icons.folder_outlined
                        : Icons.cloud_outlined,
                    color: recording.location == 'local'
                        ? Colors.blue.shade300
                        : Colors.green.shade300,
                  ),
                ),
                const SizedBox(width: 16),
                // Title and Description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recording.title,
                        style: theme.textTheme.titleMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      Text(
                        recording.description.isNotEmpty
                            ? recording.description
                            : 'No description',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Status and Duration
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        status.toUpperCase(),
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatDuration(recording.durationSeconds),
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: Colors.grey.shade400),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: Color(0xFF4a4a4a)),
            const SizedBox(height: 8),
            // Footer section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: Color(0xFF888888),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      DateFormat.yMMMd()
                          .format(DateTime.parse(recording.timestamp)),
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: Colors.grey.shade400),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.access_time,
                      size: 14,
                      color: Color(0xFF888888),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      DateFormat.jm()
                          .format(DateTime.parse(recording.timestamp)),
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: Colors.grey.shade400),
                    ),
                  ],
                ),
                Row(
                  children: [
                    if (recording.submission?.reward != null &&
                        recording.submission!.reward! > 0)
                      Text(
                        '${recording.submission!.reward!.toStringAsFixed(2)} \$VIRAL',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(color: theme.colorScheme.primary),
                      )
                    else if (_getMaxReward(recording) > 0)
                      Text(
                        '${_getMaxReward(recording).toStringAsFixed(2)} \$VIRAL (unclaimed)',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(color: Colors.grey.shade500),
                      ),
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                      onSelected: (value) {/* Handle actions */},
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'upload',
                          child: Text('Upload'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'delete',
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
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
