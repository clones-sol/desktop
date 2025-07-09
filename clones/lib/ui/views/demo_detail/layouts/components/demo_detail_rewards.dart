import 'package:clones/application/session/provider.dart';
import 'package:clones/assets.dart';
import 'package:clones/domain/models/submission/grade_result.dart';
import 'package:clones/domain/models/token.dart';
import 'package:clones/ui/components/card.dart';
import 'package:clones/ui/components/design_widget/message_box/message_box.dart';
import 'package:clones/ui/components/wallet_not_connected.dart';
import 'package:clones/ui/views/demo_detail/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DemoDetailRewards extends ConsumerWidget {
  const DemoDetailRewards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionNotifierProvider);
    if (session.isConnected == false) {
      return const WalletNotConnected();
    }

    final submission =
        ref.watch(demoDetailNotifierProvider).recording?.submission;

    if (submission == null) {
      return const SizedBox.shrink();
    }

    final score = submission.gradeResult?.score ?? submission.clampedScore ?? 0;
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
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Earned:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '$reward \$${Token.getTokenType(TokenType.clones)}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '$maxReward \$${Token.getTokenType(TokenType.clones)}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
