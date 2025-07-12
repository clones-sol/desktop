// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pool_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoolIdImpl _$$PoolIdImplFromJson(Map<String, dynamic> json) => _$PoolIdImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      pricePerDemo: (json['pricePerDemo'] as num).toDouble(),
      token: json['token'] == null
          ? null
          : Token.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PoolIdImplToJson(_$PoolIdImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'pricePerDemo': instance.pricePerDemo,
      if (instance.token case final value?) 'token': value,
    };
