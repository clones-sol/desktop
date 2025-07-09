import 'package:clones/application/session/provider.dart';
import 'package:clones/assets.dart';
import 'package:clones/domain/models/submission/grade_result.dart';
import 'package:clones/ui/components/card.dart';
import 'package:clones/ui/components/wallet_not_connected.dart';
import 'package:clones/ui/views/demo_detail/bloc/provider.dart';
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
                      backgroundColor:
                          VMColors.getScoreColor(score).withValues(alpha: 0.2),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        VMColors.getScoreColor(score),
                      ),
                    ),
                    Center(
                      child: Text(
                        '$score%',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: VMColors.getScoreColor(score),
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
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
