import 'package:freezed_annotation/freezed_annotation.dart';

part 'demonstration_reward.freezed.dart';
part 'demonstration_reward.g.dart';

@freezed
class DemonstrationReward with _$DemonstrationReward {
  const factory DemonstrationReward({
    required int time,
    @JsonKey(name: 'max_reward') required int maxReward,
  }) = _DemonstrationReward;

  factory DemonstrationReward.fromJson(Map<String, dynamic> json) =>
      _$DemonstrationRewardFromJson(json);
}
