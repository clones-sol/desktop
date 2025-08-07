import 'package:clones_desktop/application/upload/provider.dart';
import 'package:clones_desktop/application/upload/state.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/upload_progress_modal.dart';
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

IconData getStatusIcon(UploadStatus status) {
  switch (status) {
    case UploadStatus.done:
      return Icons.check;
    case UploadStatus.error:
      return Icons.error;
    case UploadStatus.idle:
      return Icons.queue;
    case UploadStatus.uploading:
      return Icons.upload;
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
      return Colors.yellow[700]!;
    case UploadStatus.idle:
      return Colors.grey[500]!;
  }
}

class UploadManagerWidget extends ConsumerStatefulWidget {
  const UploadManagerWidget({super.key});

  @override
  ConsumerState<UploadManagerWidget> createState() =>
      _UploadManagerWidgetState();
}

class _UploadManagerWidgetState extends ConsumerState<UploadManagerWidget> {
  @override
  Widget build(BuildContext context) {
    final queueItems = ref.watch(uploadQueueProvider).values.toList();

    if (queueItems.isEmpty) {
      return const SizedBox.shrink();
    }

    Color badgeColor;
    if (queueItems.any((item) => item.uploadStatus == UploadStatus.error)) {
      badgeColor = Colors.red[500]!;
    } else if (queueItems.any(
      (item) =>
          item.uploadStatus == UploadStatus.uploading ||
          item.uploadStatus == UploadStatus.processing ||
          item.uploadStatus == UploadStatus.zipping,
    )) {
      badgeColor = Colors.yellow[500]!;
    } else if (queueItems.every(
      (item) => item.uploadStatus == UploadStatus.done,
    )) {
      badgeColor = Colors.green[500]!;
    } else {
      badgeColor = Theme.of(
        context,
      ).colorScheme.secondary.withValues(alpha: 0.7);
    }

    return GestureDetector(
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (context) => const UploadProgressModal(),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [
                  ClonesColors.primary.withValues(alpha: 0.5),
                  ClonesColors.secondary.withValues(alpha: 0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              Assets.uploadIcon,
              width: 40,
              height: 40,
            ),
          ),
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
