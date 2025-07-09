import 'package:clones/domain/models/api/request_options.dart';
import 'package:clones/domain/models/leaderboard/forge_leader_board.dart';
import 'package:clones/domain/models/leaderboard/stats_leader_board.dart';
import 'package:clones/domain/models/leaderboard/worker_leader_board.dart';
import 'package:clones/utils/api_client.dart';

class LeaderboardRepositoryImpl {
  LeaderboardRepositoryImpl(this._client);
  final ApiClient _client;

  Future<Map<String, dynamic>> getLeaderboardData() async {
    try {
      final data = await _client.get<Map<String, dynamic>>(
        '/gym/leaderboards',
        options: const RequestOptions(requiresAuth: true),
        fromJson: (json) => json as Map<String, dynamic>,
      );

      return {
        'workersLeaderboard': (data['workersLeaderboard'] as List)
            .map(
              (worker) => WorkerLeaderboard(
                rank: worker['rank'],
                address: worker['address'],
                tasks: worker['tasks'],
                rewards: worker['rewards'].toDouble(),
                avgScore: worker['avgScore'].toDouble(),
              ),
            )
            .toList(),
        'forgeLeaderboard': (data['forgeLeaderboard'] as List)
            .map(
              (forge) => ForgeLeaderboard(
                rank: forge['rank'],
                name: forge['name'],
                tasks: forge['tasks'],
                payout: forge['payout'].toDouble(),
              ),
            )
            .toList(),
        'stats': LeaderboardStats(
          totalWorkers: data['stats']['totalWorkers'],
          tasksCompleted: data['stats']['tasksCompleted'],
          totalRewards: data['stats']['totalRewards'].toDouble(),
          activeForges: data['stats']['activeForges'],
        ),
      };
    } catch (e) {
      throw Exception('Failed to load leaderboard data: $e');
    }
  }
}
