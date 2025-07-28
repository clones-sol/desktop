import 'package:freezed_annotation/freezed_annotation.dart';

part 'factory_settings.freezed.dart';
part 'factory_settings.g.dart';

@freezed
class FactorySettings with _$FactorySettings {
  const factory FactorySettings({
    @Default(true) bool hideAdult,
    @Default(0) int minPrice,
    @Default(500) int maxPrice,
  }) = _FactorySettings;

  factory FactorySettings.fromJson(Map<String, dynamic> json) =>
      _$FactorySettingsFromJson(json);
}
