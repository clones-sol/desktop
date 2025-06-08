// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treasury_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreasuryTransferImpl _$$TreasuryTransferImplFromJson(
        Map<String, dynamic> json) =>
    _$TreasuryTransferImpl(
      tokenAddress: json['tokenAddress'] as String,
      treasuryWallet: json['treasuryWallet'] as String,
      amount: (json['amount'] as num).toInt(),
      timestamp: (json['timestamp'] as num).toInt(),
      txHash: json['txHash'] as String,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$TreasuryTransferImplToJson(
        _$TreasuryTransferImpl instance) =>
    <String, dynamic>{
      'tokenAddress': instance.tokenAddress,
      'treasuryWallet': instance.treasuryWallet,
      'amount': instance.amount,
      'timestamp': instance.timestamp,
      'txHash': instance.txHash,
      '_id': instance.id,
    };
