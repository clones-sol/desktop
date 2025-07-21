// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenBalanceImpl _$$TokenBalanceImplFromJson(Map<String, dynamic> json) =>
    _$TokenBalanceImpl(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String?,
      balance: (json['balance'] as num?)?.toDouble(),
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$TokenBalanceImplToJson(_$TokenBalanceImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'logoUrl': instance.logoUrl,
      'balance': instance.balance,
      'isLoading': instance.isLoading,
    };
