// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppInfoImpl _$$AppInfoImplFromJson(Map<String, dynamic> json) =>
    _$AppInfoImpl(
      name: json['name'] as String,
      type: json['type'] as String,
      url: json['url'] as String,
      taskId: json['taskId'] as String?,
    );

Map<String, dynamic> _$$AppInfoImplToJson(_$AppInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'url': instance.url,
      'taskId': instance.taskId,
    };
