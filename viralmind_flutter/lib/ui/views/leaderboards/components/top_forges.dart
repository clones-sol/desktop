import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/leaderboard/forge_leader_board.dart';
import 'package:viralmind_flutter/ui/components/card.dart';
import 'package:viralmind_flutter/ui/utils/wallet.dart';

class TopForges extends ConsumerWidget {
  const TopForges({super.key, required this.forges});

  final List<ForgeLeaderboard> forges;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Scrollbar(
          thumbVisibility: true,
          thickness: 8,
          radius: const Radius.circular(4),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLeaderboardTable(context),
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          top: 8,
          right: 20,
          child: Text(
            'Top Forges',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: VMColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboardTable(BuildContext context) {
    return Column(
      children: [
        CardWidget(
          variant: CardVariant.black,
          padding: CardPadding.none,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTableHeader(context),
              SizedBox(
                height: 300,
                child: _buildForgesList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTableHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: VMColors.primaryText,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Tasks Created',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: VMColors.primaryText,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  r'$VIRAL Paid',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: VMColors.primaryText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForgesList() {
    return ListView.separated(
      itemCount: forges.length,
      itemBuilder: (context, index) {
        final forge = forges[index];
        return Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  forge.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: VMColors.primaryText,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${forge.tasks} Tasks',
                      style: TextStyle(
                        color: VMColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      formatNumberWithSeparator(forge.payout),
                      style: TextStyle(
                        color: VMColors.secondaryText,
                      ),
                    ),
                    const Text(
                      r' $VIRAL',
                      style: TextStyle(
                        color: VMColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return FractionallySizedBox(
          widthFactor: 0.8,
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withValues(alpha: 0.05),
                  Colors.white.withValues(alpha: 0.3),
                  Colors.white.withValues(alpha: 0.05),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
