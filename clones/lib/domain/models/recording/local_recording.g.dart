// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_recording.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalRecordingImpl _$$LocalRecordingImplFromJson(Map<String, dynamic> json) =>
    _$LocalRecordingImpl(
      id: json['id'] as String,
      timestamp: json['timestamp'] as String,
      durationSeconds: (json['durationSeconds'] as num).toInt(),
      status: json['status'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      platform: json['platform'] as String,
      arch: json['arch'] as String,
      version: json['version'] as String,
      locale: json['locale'] as String,
      primaryMonitor:
          MonitorInfo.fromJson(json['primaryMonitor'] as Map<String, dynamic>),
      quest: json['quest'] == null
          ? null
          : Quest.fromJson(json['quest'] as Map<String, dynamic>),
      submission: json['submission'] == null
          ? null
          : SubmissionStatus.fromJson(
              json['submission'] as Map<String, dynamic>),
      location: json['location'] as String?,
    );

Map<String, dynamic> _$$LocalRecordingImplToJson(
        _$LocalRecordingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp,
      'durationSeconds': instance.durationSeconds,
      'status': instance.status,
      'title': instance.title,
      'description': instance.description,
      'platform': instance.platform,
      'arch': instance.arch,
      'version': instance.version,
      'locale': instance.locale,
      'primaryMonitor': instance.primaryMonitor,
      'quest': instance.quest,
      'submission': instance.submission,
      'location': instance.location,
    };
