// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecordingMetaImpl _$$RecordingMetaImplFromJson(Map<String, dynamic> json) =>
    _$RecordingMetaImpl(
      id: json['id'] as String,
      timestamp: json['timestamp'] as String,
      duration_seconds: (json['duration_seconds'] as num).toInt(),
      status: json['status'] as String,
      reason: json['reason'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      platform: json['platform'] as String,
      arch: json['arch'] as String,
      version: json['version'] as String,
      locale: json['locale'] as String,
      primary_monitor:
          MonitorInfo.fromJson(json['primary_monitor'] as Map<String, dynamic>),
      quest: json['quest'] == null
          ? null
          : Quest.fromJson(json['quest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RecordingMetaImplToJson(_$RecordingMetaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp,
      'duration_seconds': instance.duration_seconds,
      'status': instance.status,
      'reason': instance.reason,
      'title': instance.title,
      'description': instance.description,
      'platform': instance.platform,
      'arch': instance.arch,
      'version': instance.version,
      'locale': instance.locale,
      'primary_monitor': instance.primary_monitor,
      'quest': instance.quest,
    };

_$MonitorInfoImpl _$$MonitorInfoImplFromJson(Map<String, dynamic> json) =>
    _$MonitorInfoImpl(
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
    );

Map<String, dynamic> _$$MonitorInfoImplToJson(_$MonitorInfoImpl instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };
