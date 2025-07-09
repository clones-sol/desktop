// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadMetadataImpl _$$UploadMetadataImplFromJson(Map<String, dynamic> json) =>
    _$UploadMetadataImpl(
      id: json['id'] as String,
      poolId: json['poolId'] as String?,
      generatedTime: (json['generatedTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UploadMetadataImplToJson(
        _$UploadMetadataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poolId': instance.poolId,
      'generatedTime': instance.generatedTime,
    };
