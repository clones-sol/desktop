// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_referral_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
