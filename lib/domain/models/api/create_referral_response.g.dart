// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_referral_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
