import 'package:clones/assets.dart';
import 'package:clones/domain/models/leaderboard/worker_leader_board.dart';
import 'package:clones/domain/models/token.dart';
import 'package:clones/ui/components/card.dart';
import 'package:clones/utils/format_num.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopWorkers extends ConsumerStatefulWidget {
  const TopWorkers({
    super.key,
    required this.workers,
    this.showTitle = true,
    this.listHeight,
    this.onExpand,
  });

  final List<WorkerLeaderboard> workers;
  final bool showTitle;
  final double? listHeight;
  final VoidCallback? onExpand;

  @override
  ConsumerState<TopWorkers> createState() => _TopWorkersState();
}

class _TopWorkersState extends ConsumerState<TopWorkers> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLeaderboardTable(context),
            ],
          ),
        ),
        if (widget.showTitle)
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
                if (widget.onExpand != null) ...[
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(
                      Icons.open_in_full,
                      color: VMColors.secondary,
                    ),
                    onPressed: widget.onExpand,
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
                height: widget.listHeight ?? 300,
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
      child: Row(
        children: [
          const Expanded(
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
          const Expanded(
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
          const Expanded(
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
                  '\$${Token.getTokenType(TokenType.viral)} Rewards',
                  style: const TextStyle(
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
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      thickness: 8,
      radius: const Radius.circular(4),
      child: ListView.separated(
        controller: _scrollController,
        itemCount: widget.workers.length,
        itemBuilder: (context, index) {
          final worker = widget.workers[index];
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
                            const TextSpan(
                              text: '',
                              style: TextStyle(
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
                      Text(
                        ' \$${Token.getTokenType(TokenType.viral)}',
                        style: const TextStyle(
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
      ),
    );
  }

  String _truncateAddress(String address) {
    if (address.isEmpty) return '';
    return '${address.substring(0, 6)}...${address.substring(address.length - 6)}';
  }
}
