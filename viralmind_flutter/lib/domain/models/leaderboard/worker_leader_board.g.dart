// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_leader_board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkerLeaderboardImpl _$$WorkerLeaderboardImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkerLeaderboardImpl(
      rank: (json['rank'] as num).toInt(),
      address: json['address'] as String,
      tasks: (json['tasks'] as num).toInt(),
      rewards: (json['rewards'] as num).toDouble(),
      avgScore: (json['avgScore'] as num).toDouble(),
    );

Map<String, dynamic> _$$WorkerLeaderboardImplToJson(
        _$WorkerLeaderboardImpl instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'address': instance.address,
      'tasks': instance.tasks,
      'rewards': instance.rewards,
      'avgScore': instance.avgScore,
    };
