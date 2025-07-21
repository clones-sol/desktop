// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forge_leader_board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgeLeaderboardImpl _$$ForgeLeaderboardImplFromJson(
        Map<String, dynamic> json) =>
    _$ForgeLeaderboardImpl(
      rank: (json['rank'] as num).toInt(),
      name: json['name'] as String,
      tasks: (json['tasks'] as num).toInt(),
      payout: (json['payout'] as num).toDouble(),
    );

Map<String, dynamic> _$$ForgeLeaderboardImplToJson(
        _$ForgeLeaderboardImpl instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'name': instance.name,
      'tasks': instance.tasks,
      'payout': instance.payout,
    };
