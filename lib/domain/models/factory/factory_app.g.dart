// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'factory_app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FactoryAppImpl _$$FactoryAppImplFromJson(Map<String, dynamic> json) =>
    _$FactoryAppImpl(
      id: json['_id'] as String?,
      name: json['name'] as String,
      domain: json['domain'] as String,
      description: json['description'] as String?,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => FactoryTask.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      poolId: json['pool_id'] as String?,
    );

Map<String, dynamic> _$$FactoryAppImplToJson(_$FactoryAppImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'domain': instance.domain,
      'description': instance.description,
      'categories': instance.categories,
      'tasks': instance.tasks,
      'pool_id': instance.poolId,
    };
