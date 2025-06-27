import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:viralmind_flutter/application/submissions.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/submission/pool_submission.dart';
import 'package:viralmind_flutter/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/components/modals/download_scripts_modal.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/bloc/provider.dart';

final _selectedSubmissionsProvider =
    StateProvider.autoDispose<Set<String>>((ref) => {});

class ForgeGymUploadsTab extends ConsumerWidget {
  const ForgeGymUploadsTab({super.key});

  static const String routeName = '/forge/gym/uploads';

  String _formatDate(String dateStr) {
    try {
      final dt = DateTime.parse(dateStr);
      // format to 'MMM d, y'
      return DateFormat.yMMMd().format(dt);
    } catch (_) {
      return dateStr;
    }
  }

  String _getTitle(PoolSubmission submission) {
    if (submission.meta.quest.title.isNotEmpty) {
      return submission.meta.quest.title;
    } else if (submission.meta.quest.app.isNotEmpty) {
      return submission.meta.quest.app;
    }
    return 'Untitled Submission';
  }

  String _getTotalFileSize(PoolSubmission submission) {
    if (submission.files.isEmpty) {
      return '-';
    }
    final totalSize =
        submission.files.fold<int>(0, (prev, file) => prev + file.size);

    return '${(totalSize / (1024 * 1024)).toStringAsFixed(2)} MB';
  }

  IconData _getOSIcon(PoolSubmission submission) {
    final platform = submission.meta.platform.toLowerCase();

    if (platform.contains('windows')) return Icons.desktop_windows;
    if (platform.contains('mac') || platform.contains('darwin')) {
      return Icons.laptop_mac;
    }
    if (platform.contains('linux')) return Icons.dns;
    if (platform.contains('android') || platform.contains('ios')) {
      return Icons.phone_iphone;
    }

    return Icons.public;
  }

  String _formatDuration(PoolSubmission submission) {
    final seconds = submission.meta.durationSeconds;

    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;

    if (minutes > 0) {
      return '${minutes}m ${remainingSeconds}s';
    } else {
      return '${remainingSeconds}s';
    }
  }

