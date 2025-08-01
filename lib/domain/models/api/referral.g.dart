// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralImpl _$$ReferralImplFromJson(Map<String, dynamic> json) =>
    _$ReferralImpl(
      referrerAddress: json['referrerAddress'] as String,
      referreeAddress: json['referreeAddress'] as String,
      referralCode: json['referralCode'] as String,
      referralLink: json['referralLink'] as String,
      firstActionType: json['firstActionType'] as String,
      firstActionData: json['firstActionData'] as Map<String, dynamic>?,
      onChainTxHash: json['onChainTxHash'] as String?,
      onChainSlot: (json['onChainSlot'] as num?)?.toInt(),
      rewardAmount: (json['rewardAmount'] as num?)?.toDouble() ?? 0,
      rewardProcessed: json['rewardProcessed'] as bool? ?? false,
      status: json['status'] as String? ?? 'pending',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ReferralImplToJson(_$ReferralImpl instance) =>
    <String, dynamic>{
      'referrerAddress': instance.referrerAddress,
      'referreeAddress': instance.referreeAddress,
      'referralCode': instance.referralCode,
      'referralLink': instance.referralLink,
      'firstActionType': instance.firstActionType,
      'firstActionData': instance.firstActionData,
      'onChainTxHash': instance.onChainTxHash,
      'onChainSlot': instance.onChainSlot,
      'rewardAmount': instance.rewardAmount,
      'rewardProcessed': instance.rewardProcessed,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
