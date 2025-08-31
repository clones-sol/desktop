// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'factory_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FactorySettingsImpl _$$FactorySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$FactorySettingsImpl(
      hideAdult: json['hideAdult'] as bool? ?? true,
      minPrice: (json['minPrice'] as num?)?.toInt() ?? 0,
      maxPrice: (json['maxPrice'] as num?)?.toInt() ?? 500,
    );

Map<String, dynamic> _$$FactorySettingsImplToJson(
        _$FactorySettingsImpl instance) =>
    <String, dynamic>{
      'hideAdult': instance.hideAdult,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
    };