  Widget _getStatusCell(PoolSubmission submission) {
    Color backgroundColor;
    Color textColor;

    switch (submission.status) {
      case 'completed':
        backgroundColor = Colors.green.shade100;
        textColor = Colors.green.shade800;
        break;
      case 'failed':
        backgroundColor = Colors.red.shade100;
        textColor = Colors.red.shade800;
        break;
      default:
        backgroundColor = Colors.yellow.shade100;
        textColor = Colors.yellow.shade800;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        submission.status,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _getQualityCell(PoolSubmission submission) {
    final score = submission.gradeResult?.score;
    if (score == null) {
      return Text('-', style: TextStyle(color: VMColors.secondaryText));
    }

    Color color;
    if (score >= 50) {
      color = Colors.green;
    } else if (score >= 25) {
      color = Colors.orange;
    } else {
      color = Colors.red;
    }

    return Text(
      '${score.toStringAsFixed(0)}%',
      style: TextStyle(color: color, fontWeight: FontWeight.bold),
    );
  }

  Widget _getRewardCell(PoolSubmission submission) {
    final reward = submission.reward;
    if (reward != null && reward > 0) {
      return Text(
        '$reward VIRAL',
        style: TextStyle(color: VMColors.secondaryText),
      );
    }

    final reasoning = submission.gradeResult?.reasoning;
    final tooltipMessage = (reasoning != null)
        ? (RegExp(r'\(\s*system:\s*(.*?)\s*\)')
                .firstMatch(reasoning)
                ?.group(1) ??
            '')
        : null;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'FREE',
          style: TextStyle(color: VMColors.secondaryText),
        ),
        if (tooltipMessage != null && tooltipMessage.isNotEmpty) ...[
          const SizedBox(width: 4),
          Tooltip(
            message: tooltipMessage,
            child: Icon(
              Icons.info_outline,
              size: 14,
              color: VMColors.secondaryText,
            ),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pool = ref.watch(forgeDetailNotifierProvider).pool;
    if (pool == null) return const SizedBox.shrink();

    final submissionsAsync = ref.watch(getPoolSubmissionsProvider(pool.id));
    final selectedSubmissions = ref.watch(_selectedSubmissionsProvider);
    final selectedCount = selectedSubmissions.length;

    return submissionsAsync.when(
      loading: () => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 8),
            Text(
              'Loading submissions...',
              style: TextStyle(color: VMColors.secondaryText),
            ),
          ],
        ),
      ),
      error: (err, stack) => Center(
        child: Text(
          'Error: $err',
          style: TextStyle(color: VMColors.secondaryText),
        ),
      ),
      data: (submissions) {
        final allSelected =
            submissions.isNotEmpty && selectedCount == submissions.length;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Uploads',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: VMColors.primaryText,
                        ),
                      ),
                      if (selectedCount > 0)
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: VMColors.secondary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '$selectedCount selected',
                            style: const TextStyle(
                              color: VMColors.primaryText,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                  BtnPrimary(
                    onTap: submissions.isEmpty
                        ? null
                        : () {
                            final selected =
                                ref.read(_selectedSubmissionsProvider);
                            final subs = selected.isNotEmpty
                                ? submissions
                                    .where((s) => selected.contains(s.id))
                                    .toList()
                                : submissions;
                            showDialog(
                              context: context,
                              barrierColor: Colors.black.withValues(alpha: 0.5),
                              builder: (context) =>
                                  DownloadScriptsModal(submissions: subs),
                            );
                          },
                    buttonText: selectedCount > 0
                        ? 'Export Selected'
                        : 'Export All Uploads',
                    icon: selectedCount > 0 ? Icons.download : Icons.code,
                  ),
                ],
              ),
            ),
            if (submissions.isEmpty)
              const Expanded(
                child: Center(
                  child: Text(
                    'No uploads yet.',
                  ),
                ),
              )
            else
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    showCheckboxColumn: false,
                    columns: [
                      DataColumn(
                        label: Checkbox(
                          activeColor: VMColors.primary,
                          checkColor: VMColors.primaryText,
                          side: const BorderSide(
                            color: VMColors.primary,
                            width: 2,
                          ),
                          value: allSelected,
                          onChanged: (val) {
                            if (val == true) {
                              ref
                                  .read(_selectedSubmissionsProvider.notifier)
                                  .state = submissions.map((e) => e.id).toSet();
                            } else {
                              ref
                                  .read(_selectedSubmissionsProvider.notifier)
                                  .state = {};
                            }
                          },
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Platform',
                          style: TextStyle(color: VMColors.secondaryText),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Task',
                          style: TextStyle(color: VMColors.secondaryText),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Status',
                          style: TextStyle(color: VMColors.secondaryText),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Duration',
                          style: TextStyle(color: VMColors.secondaryText),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Size',
                          style: TextStyle(color: VMColors.secondaryText),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Date',
                          style: TextStyle(color: VMColors.secondaryText),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Quality',
                          style: TextStyle(color: VMColors.secondaryText),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Reward',
                          style: TextStyle(color: VMColors.secondaryText),
                        ),
                      ),
                    ],
                    rows: submissions
                        .map(
                          (sub) => DataRow(
                            cells: [
                              DataCell(
                                Checkbox(
                                  value: selectedSubmissions.contains(sub.id),
                                  onChanged: (selected) {
                                    final notifier = ref.read(
                                      _selectedSubmissionsProvider.notifier,
                                    );
                                    if (selected == true) {
                                      notifier.state = {
                                        ...notifier.state,
                                        sub.id,
                                      };
                                    } else {
                                      notifier.state = {...notifier.state}
                                        ..remove(sub.id);
                                    }
                                  },
                                ),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    Icon(
                                      _getOSIcon(sub),
                                      size: 18,
                                      color: VMColors.secondaryText,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      sub.meta.platform,
                                      style: TextStyle(
                                        color: VMColors.secondaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Text(
                                  _getTitle(sub),
                                  style: TextStyle(
                                    color: VMColors.secondaryText,
                                  ),
                                ),
                              ),
                              DataCell(
                                _getStatusCell(sub),
                              ),
                              DataCell(
                                Text(
                                  _formatDuration(sub),
                                  style: TextStyle(
                                    color: VMColors.secondaryText,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(
                                  _getTotalFileSize(sub),
                                  style: TextStyle(
                                    color: VMColors.secondaryText,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(
                                  _formatDate(sub.createdAt),
                                  style: TextStyle(
                                    color: VMColors.secondaryText,
                                  ),
                                ),
                              ),
                              DataCell(
                                _getQualityCell(sub),
                              ),
                              DataCell(
                                _getRewardCell(sub),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
