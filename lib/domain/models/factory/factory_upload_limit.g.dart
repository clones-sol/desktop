// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'factory_upload_limit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FactoryUploadLimitImpl _$$FactoryUploadLimitImplFromJson(
        Map<String, dynamic> json) =>
    _$FactoryUploadLimitImpl(
      value: (json['value'] as num).toInt(),
      type: $enumDecode(_$UploadLimitTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$FactoryUploadLimitImplToJson(
        _$FactoryUploadLimitImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'type': _$UploadLimitTypeEnumMap[instance.type]!,
    };

const _$UploadLimitTypeEnumMap = {
  UploadLimitType.perTask: 'per-task',
  UploadLimitType.perDay: 'per-day',
  UploadLimitType.total: 'total',
};
