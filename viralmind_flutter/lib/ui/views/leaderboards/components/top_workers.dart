import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/leaderboard/worker_leader_board.dart';
import 'package:viralmind_flutter/ui/components/card.dart';
import 'package:viralmind_flutter/ui/utils/wallet.dart';

class TopWorkers extends ConsumerWidget {
  const TopWorkers(
      {super.key,
      required this.workers,
      this.showTitle = true,
      this.listHeight,
      this.onExpand});

  final List<WorkerLeaderboard> workers;
  final bool showTitle;
  final double? listHeight;
  final VoidCallback? onExpand;

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
        if (showTitle)
          Positioned(
            top: 8,
            right: 20,
            child: Row(
              children: [
                const Text(
                  'Top Workers',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: VMColors.primary,
                  ),
                ),
                if (onExpand != null) ...[
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(Icons.open_in_full,
                        color: VMColors.secondary),
                    onPressed: onExpand,
                  ),
                ],
              ],
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
                height: listHeight ?? 300,
                child: _buildWorkersList(),
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
            child: Row(
              children: [
                Text(
                  'Address',
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
                  'Average Grade',
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
                  'Tasks Completed',
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
                  r'$VIRAL Rewards',
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

  Widget _buildWorkersList() {
    return ListView.separated(
      itemCount: workers.length,
      itemBuilder: (context, index) {
        final worker = workers[index];
        return Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: _truncateAddress(worker.address),
                            style: const TextStyle(
                              color: VMColors.primaryText,
                            ),
                          ),
                          TextSpan(
                            text: worker.nickname == null ||
                                    worker.nickname!.isEmpty
                                ? ''
                                : '\n${worker.nickname}',
                            style: const TextStyle(
                              color: VMColors.secondary,
                            ),
                          ),
                        ],
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
                      '${worker.avgScore.toStringAsFixed(0)}%',
                      style: const TextStyle(
                        color: Colors.green,
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
                      '${worker.tasks} Tasks',
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
                      formatNumberWithSeparator(worker.rewards),
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

  String _truncateAddress(String address) {
    if (address.isEmpty) return '';
    return '${address.substring(0, 6)}...${address.substring(address.length - 6)}';
  }
}
