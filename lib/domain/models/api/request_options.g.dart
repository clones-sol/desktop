// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestOptionsImpl _$$RequestOptionsImplFromJson(Map<String, dynamic> json) =>
    _$RequestOptionsImpl(
      requiresAuth: json['requiresAuth'] as bool? ?? false,
      headers: (json['headers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$RequestOptionsImplToJson(
        _$RequestOptionsImpl instance) =>
    <String, dynamic>{
      'requiresAuth': instance.requiresAuth,
      'headers': instance.headers,
    };
