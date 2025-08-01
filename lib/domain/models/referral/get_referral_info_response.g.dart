// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_referral_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetReferralInfoResponseImpl _$$GetReferralInfoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetReferralInfoResponseImpl(
      totalReferrals: (json['totalReferrals'] as num).toInt(),
      totalRewards: (json['totalRewards'] as num).toDouble(),
      referralCode: json['referralCode'] as String,
      referrals: (json['referrals'] as List<dynamic>)
          .map((e) => Referral.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetReferralInfoResponseImplToJson(
        _$GetReferralInfoResponseImpl instance) =>
    <String, dynamic>{
      'totalReferrals': instance.totalReferrals,
      'totalRewards': instance.totalRewards,
      'referralCode': instance.referralCode,
      'referrals': instance.referrals,
    };
