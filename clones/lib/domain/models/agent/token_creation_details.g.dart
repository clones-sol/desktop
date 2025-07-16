// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_creation_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenCreationDetailsImpl _$$TokenCreationDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$TokenCreationDetailsImpl(
      txHash: json['txHash'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      slot: (json['slot'] as num).toInt(),
    );

Map<String, dynamic> _$$TokenCreationDetailsImplToJson(
        _$TokenCreationDetailsImpl instance) =>
    <String, dynamic>{
      'txHash': instance.txHash,
      'timestamp': instance.timestamp,
      'slot': instance.slot,
    };
