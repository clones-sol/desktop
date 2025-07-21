import 'package:clones_desktop/application/upload/provider.dart';
import 'package:clones_desktop/application/upload/state.dart';
import 'package:clones_desktop/assets.dart';
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
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isHovering = false;

  @override
  void dispose() {
    _hideOverlay();
    super.dispose();
  }

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;

    final queueItems = ref.read(uploadQueueProvider).values.toList();

    return OverlayEntry(
      builder: (context) => Positioned(
        width: 280,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(size.width + 8, -150),
          child: MouseRegion(
            onEnter: (_) {
              setState(() {
                _isHovering = true;
              });
            },
            onExit: (_) {
              setState(() {
                _isHovering = false;
                _hideOverlay();
              });
            },
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      blurRadius: 5,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Upload Manager',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '(${queueItems.length})',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    ...queueItems.map((item) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    Icon(
                                      getStatusIcon(item.uploadStatus),
                                      color: getStatusColor(
                                        item.uploadStatus,
                                        context,
                                      ),
                                      size: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                        item.name ?? 'Unknown',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: VMColors.secondaryText,
                                  size: 14,
                                ),
                                onPressed: () {
                                  // TODO(reddwarf03): Remove item from queue
                                },
                                tooltip: 'Remove',
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.uploadStatus.name,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: LinearProgressIndicator(
                                value: item.getProgress() / 100,
                                backgroundColor: Colors.grey[700],
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  item.uploadStatus == UploadStatus.done
                                      ? Colors.green
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                                minHeight: 6,
                              ),
                            ),
                          ),
                          if (item.uploadStatus == UploadStatus.uploading)
                            Text(
                              '${formatFileSize(item.uploadedBytes)} of ${formatFileSize(item.totalBytes)}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

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

    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: () {
          if (_isHovering == false) {
            setState(() {
              _isHovering = true;
              _showOverlay();
            });
          } else {
            setState(() {
              _isHovering = false;
              _hideOverlay();
            });
          }
        },
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [
                    VMColors.primary.withValues(alpha: 0.5),
                    VMColors.secondary.withValues(alpha: 0.9),
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
      ),
    );
  }
}
