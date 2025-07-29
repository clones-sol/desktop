// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateReferralRequestImpl _$$CreateReferralRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateReferralRequestImpl(
      walletAddress: json['walletAddress'] as String,
    );

Map<String, dynamic> _$$CreateReferralRequestImplToJson(
        _$CreateReferralRequestImpl instance) =>
    <String, dynamic>{
      'walletAddress': instance.walletAddress,
    };

_$CreateReferralResponseImpl _$$CreateReferralResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateReferralResponseImpl(
      success: json['success'] as bool,
      data: CreateReferralData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$CreateReferralResponseImplToJson(
        _$CreateReferralResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

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

_$GetReferralInfoResponseImpl _$$GetReferralInfoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetReferralInfoResponseImpl(
      success: json['success'] as bool,
      data: GetReferralInfoData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$GetReferralInfoResponseImplToJson(
        _$GetReferralInfoResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

_$GetReferralInfoDataImpl _$$GetReferralInfoDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GetReferralInfoDataImpl(
      totalReferrals: (json['totalReferrals'] as num).toInt(),
      totalRewards: (json['totalRewards'] as num).toDouble(),
      referralCode: json['referralCode'] as String,
      referrals: json['referrals'] as List<dynamic>,
    );

Map<String, dynamic> _$$GetReferralInfoDataImplToJson(
        _$GetReferralInfoDataImpl instance) =>
    <String, dynamic>{
      'totalReferrals': instance.totalReferrals,
      'totalRewards': instance.totalRewards,
      'referralCode': instance.referralCode,
      'referrals': instance.referrals,
    };
