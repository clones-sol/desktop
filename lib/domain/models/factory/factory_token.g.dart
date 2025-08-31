// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'factory_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FactoryTokenImpl _$$FactoryTokenImplFromJson(Map<String, dynamic> json) =>
    _$FactoryTokenImpl(
      type: json['type'] as String,
      symbol: json['symbol'] as String,
      address: json['address'] as String,
      decimals: (json['decimals'] as num?)?.toInt() ?? 18,
    );

Map<String, dynamic> _$$FactoryTokenImplToJson(_$FactoryTokenImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'symbol': instance.symbol,
      'address': instance.address,
      'decimals': instance.decimals,
    };
