// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_limit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadLimitImpl _$$UploadLimitImplFromJson(Map<String, dynamic> json) =>
    _$UploadLimitImpl(
      type: (json['type'] as num).toInt(),
      limitType: $enumDecode(_$UploadLimitTypeEnumMap, json['limitType']),
    );

Map<String, dynamic> _$$UploadLimitImplToJson(_$UploadLimitImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'limitType': _$UploadLimitTypeEnumMap[instance.limitType]!,
    };

const _$UploadLimitTypeEnumMap = {
  UploadLimitType.perTask: 'per-task',
  UploadLimitType.perDay: 'per-day',
  UploadLimitType.total: 'total',
};
