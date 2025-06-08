import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_leader_board.freezed.dart';
part 'worker_leader_board.g.dart';

@freezed
class WorkerLeaderboard with _$WorkerLeaderboard {
  const factory WorkerLeaderboard({
    required int rank,
    required String address,
    String? nickname,
    required int tasks,
    required double rewards,
    required double avgScore,
  }) = _WorkerLeaderboard;

  factory WorkerLeaderboard.fromJson(Map<String, dynamic> json) =>
      _$WorkerLeaderboardFromJson(json);
}
