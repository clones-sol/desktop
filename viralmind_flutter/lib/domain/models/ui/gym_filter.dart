import 'package:freezed_annotation/freezed_annotation.dart';

part 'gym_filter.freezed.dart';
part 'gym_filter.g.dart';

@freezed
class GymFilter with _$GymFilter {
  const factory GymFilter({
    required String poolId,
  }) = _GymFilter;

  factory GymFilter.fromJson(Map<String, dynamic> json) =>
      _$GymFilterFromJson(json);
}
