import 'package:clones/assets.dart';
import 'package:clones/domain/models/leaderboard/stats_leader_board.dart';
import 'package:clones/domain/models/token.dart';
import 'package:clones/ui/components/card.dart';
import 'package:clones/utils/format_num.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaderboardsStatTotalPaidOut extends ConsumerWidget {
  const LeaderboardsStatTotalPaidOut({super.key, required this.stat});

  final LeaderboardStats stat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: CardWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: VMColors.containerIcon3.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.monetization_on_outlined,
                color: VMColors.containerIcon3.withValues(alpha: 0.7),
                size: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${formatNumberWithSeparator(stat.totalRewards)} \$${Token.getTokenType(TokenType.clones)}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              'paid out',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
