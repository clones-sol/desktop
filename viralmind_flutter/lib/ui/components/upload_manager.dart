import 'dart:async';

import 'package:flutter/material.dart';

enum UploadStatus {
  queued,
  uploading,
  zipping,
  processing,
  completed,
  failed,
  unknown,
}

class UploadItem {
  final String id;
  final String name;
  UploadStatus status;
  String? error;
  double? progress; // en %
  int? uploadedBytes;
  int? totalBytes;

  UploadItem({
    required this.id,
    required this.name,
    this.status = UploadStatus.unknown,
    this.error,
    this.progress,
    this.uploadedBytes,
    this.totalBytes,
  });
}

// UploadManager avec gestion simple de la file et nettoyage
class UploadManager extends ChangeNotifier {
  final Map<String, UploadItem> _queue = {};

  Map<String, UploadItem> get queue => _queue;

  Timer? _cleanupTimer;

  UploadManager() {
    _cleanupTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      cleanupIntervals();
    });
  }

  @override
  void dispose() {
    _cleanupTimer?.cancel();
    super.dispose();
  }

  void addToQueue(UploadItem item) {
    _queue[item.id] = item;
    notifyListeners();
  }

  void removeFromQueue(String id) {
    _queue.remove(id);
    notifyListeners();
  }

  void cleanupIntervals() {
    // Exemple de nettoyage
    // Ici on pourrait annuler des timers liés aux uploads, etc.
    // Pour l'exemple, on n'a rien de spécifique.
  }

  // Méthodes pour mettre à jour le status / progress etc. à ajouter selon besoin
}

// Utils

String formatFileSize(int? bytes) {
  if (bytes == null) return '0 B';
  const units = ['B', 'KB', 'MB', 'GB', 'TB'];
  double size = bytes.toDouble();
  int unitIndex = 0;

  while (size >= 1024 && unitIndex < units.length - 1) {
    size /= 1024;
    unitIndex++;
  }

  return '${size.toStringAsFixed(1)} ${units[unitIndex]}';
}

IconData getStatusIcon(UploadStatus status) {
  switch (status) {
    case UploadStatus.completed:
      return Icons.check;
    case UploadStatus.failed:
      return Icons.error;
    default:
      return Icons.upload;
  }
}

Color getStatusColor(UploadStatus status, BuildContext context) {
  switch (status) {
    case UploadStatus.completed:
      return Colors.green[500]!;
    case UploadStatus.failed:
      return Colors.red[500]!;
    case UploadStatus.processing:
    case UploadStatus.uploading:
    case UploadStatus.zipping:
      return Colors.yellow[700]!;
    default:
      return Theme.of(context).colorScheme.secondary.withValues(alpha: 0.7);
  }
}

String getStatusMessage(UploadItem item) {
  if (item.status == UploadStatus.failed && item.error != null) {
    return 'Failed: ${item.error}';
  }

  switch (item.status) {
    case UploadStatus.queued:
      return 'Queued for upload';
    case UploadStatus.uploading:
      return 'Uploading...';
    case UploadStatus.zipping:
      return 'Zipping Recording...';
    case UploadStatus.processing:
      return 'Processing...';
    case UploadStatus.completed:
      return 'Upload completed';
    case UploadStatus.failed:
      return 'Upload failed';
    default:
      return 'Unknown status';
  }
}

class UploadManagerWidget extends StatefulWidget {
  final UploadManager uploadManager;

  const UploadManagerWidget({super.key, required this.uploadManager});

  @override
  State<UploadManagerWidget> createState() => _UploadManagerWidgetState();
}

class _UploadManagerWidgetState extends State<UploadManagerWidget> {
  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    widget.uploadManager.addListener(_onQueueChanged);
  }

  @override
  void dispose() {
    widget.uploadManager.removeListener(_onQueueChanged);
    widget.uploadManager.cleanupIntervals();
    super.dispose();
  }

  void _onQueueChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final queueItems =
        widget.uploadManager.queue.values.toList().reversed.toList();

    if (queueItems.isEmpty) {
      return const SizedBox.shrink();
    }

    // Déterminer la couleur du badge
    Color badgeColor;
    if (queueItems.any((item) => item.status == UploadStatus.failed)) {
      badgeColor = Colors.red[500]!;
    } else if (queueItems.any(
      (item) =>
          item.status == UploadStatus.uploading ||
          item.status == UploadStatus.processing ||
          item.status == UploadStatus.zipping,
    )) {
      badgeColor = Colors.yellow[500]!;
    } else if (queueItems.every(
      (item) => item.status == UploadStatus.completed,
    )) {
      badgeColor = Colors.green[500]!;
    } else {
      badgeColor = Theme.of(
        context,
      ).colorScheme.secondary.withValues(alpha: 0.7);
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Bouton d'upload avec badge
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.1),
            ),
            child: Icon(Icons.upload, color: Colors.white, size: 16),
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

          // Popup détaillé visible au survol
          if (_hovering)
            Positioned(
              bottom: 0,
              left: 48,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[900],
                child: Container(
                  width: 256,
                  constraints: const BoxConstraints(maxHeight: 240),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Upload Manager',
                              style: const TextStyle(
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
                      ),

                      // Liste des items
                      Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            children:
                                queueItems.map((item) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey[700]!,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Ligne avec icône, nom et bouton fermer
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    getStatusIcon(item.status),
                                                    color: getStatusColor(
                                                      item.status,
                                                      context,
                                                    ),
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Flexible(
                                                    child: Text(
                                                      item.name,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.grey,
                                                size: 14,
                                              ),
                                              onPressed: () {
                                                widget.uploadManager
                                                    .removeFromQueue(item.id);
                                              },
                                              tooltip: 'Remove',
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 4),

                                        // Message de status
                                        Text(
                                          getStatusMessage(item),
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),

                                        // Barre de progression
                                        if (item.progress != null)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: LinearProgressIndicator(
                                                value: item.progress! / 100,
                                                backgroundColor:
                                                    Colors.grey[700],
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                      Color
                                                    >(
                                                      item.status ==
                                                              UploadStatus
                                                                  .completed
                                                          ? Colors.green
                                                          : Theme.of(context)
                                                              .colorScheme
                                                              .secondary,
                                                    ),
                                                minHeight: 6,
                                              ),
                                            ),
                                          ),

                                        // Texte taille uploadée
                                        if (item.status ==
                                                UploadStatus.uploading &&
                                            item.uploadedBytes != null &&
                                            item.totalBytes != null)
                                          Text(
                                            '${formatFileSize(item.uploadedBytes)} of ${formatFileSize(item.totalBytes)}',
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
