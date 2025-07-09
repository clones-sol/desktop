// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenImpl _$$TokenImplFromJson(Map<String, dynamic> json) => _$TokenImpl(
      type: $enumDecode(_$TokenTypeEnumMap, json['type']),
      symbol: json['symbol'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$TokenImplToJson(_$TokenImpl instance) =>
    <String, dynamic>{
      'type': _$TokenTypeEnumMap[instance.type]!,
      'symbol': instance.symbol,
      'address': instance.address,
    };

const _$TokenTypeEnumMap = {
  TokenType.sol: 'SOL',
  TokenType.clones: 'CLNS',
  TokenType.custom: 'CUSTOM',
};
