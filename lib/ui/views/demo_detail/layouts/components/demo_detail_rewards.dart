import 'package:clones_desktop/application/pool.dart';
import 'package:clones_desktop/application/session/provider.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/domain/models/submission/grade_result.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/components/design_widget/message_box/message_box.dart';
import 'package:clones_desktop/ui/components/wallet_not_connected.dart';
import 'package:clones_desktop/ui/views/demo_detail/bloc/provider.dart';
import 'package:clones_desktop/utils/env.dart';
import 'package:clones_desktop/utils/format_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DemoDetailRewards extends ConsumerWidget {
  const DemoDetailRewards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionNotifierProvider);
    if (session.isConnected == false) {
      return const WalletNotConnected();
    }

    final recording = ref.watch(demoDetailNotifierProvider).recording;
    final submission = recording?.submission;
    final poolId = recording?.demonstration?.poolId;

    if (submission == null || poolId == null) {
      return const SizedBox.shrink();
    }

    final poolAsync = ref.watch(poolProvider(poolId));

    return poolAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      data: (pool) {
        final theme = Theme.of(context);
        final score =
            submission.gradeResult?.score ?? submission.clampedScore ?? 0;
        final maxReward = submission.maxReward ?? 0;
        final reward = submission.reward ?? 0;

        return Column(
          children: [
            CardWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rewards',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Earned:',
                        style: theme.textTheme.bodyMedium,
                      ),
                      Text(
                        '$reward \$${pool.token.symbol}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: VMColors.getScoreColor(score),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Max Reward:',
                        style: theme.textTheme.bodyMedium,
                      ),
                      Text(
                        '$maxReward \$${pool.token.symbol}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: VMColors.getScoreColor(100),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LinearProgressIndicator(
                    value: maxReward > 0 ? reward / maxReward : 0,
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  const SizedBox(height: 20),
                  if (submission.gradeResult?.reasoningSystem != null &&
                      submission.gradeResult!.reasoningSystem.isNotEmpty)
                    SizedBox(
                      width: double.infinity,
                      child: MessageBox(
                        messageBoxType: MessageBoxType.info,
                        content: Text(
                          submission.gradeResult?.reasoningSystem ?? '',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  if (submission.treasuryTransfer != null)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Treasury Transfer:',
                              style: theme.textTheme.bodyMedium,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(
                                  Uri.parse(
                                    '${Env.solscanBaseUrl}/address/${submission.treasuryTransfer?.treasuryWallet}/?cluster=${Env.solscanCluster}',
                                  ),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    submission.treasuryTransfer?.treasuryWallet
                                            .shortAddress() ??
                                        '',
                                    style: TextStyle(
                                      fontFamily: 'monospace',
                                      color: VMColors.secondaryText,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.open_in_new,
                                    color: VMColors.secondaryText,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transaction hash:',
                              style: theme.textTheme.bodyMedium,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(
                                  Uri.parse(
                                    '${Env.solscanBaseUrl}/tx/${submission.treasuryTransfer?.txHash}/?cluster=${Env.solscanCluster}',
                                  ),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    submission.treasuryTransfer?.txHash
                                            ?.shortAddress() ??
                                        'NC',
                                    style: TextStyle(
                                      fontFamily: 'monospace',
                                      color: VMColors.secondaryText,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.open_in_new,
                                    color: VMColors.secondaryText,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transaction date:',
                              style: theme.textTheme.bodyMedium,
                            ),
                            Text(
                              submission.treasuryTransfer?.timestamp != null
                                  ? DateFormat.yMMMMd().add_Hms().format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                          submission
                                              .treasuryTransfer!.timestamp,
                                        ),
                                      )
                                  : 'NC',
                              style: TextStyle(
                                color: VMColors.secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
