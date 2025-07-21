// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GymSettingsImpl _$$GymSettingsImplFromJson(Map<String, dynamic> json) =>
    _$GymSettingsImpl(
      hideAdult: json['hideAdult'] as bool? ?? true,
      minPrice: (json['minPrice'] as num?)?.toInt() ?? 0,
      maxPrice: (json['maxPrice'] as num?)?.toInt() ?? 500,
    );

Map<String, dynamic> _$$GymSettingsImplToJson(_$GymSettingsImpl instance) =>
    <String, dynamic>{
      'hideAdult': instance.hideAdult,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
    };
