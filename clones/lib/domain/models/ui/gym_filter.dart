import 'package:freezed_annotation/freezed_annotation.dart';

part 'gym_filter.freezed.dart';
part 'gym_filter.g.dart';

@freezed
class GymFilter with _$GymFilter {
  const factory GymFilter({
    String? poolId,
    @JsonKey(includeIfNull: false) int? minReward,
    @JsonKey(includeIfNull: false) int? maxReward,
    @JsonKey(includeIfNull: false) String? query,
    @JsonKey(includeIfNull: false) List<String>? categories,
    @JsonKey(includeIfNull: false) bool? hideAdult,
  }) = _GymFilter;

  factory GymFilter.fromJson(Map<String, dynamic> json) =>
      _$GymFilterFromJson(json);
}
