import 'package:freezed_annotation/freezed_annotation.dart';

part 'gym_settings.freezed.dart';
part 'gym_settings.g.dart';

@freezed
class GymSettings with _$GymSettings {
  const factory GymSettings({
    @Default(true) bool hideAdult,
    @Default(0) int minPrice,
    @Default(500) int maxPrice,
  }) = _GymSettings;

  factory GymSettings.fromJson(Map<String, dynamic> json) =>
      _$GymSettingsFromJson(json);
}
