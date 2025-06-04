// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_pool.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenImpl _$$TokenImplFromJson(Map<String, dynamic> json) => _$TokenImpl(
  type: $enumDecode(_$TokenTypeEnumMap, json['type']),
  symbol: json['symbol'] as String,
  address: json['address'] as String,
);

Map<String, dynamic> _$$TokenImplToJson(_$TokenImpl instance) =>
    <String, dynamic>{
      'type': _$TokenTypeEnumMap[instance.type]!,
      'symbol': instance.symbol,
      'address': instance.address,
    };

const _$TokenTypeEnumMap = {
  TokenType.sol: 'sol',
  TokenType.viral: 'viral',
  TokenType.custom: 'custom',
};

_$TrainingPoolImpl _$$TrainingPoolImplFromJson(Map<String, dynamic> json) =>
    _$TrainingPoolImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      status: $enumDecode(_$TrainingPoolStatusEnumMap, json['status']),
      demonstrations: (json['demonstrations'] as num).toInt(),
      funds: (json['funds'] as num).toDouble(),
      solBalance: (json['solBalance'] as num).toDouble(),
      token: Token.fromJson(json['token'] as Map<String, dynamic>),
      skills: json['skills'] as String,
      ownerEmail: json['ownerEmail'] as String?,
      ownerAddress: json['ownerAddress'] as String,
      depositAddress: json['depositAddress'] as String,
      expanded: json['expanded'] as bool?,
      unsavedSkills: json['unsavedSkills'] as bool?,
      pricePerDemo: (json['pricePerDemo'] as num?)?.toDouble(),
      unsavedPrice: json['unsavedPrice'] as bool?,
      uploadLimit:
          json['uploadLimit'] == null
              ? null
              : UploadLimit.fromJson(
                json['uploadLimit'] as Map<String, dynamic>,
              ),
      unsavedUploadLimit: json['unsavedUploadLimit'] as bool?,
    );

Map<String, dynamic> _$$TrainingPoolImplToJson(_$TrainingPoolImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
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
    };

const _$TrainingPoolStatusEnumMap = {
  TrainingPoolStatus.live: 'live',
  TrainingPoolStatus.paused: 'paused',
  TrainingPoolStatus.noFunds: 'noFunds',
  TrainingPoolStatus.noGas: 'noGas',
};

_$UploadLimitImpl _$$UploadLimitImplFromJson(Map<String, dynamic> json) =>
    _$UploadLimitImpl(
      type: (json['type'] as num).toInt(),
      limitType: json['limitType'] as String,
    );

Map<String, dynamic> _$$UploadLimitImplToJson(_$UploadLimitImpl instance) =>
    <String, dynamic>{'type': instance.type, 'limitType': instance.limitType};

_$CreatePoolInputImpl _$$CreatePoolInputImplFromJson(
  Map<String, dynamic> json,
) => _$CreatePoolInputImpl(
  name: json['name'] as String,
  skills: json['skills'] as String,
  token: Token.fromJson(json['token'] as Map<String, dynamic>),
  ownerAddress: json['ownerAddress'] as String,
);

Map<String, dynamic> _$$CreatePoolInputImplToJson(
  _$CreatePoolInputImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'skills': instance.skills,
  'token': instance.token,
  'ownerAddress': instance.ownerAddress,
};

_$UpdatePoolInputImpl _$$UpdatePoolInputImplFromJson(
  Map<String, dynamic> json,
) => _$UpdatePoolInputImpl(
  id: json['id'] as String,
  status: $enumDecodeNullable(_$TrainingPoolStatusEnumMap, json['status']),
  skills: json['skills'] as String?,
  pricePerDemo: (json['pricePerDemo'] as num?)?.toDouble(),
  uploadLimit:
      json['uploadLimit'] == null
          ? null
          : UploadLimit.fromJson(json['uploadLimit'] as Map<String, dynamic>),
  apps: json['apps'] as List<dynamic>?,
);

Map<String, dynamic> _$$UpdatePoolInputImplToJson(
  _$UpdatePoolInputImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': _$TrainingPoolStatusEnumMap[instance.status],
  'skills': instance.skills,
  'pricePerDemo': instance.pricePerDemo,
  'uploadLimit': instance.uploadLimit,
  'apps': instance.apps,
};
