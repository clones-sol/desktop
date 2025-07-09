// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeletedRangeImpl _$$DeletedRangeImplFromJson(Map<String, dynamic> json) =>
    _$DeletedRangeImpl(
      start: (json['start'] as num).toInt(),
      end: (json['end'] as num).toInt(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$DeletedRangeImplToJson(_$DeletedRangeImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
      'count': instance.count,
    };
