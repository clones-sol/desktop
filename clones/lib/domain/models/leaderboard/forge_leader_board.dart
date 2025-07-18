import 'package:freezed_annotation/freezed_annotation.dart';

part 'forge_leader_board.freezed.dart';
part 'forge_leader_board.g.dart';

@freezed
class ForgeLeaderboard with _$ForgeLeaderboard {
  const factory ForgeLeaderboard({
    required int rank,
    required String name,
    required int tasks,
    required double payout,
  }) = _ForgeLeaderboard;

  factory ForgeLeaderboard.fromJson(Map<String, dynamic> json) =>
      _$ForgeLeaderboardFromJson(json);
}
