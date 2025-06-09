import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:viralmind_flutter/application/leaderboard.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/leaderboard/forge_leader_board.dart';
import 'package:viralmind_flutter/domain/models/leaderboard/stats_leader_board.dart';
import 'package:viralmind_flutter/domain/models/leaderboard/worker_leader_board.dart';
import 'package:viralmind_flutter/ui/components/card.dart';
import 'package:viralmind_flutter/ui/utils/wallet.dart';
import 'package:viralmind_flutter/ui/views/leaderboards/components/top_forges.dart';
import 'package:viralmind_flutter/ui/views/leaderboards/components/top_workers.dart';

class LeaderboardsView extends ConsumerStatefulWidget {
  const LeaderboardsView({super.key});

  @override
  ConsumerState<LeaderboardsView> createState() => _LeaderboardsViewState();
}

class _LeaderboardsViewState extends ConsumerState<LeaderboardsView> {
  bool _loading = true;
  String? _error;

  List<WorkerLeaderboard> _topWorkers = [];
  List<ForgeLeaderboard> _topForges = [];
  LeaderboardStats? _stats;

  @override
  void initState() {
    super.initState();
    _loadLeaderboardData();
  }

  Future<void> _loadLeaderboardData() async {
    try {
      final data =
          await ref.read(leaderboardRepositoryProvider).getLeaderboardData();
      setState(() {
        // Sort workers by avgScore
        _topWorkers = (data['workersLeaderboard'] as List<WorkerLeaderboard>)
          ..sort((a, b) => b.avgScore.compareTo(a.avgScore));

        // Sort forges by payout
        _topForges = (data['forgeLeaderboard'] as List<ForgeLeaderboard>)
          ..sort((a, b) => b.payout.compareTo(a.payout));

        _stats = data['stats'] as LeaderboardStats;
        _loading = false;
        _error = null;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = 'Failed to load leaderboard data. Please try again later.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Leaderboards',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5,
                  color: VMColors.secondaryText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (_loading)
            const Center(child: CircularProgressIndicator())
          else if (_error != null)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.exclamationTriangle,
                    color: Colors.red[400],
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _error!,
                    style: TextStyle(
                      color: Colors.red[400],
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: _loadLeaderboardData,
                    icon: const Icon(FontAwesomeIcons.rotate),
                    label: const Text('Retry'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: TopForges(forges: _topForges)),
                    const SizedBox(width: 20),
                    Expanded(child: TopWorkers(workers: _topWorkers)),
                  ],
                ),
                const SizedBox(height: 20),
                _buildGlobalStats(),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildGlobalStats() {
    if (_stats == null) return const SizedBox.shrink();

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 1.5,
            children: [
              _buildStatCard(
                'Total Demonstrators',
                _stats!.totalWorkers.toString(),
              ),
              _buildStatCard(
                'Total Tasks Completed',
                _stats!.tasksCompleted.toString(),
              ),
              _buildStatCard(
                'Total Paid Out',
                '${formatNumberWithSeparator(_stats!.totalRewards)}\n\$VIRAL',
              ),
              _buildStatCard(
                'Active Forges',
                _stats!.activeForges.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return CardWidget(
      padding: CardPadding.none,
      variant: CardVariant.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: VMColors.primary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: VMColors.secondary,
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
