// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_blockchain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentBlockchainImpl _$$AgentBlockchainImplFromJson(
        Map<String, dynamic> json) =>
    _$AgentBlockchainImpl(
      tokenAddress: json['tokenAddress'] as String?,
      tokenCreationDetails: json['tokenCreationDetails'] == null
          ? null
          : TokenCreationDetails.fromJson(
              json['tokenCreationDetails'] as Map<String, dynamic>),
      poolAddress: json['poolAddress'] as String?,
      poolCreationDetails: json['poolCreationDetails'] == null
          ? null
          : PoolCreationDetails.fromJson(
              json['poolCreationDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AgentBlockchainImplToJson(
        _$AgentBlockchainImpl instance) =>
    <String, dynamic>{
      'tokenAddress': instance.tokenAddress,
      'tokenCreationDetails': instance.tokenCreationDetails,
      'poolAddress': instance.poolAddress,
      'poolCreationDetails': instance.poolCreationDetails,
    };
