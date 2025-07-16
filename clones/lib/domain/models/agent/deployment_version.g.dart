// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deployment_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeploymentVersionImpl _$$DeploymentVersionImplFromJson(
        Map<String, dynamic> json) =>
    _$DeploymentVersionImpl(
      versionTag: json['versionTag'] as String,
      customUrl: json['customUrl'] as String?,
      encryptedApiKey: json['encryptedApiKey'] as String?,
      status: $enumDecode(_$DeploymentVersionStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$DeploymentVersionImplToJson(
        _$DeploymentVersionImpl instance) =>
    <String, dynamic>{
      'versionTag': instance.versionTag,
      'customUrl': instance.customUrl,
      'encryptedApiKey': instance.encryptedApiKey,
      'status': _$DeploymentVersionStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$DeploymentVersionStatusEnumMap = {
  DeploymentVersionStatus.active: 'active',
  DeploymentVersionStatus.deprecated: 'deprecated',
};
