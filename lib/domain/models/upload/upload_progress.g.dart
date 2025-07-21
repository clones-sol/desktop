// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadProgressImpl _$$UploadProgressImplFromJson(Map<String, dynamic> json) =>
    _$UploadProgressImpl(
      uploadId: json['uploadId'] as String,
      chunkIndex: (json['chunkIndex'] as num).toInt(),
      received: (json['received'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      progress: (json['progress'] as num).toDouble(),
    );

Map<String, dynamic> _$$UploadProgressImplToJson(
        _$UploadProgressImpl instance) =>
    <String, dynamic>{
      'uploadId': instance.uploadId,
      'chunkIndex': instance.chunkIndex,
      'received': instance.received,
      'total': instance.total,
      'progress': instance.progress,
    };
