// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extended_pool.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExtendedPoolImpl _$$ExtendedPoolImplFromJson(Map<String, dynamic> json) =>
    _$ExtendedPoolImpl(
      base: TrainingPool.fromJson(json['base'] as Map<String, dynamic>),
      unsavedName: json['unsavedName'] as bool? ?? false,
      unsavedPrice: json['unsavedPrice'] as bool? ?? false,
      unsavedSkills: json['unsavedSkills'] as bool? ?? false,
      tokenBalance: (json['tokenBalance'] as num?)?.toDouble(),
      solBalanceOverride: (json['solBalanceOverride'] as num?)?.toDouble(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$ExtendedPoolImplToJson(_$ExtendedPoolImpl instance) =>
    <String, dynamic>{
      'base': instance.base,
      'unsavedName': instance.unsavedName,
      'unsavedPrice': instance.unsavedPrice,
      'unsavedSkills': instance.unsavedSkills,
      'tokenBalance': instance.tokenBalance,
      'solBalanceOverride': instance.solBalanceOverride,
      'createdAt': instance.createdAt,
    };
