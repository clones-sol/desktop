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
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => ForgeTaskItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      poolId: json['pool_id'] == null
          ? null
          : PoolId.fromJson(json['pool_id'] as Map<String, dynamic>),
      seen: json['seen'] as bool?,
      factoryLimitReached: json['factoryLimitReached'] as bool?,
      factorySubmissions: (json['factorySubmissions'] as num?)?.toInt(),
      factoryLimitType: json['factoryLimitType'] as String?,
      factoryLimitValue: (json['factoryLimitValue'] as num?)?.toInt(),
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
      if (instance.factoryLimitReached case final value?)
        'factoryLimitReached': value,
      if (instance.factorySubmissions case final value?)
        'factorySubmissions': value,
      if (instance.factoryLimitType case final value?)
        'factoryLimitType': value,
      if (instance.factoryLimitValue case final value?)
        'factoryLimitValue': value,
    };
