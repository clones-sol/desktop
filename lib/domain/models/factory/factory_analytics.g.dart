// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'factory_analytics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FactoryAnalyticsImpl _$$FactoryAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$FactoryAnalyticsImpl(
      totalFactories: (json['totalFactories'] as num?)?.toInt() ?? 0,
      activeFactories: (json['activeFactories'] as num?)?.toInt() ?? 0,
      totalBalance: (json['totalBalance'] as num?)?.toDouble() ?? 0.0,
      totalDemonstrations: (json['totalDemonstrations'] as num?)?.toInt() ?? 0,
      averageFactorySize:
          (json['averageFactorySize'] as num?)?.toDouble() ?? 0.0,
      topSkills: (json['topSkills'] as List<dynamic>?)
              ?.map((e) => SkillCount.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      topTokens: (json['topTokens'] as List<dynamic>?)
              ?.map((e) => TokenBalance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FactoryAnalyticsImplToJson(
        _$FactoryAnalyticsImpl instance) =>
    <String, dynamic>{
      'totalFactories': instance.totalFactories,
      'activeFactories': instance.activeFactories,
      'totalBalance': instance.totalBalance,
      'totalDemonstrations': instance.totalDemonstrations,
      'averageFactorySize': instance.averageFactorySize,
      'topSkills': instance.topSkills,
      'topTokens': instance.topTokens,
    };
