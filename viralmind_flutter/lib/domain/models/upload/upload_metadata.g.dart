// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadMetadataImpl _$$UploadMetadataImplFromJson(Map<String, dynamic> json) =>
    _$UploadMetadataImpl(
      poolId: json['poolId'] as String?,
      generatedTime: (json['generatedTime'] as num?)?.toInt(),
      id: json['id'] as String,
    );

Map<String, dynamic> _$$UploadMetadataImplToJson(
        _$UploadMetadataImpl instance) =>
    <String, dynamic>{
      'poolId': instance.poolId,
      'generatedTime': instance.generatedTime,
      'id': instance.id,
    };
