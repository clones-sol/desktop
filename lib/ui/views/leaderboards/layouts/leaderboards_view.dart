import 'dart:ui';

import 'package:clones_desktop/application/leaderboard.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/domain/models/leaderboard/forge_leader_board.dart';
import 'package:clones_desktop/domain/models/leaderboard/stats_leader_board.dart';
import 'package:clones_desktop/domain/models/leaderboard/worker_leader_board.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/components/design_widget/message_box/message_box.dart';
import 'package:clones_desktop/ui/views/leaderboards/layouts/components/leaderboards_stat_active_forges.dart';
import 'package:clones_desktop/ui/views/leaderboards/layouts/components/leaderboards_stat_total_demos.dart';
import 'package:clones_desktop/ui/views/leaderboards/layouts/components/leaderboards_stat_total_paid_out.dart';
import 'package:clones_desktop/ui/views/leaderboards/layouts/components/leaderboards_stat_total_tasks.dart';
import 'package:clones_desktop/ui/views/leaderboards/layouts/components/top_forges.dart';
import 'package:clones_desktop/ui/views/leaderboards/layouts/components/top_workers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaderboardsView extends ConsumerStatefulWidget {
  const LeaderboardsView({super.key});

  static const String routeName = '/leaderboards';

  @override
  ConsumerState<LeaderboardsView> createState() => _LeaderboardsViewState();
}

class _LeaderboardsViewState extends ConsumerState<LeaderboardsView> {
  bool _loading = true;
  String? _error;

  List<WorkerLeaderboard> _topWorkers = [];
  List<ForgeLeaderboard> _topForges = [];
  LeaderboardStats? _stats;

  bool _forgesFullscreen = false;
  bool _workersFullscreen = false;

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
        _topWorkers = (data['workersLeaderboard'] as List<WorkerLeaderboard>)
          ..sort((a, b) => b.avgScore.compareTo(a.avgScore));

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
    return LayoutBuilder(
      builder: (context, constraints) {
        final overlayHeight = constraints.maxHeight * 0.9 - 100;
        return Stack(
          children: [
            Padding(
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
                          color: ClonesColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (_loading)
                    const Center(child: CircularProgressIndicator())
                  else if (_error != null)
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MessageBox(
                            messageBoxType: MessageBoxType.warning,
                            content: Text(
                              _error!,
                            ),
                          ),
                          const SizedBox(height: 24),
                          BtnPrimary(
                            buttonText: 'Retry',
                            onTap: _loadLeaderboardData,
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
                            Expanded(
                              child: TopForges(
                                forges: _topForges,
                                onExpand: () =>
                                    setState(() => _forgesFullscreen = true),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: TopWorkers(
                                workers: _topWorkers,
                                onExpand: () =>
                                    setState(() => _workersFullscreen = true),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildGlobalStats(),
                      ],
                    ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutCubic,
              top: 0,
              width: _forgesFullscreen ? constraints.maxWidth : 0,
              height: constraints.maxHeight,
              child: IgnorePointer(
                ignoring: !_forgesFullscreen,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _forgesFullscreen ? 1.0 : 0.0,
                  child: Material(
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                          child: Container(
                            color: Colors.black.withValues(alpha: 0.3),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOutCubic,
                          width: _forgesFullscreen ? constraints.maxWidth : 0,
                          height: _forgesFullscreen ? constraints.maxHeight : 0,
                          child: _forgesFullscreen
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(32),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Top Forges',
                                            style: TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                              color: ClonesColors.primary,
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.close_fullscreen,
                                              color: ClonesColors.secondary,
                                              size: 32,
                                            ),
                                            tooltip: 'Close',
                                            onPressed: () => setState(
                                              () => _forgesFullscreen = false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32,
                                        ),
                                        child: TopForges(
                                          forges: _topForges,
                                          showTitle: false,
                                          listHeight: overlayHeight - 80,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutCubic,
              top: 0,
              width: _workersFullscreen ? constraints.maxWidth : 0,
              height: constraints.maxHeight,
              child: IgnorePointer(
                ignoring: !_workersFullscreen,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _workersFullscreen ? 1.0 : 0.0,
                  child: Material(
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                          child: Container(
                            color: Colors.black.withValues(alpha: 0.3),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOutCubic,
                          width: _workersFullscreen ? constraints.maxWidth : 0,
                          height:
                              _workersFullscreen ? constraints.maxHeight : 0,
                          child: _workersFullscreen
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(32),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Top Workers',
                                            style: TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                              color: ClonesColors.primary,
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.close_fullscreen,
                                              color: ClonesColors.secondary,
                                              size: 32,
                                            ),
                                            tooltip: 'Close',
                                            onPressed: () => setState(
                                              () => _workersFullscreen = false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32,
                                        ),
                                        child: TopWorkers(
                                          workers: _topWorkers,
                                          showTitle: false,
                                          listHeight:
                                              constraints.maxHeight - 250,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildGlobalStats() {
    if (_stats == null) return const SizedBox.shrink();

    return SizedBox(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          LeaderboardsStatTotalDemos(stat: _stats!),
          LeaderboardsStatTotalTasks(stat: _stats!),
          LeaderboardsStatTotalPaidOut(stat: _stats!),
          LeaderboardsStatActiveForges(stat: _stats!),
        ],
      ),
    );
  }
}
