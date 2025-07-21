import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_info.freezed.dart';
part 'reward_info.g.dart';

@freezed
class RewardInfo with _$RewardInfo {
  const factory RewardInfo({
    required int time,
    required int maxReward,
  }) = _RewardInfo;

  factory RewardInfo.fromJson(Map<String, dynamic> json) =>
      _$RewardInfoFromJson(json);
}
