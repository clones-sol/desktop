import 'dart:async';

import 'package:clones_desktop/application/upload/provider.dart';
import 'package:clones_desktop/application/upload/state.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/components/upload_manager.dart';
import 'package:clones_desktop/utils/format_file_info.dart';
import 'package:clones_desktop/utils/format_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImprovedUploadManager extends ConsumerStatefulWidget {
  const ImprovedUploadManager({super.key});

  @override
  ConsumerState<ImprovedUploadManager> createState() =>
      _ImprovedUploadManagerState();
}

class _ImprovedUploadManagerState extends ConsumerState<ImprovedUploadManager>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  Timer? _progressTimer;

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

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
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
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color:
              getStatusColor(task.uploadStatus, context).withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with name and controls
          Row(
            children: [
              Icon(
                getStatusIcon(task.uploadStatus),
                color: getStatusColor(task.uploadStatus, context),
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  task.name ?? 'Unknown Recording',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (task.uploadStatus == UploadStatus.error ||
                  task.uploadStatus == UploadStatus.done)
                IconButton(
                  icon: const Icon(Icons.close, size: 16),
                  color: Colors.grey[400],
                  onPressed: () => _removeUpload(task.recordingId),
                  tooltip: 'Remove',
                  constraints: const BoxConstraints(
                    minWidth: 24,
                    minHeight: 24,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),

          // Status message
          Text(
            getStatusMessage(task),
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[800],
              valueColor: AlwaysStoppedAnimation<Color>(
                getStatusColor(task.uploadStatus, context),
              ),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 6),

          // Progress details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${(progress * 100).toStringAsFixed(1)}%',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 11,
                ),
              ),
              if (task.uploadStatus == UploadStatus.uploading &&
                  task.totalBytes > 0) ...[
                Text(
                  '${formatFileSize(task.uploadedBytes)} / ${formatFileSize(task.totalBytes)}',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 11,
                  ),
                ),
              ],
            ],
          ),

          // Additional info for active uploads
          if (task.uploadStatus == UploadStatus.uploading) ...[
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (speed != null)
                  Text(
                    '${formatFileSize(speed.round())}/s',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 10,
                    ),
                  ),
                if (eta != null)
                  Text(
                    'ETA: ${formatDuration(eta)}',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 10,
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final queueItems = ref.watch(uploadQueueProvider).values.toList();

    if (queueItems.isEmpty) {
      return const SizedBox.shrink();
    }

    // Calculate badge color based on upload states
    Color badgeColor;
    if (queueItems.any((item) => item.uploadStatus == UploadStatus.error)) {
      badgeColor = Colors.red[500]!;
    } else if (queueItems.any(
      (item) =>
          item.uploadStatus == UploadStatus.uploading ||
          item.uploadStatus == UploadStatus.processing ||
          item.uploadStatus == UploadStatus.zipping,
    )) {
      badgeColor = Colors.orange[500]!;
    } else if (queueItems.every(
      (item) => item.uploadStatus == UploadStatus.done,
    )) {
      badgeColor = Colors.green[500]!;
    } else {
      badgeColor = Colors.grey[500]!;
    }

    // Enhanced hover functionality
    final hasActiveUploads = queueItems.any(
      (item) =>
          item.uploadStatus == UploadStatus.uploading ||
          item.uploadStatus == UploadStatus.processing ||
          item.uploadStatus == UploadStatus.zipping,
    );

    return Positioned(
      top: 20,
      right: 20,
      child: MouseRegion(
        child: GestureDetector(
          onTap: _toggleExpanded,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey[700]!,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header with improved design
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            badgeColor.withValues(alpha: 0.1),
                            badgeColor.withValues(alpha: 0.05),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: badgeColor.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      colors: [
                                        ClonesColors.primary
                                            .withValues(alpha: 0.7),
                                        ClonesColors.secondary
                                            .withValues(alpha: 0.9),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds);
                                  },
                                  blendMode: BlendMode.dstIn,
                                  child: Image.asset(
                                    Assets.uploadIcon,
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ),
                              if (hasActiveUploads)
                                Positioned(
                                  top: -2,
                                  right: -2,
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: badgeColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              badgeColor.withValues(alpha: 0.6),
                                          blurRadius: 4,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Upload Manager',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                hasActiveUploads
                                    ? '${queueItems.where((item) => item.uploadStatus == UploadStatus.uploading || item.uploadStatus == UploadStatus.processing || item.uploadStatus == UploadStatus.zipping).length} uploading • ${queueItems.length} total'
                                    : '${queueItems.length} item${queueItems.length == 1 ? '' : 's'}',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            _isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.grey[400],
                            size: 20,
                          ),
                        ],
                      ),
                    ),

                    // Expandable content
                    SizeTransition(
                      sizeFactor: _animation,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Column(
                          children: [
                            const Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                            const SizedBox(height: 12),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxHeight: 300),
                              child: SingleChildScrollView(
                                child: Column(
                                  children:
                                      queueItems.map(_buildUploadItem).toList(),
                                ),
                              ),
                            ),
                            if (queueItems.any(
                              (item) =>
                                  item.uploadStatus == UploadStatus.done ||
                                  item.uploadStatus == UploadStatus.error,
                            )) ...[
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  if (queueItems.any(
                                    (item) =>
                                        item.uploadStatus == UploadStatus.done,
                                  ))
                                    Expanded(
                                      child: BtnPrimary(
                                        buttonText: 'Clear Completed',
                                        onTap: () {
                                          for (final item in queueItems.where(
                                            (item) =>
                                                item.uploadStatus ==
                                                UploadStatus.done,
                                          )) {
                                            _removeUpload(item.recordingId);
                                          }
                                        },
                                        btnPrimaryType:
                                            BtnPrimaryType.outlinePrimary,
                                      ),
                                    ),
                                  if (queueItems.any(
                                        (item) =>
                                            item.uploadStatus ==
                                            UploadStatus.done,
                                      ) &&
                                      queueItems.any(
                                        (item) =>
                                            item.uploadStatus ==
                                            UploadStatus.error,
                                      ))
                                    const SizedBox(width: 8),
                                  if (queueItems.any(
                                    (item) =>
                                        item.uploadStatus == UploadStatus.error,
                                  ))
                                    Expanded(
                                      child: BtnPrimary(
                                        buttonText: 'Clear Failed',
                                        onTap: () {
                                          for (final item in queueItems.where(
                                            (item) =>
                                                item.uploadStatus ==
                                                UploadStatus.error,
                                          )) {
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
