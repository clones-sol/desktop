import 'package:clones/application/session/provider.dart';
import 'package:clones/ui/components/card.dart';
import 'package:clones/ui/components/wallet_not_connected.dart';
import 'package:clones/ui/views/demo_detail/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DemoDetailSteps extends ConsumerWidget {
  const DemoDetailSteps({super.key});

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

    return Column(
      children: [
        CardWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Summary',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Text(
                'Steps taken during the demonstration:',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    submission.gradeResult?.summary ?? 'No summary provided.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
