// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chunked_uploader.dart';

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
  _$UploadProgressImpl instance,
) => <String, dynamic>{
  'uploadId': instance.uploadId,
  'chunkIndex': instance.chunkIndex,
  'received': instance.received,
  'total': instance.total,
  'progress': instance.progress,
};

_$UploadMetadataImpl _$$UploadMetadataImplFromJson(Map<String, dynamic> json) =>
    _$UploadMetadataImpl(
      poolId: json['poolId'] as String?,
      generatedTime: (json['generatedTime'] as num?)?.toInt(),
      id: json['id'] as String,
    );

Map<String, dynamic> _$$UploadMetadataImplToJson(
  _$UploadMetadataImpl instance,
) => <String, dynamic>{
  'poolId': instance.poolId,
  'generatedTime': instance.generatedTime,
  'id': instance.id,
};
