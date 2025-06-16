// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forge_app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgeAppImpl _$$ForgeAppImplFromJson(Map<String, dynamic> json) =>
    _$ForgeAppImpl(
      id: json['_id'] as String?,
      name: json['name'] as String,
      domain: json['domain'] as String,
      description: json['description'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => ForgeTaskItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      poolId: json['pool_id'] == null
          ? null
          : PoolId.fromJson(json['pool_id'] as Map<String, dynamic>),
      seen: json['seen'] as bool?,
      gymLimitReached: json['gymLimitReached'] as bool?,
      gymSubmissions: (json['gymSubmissions'] as num?)?.toInt(),
      gymLimitType: json['gymLimitType'] as String?,
      gymLimitValue: (json['gymLimitValue'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ForgeAppImplToJson(_$ForgeAppImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) '_id': value,
      'name': instance.name,
      'domain': instance.domain,
      'description': instance.description,
      'categories': instance.categories,
      'tasks': instance.tasks,
      if (instance.poolId case final value?) 'pool_id': value,
      if (instance.seen case final value?) 'seen': value,
      if (instance.gymLimitReached case final value?) 'gymLimitReached': value,
      if (instance.gymSubmissions case final value?) 'gymSubmissions': value,
      if (instance.gymLimitType case final value?) 'gymLimitType': value,
      if (instance.gymLimitValue case final value?) 'gymLimitValue': value,
    };
