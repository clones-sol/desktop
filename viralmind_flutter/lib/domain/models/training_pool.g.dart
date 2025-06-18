// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_pool.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrainingPoolImpl _$$TrainingPoolImplFromJson(Map<String, dynamic> json) =>
    _$TrainingPoolImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      status: $enumDecode(_$TrainingPoolStatusEnumMap, json['status']),
      demonstrations: (json['demonstrations'] as num).toInt(),
      funds: (json['funds'] as num).toDouble(),
      solBalance: (json['solBalance'] as num?)?.toDouble(),
      token: Token.fromJson(json['token'] as Map<String, dynamic>),
      skills: json['skills'] as String,
      ownerEmail: json['ownerEmail'] as String?,
      ownerAddress: json['ownerAddress'] as String,
      depositAddress: json['depositAddress'] as String,
      expanded: json['expanded'] as bool? ?? false,
      unsavedSkills: json['unsavedSkills'] as bool? ?? false,
      pricePerDemo: (json['pricePerDemo'] as num?)?.toDouble(),
      unsavedPrice: json['unsavedPrice'] as bool? ?? false,
      uploadLimit: json['uploadLimit'] == null
          ? null
          : UploadLimit.fromJson(json['uploadLimit'] as Map<String, dynamic>),
      unsavedUploadLimit: json['unsavedUploadLimit'] as bool? ?? false,
      tokenBalance: (json['tokenBalance'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TrainingPoolImplToJson(_$TrainingPoolImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'status': _$TrainingPoolStatusEnumMap[instance.status]!,
      'demonstrations': instance.demonstrations,
      'funds': instance.funds,
      'solBalance': instance.solBalance,
      'token': instance.token,
      'skills': instance.skills,
      'ownerEmail': instance.ownerEmail,
      'ownerAddress': instance.ownerAddress,
      'depositAddress': instance.depositAddress,
      'expanded': instance.expanded,
      'unsavedSkills': instance.unsavedSkills,
      'pricePerDemo': instance.pricePerDemo,
      'unsavedPrice': instance.unsavedPrice,
      'uploadLimit': instance.uploadLimit,
      'unsavedUploadLimit': instance.unsavedUploadLimit,
      'tokenBalance': instance.tokenBalance,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$TrainingPoolStatusEnumMap = {
  TrainingPoolStatus.live: 'live',
  TrainingPoolStatus.paused: 'paused',
  TrainingPoolStatus.noFunds: 'no-funds',
  TrainingPoolStatus.noGas: 'no-gas',
};
