import 'package:clones_desktop/application/session/provider.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/domain/models/submission/grade_result.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/components/wallet_not_connected.dart';
import 'package:clones_desktop/ui/views/demo_detail/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DemoDetailSubmissionResult extends ConsumerWidget {
  const DemoDetailSubmissionResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionNotifierProvider);
    if (session.isConnected == false) {
      return const WalletNotConnected();
    }

    final submission =
        ref.watch(demoDetailNotifierProvider).recording?.submission;

    if (submission == null) {
      return const CardWidget(
        child: SizedBox(
          width: double.infinity,
          child: Text('Submission data not available.'),
        ),
      );
    }

    final score = submission.gradeResult?.score ?? submission.clampedScore ?? 0;
    final theme = Theme.of(context);
    return Column(
      children: [
        CardWidget(
          child: Column(
            children: [
              const SizedBox(height: 10, width: double.infinity),
              SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: score / 100,
                      strokeWidth: 10,
                      backgroundColor: ClonesColors.getScoreColor(score)
                          .withValues(alpha: 0.2),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        ClonesColors.getScoreColor(score),
                      ),
                    ),
                    Center(
                      child: Text(
                        '$score%',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ClonesColors.getScoreColor(score),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                submission.gradeResult?.reasoningForUser ??
                    'No reasoning provided.',
                style: theme.textTheme.bodyMedium,
              ),
              if (submission.gradeResult?.scratchpad != null &&
                  submission.gradeResult!.scratchpad!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    submission.gradeResult?.scratchpad ?? '',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
