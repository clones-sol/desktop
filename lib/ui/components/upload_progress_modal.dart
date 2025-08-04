import 'dart:async';
import 'dart:ui';

import 'package:clones_desktop/application/upload/provider.dart';
import 'package:clones_desktop/application/upload/state.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String formatFileSize(int? bytes) {
  if (bytes == null) return '0 B';
  const units = ['B', 'KB', 'MB', 'GB', 'TB'];
  var size = bytes.toDouble();
  var unitIndex = 0;

  while (size >= 1024 && unitIndex < units.length - 1) {
    size /= 1024;
    unitIndex++;
  }

  return '${size.toStringAsFixed(1)} ${units[unitIndex]}';
}

String formatDuration(Duration duration) {
  final hours = duration.inHours;
  final minutes = duration.inMinutes % 60;
  final seconds = duration.inSeconds % 60;

  if (hours > 0) {
    return '${hours}h ${minutes}m';
  } else if (minutes > 0) {
    return '${minutes}m ${seconds}s';
  } else {
    return '${seconds}s';
  }
}

IconData getStatusIcon(UploadStatus status) {
  switch (status) {
    case UploadStatus.done:
      return Icons.check_circle;
    case UploadStatus.error:
      return Icons.error;
    case UploadStatus.idle:
      return Icons.pending;
    case UploadStatus.uploading:
      return Icons.cloud_upload;
    case UploadStatus.zipping:
      return Icons.archive;
    case UploadStatus.processing:
      return Icons.hourglass_empty;
  }
}

Color getStatusColor(UploadStatus status, BuildContext context) {
  switch (status) {
    case UploadStatus.done:
      return Colors.green[500]!;
    case UploadStatus.error:
      return Colors.red[500]!;
    case UploadStatus.processing:
    case UploadStatus.uploading:
    case UploadStatus.zipping:
      return Colors.orange[500]!;
    case UploadStatus.idle:
      return Colors.grey[500]!;
  }
}

String getStatusMessage(UploadTaskState task) {
  switch (task.uploadStatus) {
    case UploadStatus.idle:
      return 'Queued for upload';
    case UploadStatus.zipping:
      return 'Preparing recording...';
    case UploadStatus.uploading:
      return 'Uploading to server...';
    case UploadStatus.processing:
      return 'Processing upload...';
    case UploadStatus.done:
      return 'Upload completed successfully';
    case UploadStatus.error:
      return task.error ?? 'Upload failed';
  }
}

class UploadProgressModal extends ConsumerStatefulWidget {
  const UploadProgressModal({super.key});

  @override
  ConsumerState<UploadProgressModal> createState() =>
      _UploadProgressModalState();
}

