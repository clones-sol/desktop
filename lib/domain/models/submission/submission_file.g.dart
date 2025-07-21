// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmissionFileImpl _$$SubmissionFileImplFromJson(Map<String, dynamic> json) =>
    _$SubmissionFileImpl(
      file: json['file'] as String,
      storageKey: json['storageKey'] as String,
      size: (json['size'] as num).toInt(),
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$SubmissionFileImplToJson(
        _$SubmissionFileImpl instance) =>
    <String, dynamic>{
      'file': instance.file,
      'storageKey': instance.storageKey,
      'size': instance.size,
      '_id': instance.id,
    };
