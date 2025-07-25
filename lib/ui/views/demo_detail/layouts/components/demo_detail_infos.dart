import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/components/design_widget/message_box/message_box.dart';
import 'package:clones_desktop/ui/views/demo_detail/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DemoDetailInfos extends ConsumerWidget {
  const DemoDetailInfos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final demoDetail = ref.watch(demoDetailNotifierProvider);
    final recording = demoDetail.recording;

    if (recording == null) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recording.title,
                      style: theme.textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    _buildInfoGrid(context, ref),
                  ],
                ),
              ),
            ],
          ),
          if (demoDetail.uploadError != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: MessageBox(
                messageBoxType: MessageBoxType.warning,
                content: Text(
                  'Upload Error: ${demoDetail.uploadError}',
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ),
          if (demoDetail.exportPath != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: MessageBox(
                messageBoxType: MessageBoxType.success,
                content: Text(
                  'Zip successfully exported: ${demoDetail.exportPath}',
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ),
          if (demoDetail.exportError != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: MessageBox(
                messageBoxType: MessageBoxType.warning,
                content: Text(
                  'Export Error: ${demoDetail.exportError}',
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoGrid(BuildContext context, WidgetRef ref) {
    final demoDetail = ref.watch(demoDetailNotifierProvider);
    final recording = demoDetail.recording;

    if (recording == null) {
      return const SizedBox.shrink();
    }

    final submittedAt = DateTime.parse(recording.timestamp);
    final formattedDate = DateFormat.yMd().add_jm().format(submittedAt);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildInfoRow('ID: ', recording.id, context),
            ),
            Expanded(
              child: _buildInfoRow('Submitted: ', formattedDate, context),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: _buildInfoRow(
                'OS: ',
                '${recording.platform} ${recording.version} (${recording.arch})',
                context,
              ),
            ),
            Expanded(
              child: _buildInfoRow(
                'Resolution: ',
                '${recording.primaryMonitor.width}x${recording.primaryMonitor.height}',
                context,
              ),
            ),
          ],
        ),
        _buildInfoRow('Locale: ', recording.locale, context),
      ],
    );
  }

  Widget _buildInfoRow(
    String label,
    String value,
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(
            label,
            style: theme.textTheme.bodySmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Text(value, style: theme.textTheme.bodySmall),
        ),
      ],
    );
  }
}