class _UploadProgressModalState extends ConsumerState<UploadProgressModal>
    with SingleTickerProviderStateMixin {
  Timer? _progressTimer;
  late AnimationController _animationController;
  late Animation<double> _animation;

  final Map<String, DateTime> _uploadStartTimes = {};
  final Map<String, double> _uploadSpeeds = {}; // bytes per second

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();

    // Start a timer to update upload speeds and ETAs
    _progressTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateUploadMetrics();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _progressTimer?.cancel();
    super.dispose();
  }

  void _updateUploadMetrics() {
    final queueItems = ref.read(uploadQueueProvider);
    final now = DateTime.now();

    for (final entry in queueItems.entries) {
      final recordingId = entry.key;
      final task = entry.value;

      // Track upload start times
      if (task.uploadStatus == UploadStatus.uploading &&
          !_uploadStartTimes.containsKey(recordingId)) {
        _uploadStartTimes[recordingId] = now;
      }

      // Calculate upload speed
      if (task.uploadStatus == UploadStatus.uploading &&
          _uploadStartTimes.containsKey(recordingId) &&
          task.uploadedBytes > 0) {
        final startTime = _uploadStartTimes[recordingId]!;
        final elapsedSeconds = now.difference(startTime).inSeconds;
        if (elapsedSeconds > 0) {
          _uploadSpeeds[recordingId] = task.uploadedBytes / elapsedSeconds;
        }
      }

      // Clean up completed or failed uploads
      if (task.uploadStatus == UploadStatus.done ||
          task.uploadStatus == UploadStatus.error) {
        _uploadStartTimes.remove(recordingId);
        _uploadSpeeds.remove(recordingId);
      }
    }

    if (mounted) {
      setState(() {}); // Trigger rebuild to update UI with new metrics
    }
  }

  Duration? _getEstimatedTimeRemaining(UploadTaskState task) {
    if (task.uploadStatus != UploadStatus.uploading ||
        task.totalBytes == 0 ||
        !_uploadSpeeds.containsKey(task.recordingId)) {
      return null;
    }

    final speed = _uploadSpeeds[task.recordingId]!;
    if (speed <= 0) return null;

    final remainingBytes = task.totalBytes - task.uploadedBytes;
    final remainingSeconds = remainingBytes / speed;

    return Duration(seconds: remainingSeconds.round());
  }

  void _removeUpload(String recordingId) {
    ref.read(uploadQueueProvider.notifier).removeTask(recordingId);
    _uploadStartTimes.remove(recordingId);
    _uploadSpeeds.remove(recordingId);
  }

  Widget _buildUploadItem(UploadTaskState task) {
    final progress = task.getProgress();
    final eta = _getEstimatedTimeRemaining(task);
    final speed = _uploadSpeeds[task.recordingId];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: getStatusColor(task.uploadStatus, context).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with name and controls
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: getStatusColor(task.uploadStatus, context).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  getStatusIcon(task.uploadStatus),
                  color: getStatusColor(task.uploadStatus, context),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.name ?? 'Unknown Recording',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      getStatusMessage(task),
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              if (task.uploadStatus == UploadStatus.error ||
                  task.uploadStatus == UploadStatus.done)
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  color: Colors.grey[400],
                  onPressed: () => _removeUpload(task.recordingId),
                  tooltip: 'Remove',
                ),
            ],
          ),
          const SizedBox(height: 16),

          // Progress bar with improved styling
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${(progress * 100).toStringAsFixed(1)}%',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (task.uploadStatus == UploadStatus.uploading &&
                      task.totalBytes > 0)
                    Text(
                      '${formatFileSize(task.uploadedBytes)} / ${formatFileSize(task.totalBytes)}',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[800],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    getStatusColor(task.uploadStatus, context),
                  ),
                  minHeight: 8,
                ),
              ),
            ],
          ),

          // Additional info for active uploads
          if (task.uploadStatus == UploadStatus.uploading &&
              (speed != null || eta != null)) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (speed != null)
                    Row(
                      children: [
                        Icon(
                          Icons.speed,
                          color: Colors.grey[400],
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${formatFileSize(speed.round())}/s',
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  if (eta != null)
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Colors.grey[400],
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          formatDuration(eta),
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],

          // Error details
          if (task.uploadStatus == UploadStatus.error && task.error != null) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red[900]!.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.red[700]!,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red[400],
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      task.error!,
                      style: TextStyle(
                        color: Colors.red[200],
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final queueItems = ref.watch(uploadQueueProvider).values.toList();
    final mediaQuery = MediaQuery.of(context);

    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        Center(
          child: FadeTransition(
            opacity: _animation,
            child: ScaleTransition(
              scale: _animation,
              child: CardWidget(
                padding: CardPadding.large,
                child: Material(
                  type: MaterialType.transparency,
                  child: SizedBox(
                    width: mediaQuery.size.width * 0.6,
                    height: mediaQuery.size.height * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Row(
                          children: [
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: [
                                    ClonesColors.primary.withOpacity(0.7),
                                    ClonesColors.secondary.withOpacity(0.9),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.dstIn,
                              child: Image.asset(
                                Assets.uploadIcon,
                                width: 32,
                                height: 32,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Upload Manager',
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text(
                                    '${queueItems.length} item${queueItems.length == 1 ? '' : 's'}',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: Icon(
                                Icons.close,
                                color: ClonesColors.secondaryText,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Content
                        if (queueItems.isEmpty)
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload_outlined,
                                    size: 64,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'No uploads in progress',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Upload progress will be shown here when you start recording and uploading tasks.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: queueItems
                                    .map((item) => _buildUploadItem(item))
                                    .toList(),
                              ),
                            ),
                          ),

                        // Footer actions
                        if (queueItems.isNotEmpty) ...[
                          const SizedBox(height: 16),
                          const Divider(),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              if (queueItems.any((item) =>
                                  item.uploadStatus == UploadStatus.done))
                                Expanded(
                                  child: BtnPrimary(
                                    buttonText: 'Clear Completed',
                                    onTap: () {
                                      for (final item in queueItems.where(
                                          (item) =>
                                              item.uploadStatus ==
                                              UploadStatus.done)) {
                                        _removeUpload(item.recordingId);
                                      }
                                    },
                                    btnPrimaryType:
                                        BtnPrimaryType.outlinePrimary,
                                  ),
                                ),
                              if (queueItems.any((item) =>
                                      item.uploadStatus == UploadStatus.done) &&
                                  queueItems.any((item) =>
                                      item.uploadStatus == UploadStatus.error))
                                const SizedBox(width: 16),
                              if (queueItems.any((item) =>
                                  item.uploadStatus == UploadStatus.error))
                                Expanded(
                                  child: BtnPrimary(
                                    buttonText: 'Clear Failed',
                                    onTap: () {
                                      for (final item in queueItems.where(
                                          (item) =>
                                              item.uploadStatus ==
                                              UploadStatus.error)) {
                                        _removeUpload(item.recordingId);
                                      }
                                    },
                                    btnPrimaryType:
                                        BtnPrimaryType.outlinePrimary,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
