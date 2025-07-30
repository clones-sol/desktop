// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_referral_info_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
