// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_referral_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateReferralDataImpl _$$CreateReferralDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateReferralDataImpl(
      referralCode: json['referralCode'] as String,
      referralLink: json['referralLink'] as String,
      walletAddress: json['walletAddress'] as String,
    );

Map<String, dynamic> _$$CreateReferralDataImplToJson(
        _$CreateReferralDataImpl instance) =>
    <String, dynamic>{
      'referralCode': instance.referralCode,
      'referralLink': instance.referralLink,
      'walletAddress': instance.walletAddress,
    };
