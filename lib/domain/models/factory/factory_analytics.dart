// ignore_for_file: invalid_annotation_target

import 'package:clones_desktop/domain/models/factory/skill_count.dart';
import 'package:clones_desktop/domain/models/factory/token_balance.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'factory_analytics.freezed.dart';
part 'factory_analytics.g.dart';

/// Factory analytics
///
@freezed
class FactoryAnalytics with _$FactoryAnalytics {
  const factory FactoryAnalytics({
    @Default(0) int totalFactories,
    @Default(0) int activeFactories,
    @Default(0.0) double totalBalance,
    @Default(0) int totalDemonstrations,
    @Default(0.0) double averageFactorySize,
    @Default([]) List<SkillCount> topSkills,
    @Default([]) List<TokenBalance> topTokens,
  }) = _FactoryAnalytics;

  factory FactoryAnalytics.fromJson(Map<String, dynamic> json) =>
      _$FactoryAnalyticsFromJson(json);
}
