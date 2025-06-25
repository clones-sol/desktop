import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/infrastructure/leaderboard.repository.dart';
import 'package:viralmind_flutter/utils/api_client.dart';

part 'leaderboard.g.dart';

@riverpod
LeaderboardRepositoryImpl leaderboardRepository(
  Ref ref,
) {
  final apiClient = ref.watch(apiClientProvider);
  return LeaderboardRepositoryImpl(apiClient);
}

@riverpod
Future<Map<String, dynamic>> getLeaderboardData(Ref ref) async {
  final leaderboardRepository = ref.read(leaderboardRepositoryProvider);
  return leaderboardRepository.getLeaderboardData();
}
