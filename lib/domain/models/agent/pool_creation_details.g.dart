// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pool_creation_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoolCreationDetailsImpl _$$PoolCreationDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$PoolCreationDetailsImpl(
      txHash: json['txHash'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      slot: (json['slot'] as num).toInt(),
    );

Map<String, dynamic> _$$PoolCreationDetailsImplToJson(
        _$PoolCreationDetailsImpl instance) =>
    <String, dynamic>{
      'txHash': instance.txHash,
      'timestamp': instance.timestamp,
      'slot': instance.slot,
    };
