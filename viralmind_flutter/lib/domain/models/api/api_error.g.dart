// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiErrorImpl _$$ApiErrorImplFromJson(Map<String, dynamic> json) =>
    _$ApiErrorImpl(
      status: (json['status'] as num).toInt(),
      statusText: json['statusText'] as String,
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$$ApiErrorImplToJson(_$ApiErrorImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusText': instance.statusText,
      'message': instance.message,
      'data': instance.data,
    };
