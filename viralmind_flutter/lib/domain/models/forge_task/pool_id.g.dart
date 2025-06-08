// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pool_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoolIdImpl _$$PoolIdImplFromJson(Map<String, dynamic> json) => _$PoolIdImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      pricePerDemo: (json['pricePerDemo'] as num).toDouble(),
    );

Map<String, dynamic> _$$PoolIdImplToJson(_$PoolIdImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'pricePerDemo': instance.pricePerDemo,
    };
