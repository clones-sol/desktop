// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forge_task/forge_app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgeAppImpl _$$ForgeAppImplFromJson(Map<String, dynamic> json) =>
    _$ForgeAppImpl(
      name: json['name'] as String,
      domain: json['domain'] as String,
      description: json['description'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => ForgeTaskItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      poolId: PoolId.fromJson(json['poolId'] as Map<String, dynamic>),
      seen: json['seen'] as bool?,
      gymLimitReached: json['gymLimitReached'] as bool?,
      gymSubmissions: (json['gymSubmissions'] as num?)?.toInt(),
      gymLimitType: json['gymLimitType'] as String?,
      gymLimitValue: (json['gymLimitValue'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ForgeAppImplToJson(_$ForgeAppImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'domain': instance.domain,
      'description': instance.description,
      'categories': instance.categories,
      'tasks': instance.tasks,
      'poolId': instance.poolId,
      'seen': instance.seen,
      'gymLimitReached': instance.gymLimitReached,
      'gymSubmissions': instance.gymSubmissions,
      'gymLimitType': instance.gymLimitType,
      'gymLimitValue': instance.gymLimitValue,
    };
