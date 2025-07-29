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
      referralCode: json['referralCode'] as String,
      referralLink: json['referralLink'] as String,
      walletAddress: json['walletAddress'] as String,
      success: json['success'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$CreateReferralResponseImplToJson(
        _$CreateReferralResponseImpl instance) =>
    <String, dynamic>{
      'referralCode': instance.referralCode,
      'referralLink': instance.referralLink,
      'walletAddress': instance.walletAddress,
      'success': instance.success,
      'message': instance.message,
    };

_$GetReferralInfoResponseImpl _$$GetReferralInfoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetReferralInfoResponseImpl(
      referralCode: json['referralCode'] as String,
      referralLink: json['referralLink'] as String,
      walletAddress: json['walletAddress'] as String,
      totalReferrals: (json['totalReferrals'] as num).toInt(),
      totalRewards: (json['totalRewards'] as num).toDouble(),
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      success: json['success'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$GetReferralInfoResponseImplToJson(
        _$GetReferralInfoResponseImpl instance) =>
    <String, dynamic>{
      'referralCode': instance.referralCode,
      'referralLink': instance.referralLink,
      'walletAddress': instance.walletAddress,
      'totalReferrals': instance.totalReferrals,
      'totalRewards': instance.totalRewards,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'success': instance.success,
      'message': instance.message,
    };
