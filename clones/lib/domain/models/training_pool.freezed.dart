// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_pool.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrainingPool _$TrainingPoolFromJson(Map<String, dynamic> json) {
  return _TrainingPool.fromJson(json);
}

/// @nodoc
mixin _$TrainingPool {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  TrainingPoolStatus get status => throw _privateConstructorUsedError;
  int get demonstrations => throw _privateConstructorUsedError;
  double get funds => throw _privateConstructorUsedError;
  double? get solBalance => throw _privateConstructorUsedError;
  Token get token => throw _privateConstructorUsedError;
  String get skills => throw _privateConstructorUsedError;
  String? get ownerEmail => throw _privateConstructorUsedError;
  String get ownerAddress => throw _privateConstructorUsedError;
  String get depositAddress => throw _privateConstructorUsedError;
  bool get expanded => throw _privateConstructorUsedError;
  bool get unsavedSkills => throw _privateConstructorUsedError;
  double? get pricePerDemo => throw _privateConstructorUsedError;
  bool get unsavedPrice => throw _privateConstructorUsedError;
  UploadLimit? get uploadLimit => throw _privateConstructorUsedError;
  bool get unsavedUploadLimit => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  AgentDeploymentInfo? get agentDeploymentInfo =>
      throw _privateConstructorUsedError;

  /// Serializes this TrainingPool to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrainingPool
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainingPoolCopyWith<TrainingPool> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingPoolCopyWith<$Res> {
  factory $TrainingPoolCopyWith(
          TrainingPool value, $Res Function(TrainingPool) then) =
      _$TrainingPoolCopyWithImpl<$Res, TrainingPool>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      TrainingPoolStatus status,
      int demonstrations,
      double funds,
      double? solBalance,
      Token token,
      String skills,
      String? ownerEmail,
      String ownerAddress,
      String depositAddress,
      bool expanded,
      bool unsavedSkills,
      double? pricePerDemo,
      bool unsavedPrice,
      UploadLimit? uploadLimit,
      bool unsavedUploadLimit,
      DateTime? createdAt,
      AgentDeploymentInfo? agentDeploymentInfo});

  $TokenCopyWith<$Res> get token;
  $UploadLimitCopyWith<$Res>? get uploadLimit;
  $AgentDeploymentInfoCopyWith<$Res>? get agentDeploymentInfo;
}

/// @nodoc
class _$TrainingPoolCopyWithImpl<$Res, $Val extends TrainingPool>
    implements $TrainingPoolCopyWith<$Res> {
  _$TrainingPoolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainingPool
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? demonstrations = null,
    Object? funds = null,
    Object? solBalance = freezed,
    Object? token = null,
    Object? skills = null,
    Object? ownerEmail = freezed,
    Object? ownerAddress = null,
    Object? depositAddress = null,
    Object? expanded = null,
    Object? unsavedSkills = null,
    Object? pricePerDemo = freezed,
    Object? unsavedPrice = null,
    Object? uploadLimit = freezed,
    Object? unsavedUploadLimit = null,
    Object? createdAt = freezed,
    Object? agentDeploymentInfo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TrainingPoolStatus,
      demonstrations: null == demonstrations
          ? _value.demonstrations
          : demonstrations // ignore: cast_nullable_to_non_nullable
              as int,
      funds: null == funds
          ? _value.funds
          : funds // ignore: cast_nullable_to_non_nullable
              as double,
      solBalance: freezed == solBalance
          ? _value.solBalance
          : solBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as String,
      ownerEmail: freezed == ownerEmail
          ? _value.ownerEmail
          : ownerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      depositAddress: null == depositAddress
          ? _value.depositAddress
          : depositAddress // ignore: cast_nullable_to_non_nullable
              as String,
      expanded: null == expanded
          ? _value.expanded
          : expanded // ignore: cast_nullable_to_non_nullable
              as bool,
      unsavedSkills: null == unsavedSkills
          ? _value.unsavedSkills
          : unsavedSkills // ignore: cast_nullable_to_non_nullable
              as bool,
      pricePerDemo: freezed == pricePerDemo
          ? _value.pricePerDemo
          : pricePerDemo // ignore: cast_nullable_to_non_nullable
              as double?,
      unsavedPrice: null == unsavedPrice
          ? _value.unsavedPrice
          : unsavedPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadLimit: freezed == uploadLimit
          ? _value.uploadLimit
          : uploadLimit // ignore: cast_nullable_to_non_nullable
              as UploadLimit?,
      unsavedUploadLimit: null == unsavedUploadLimit
          ? _value.unsavedUploadLimit
          : unsavedUploadLimit // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      agentDeploymentInfo: freezed == agentDeploymentInfo
          ? _value.agentDeploymentInfo
          : agentDeploymentInfo // ignore: cast_nullable_to_non_nullable
              as AgentDeploymentInfo?,
    ) as $Val);
  }

  /// Create a copy of TrainingPool
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenCopyWith<$Res> get token {
    return $TokenCopyWith<$Res>(_value.token, (value) {
      return _then(_value.copyWith(token: value) as $Val);
    });
  }

  /// Create a copy of TrainingPool
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UploadLimitCopyWith<$Res>? get uploadLimit {
    if (_value.uploadLimit == null) {
      return null;
    }

    return $UploadLimitCopyWith<$Res>(_value.uploadLimit!, (value) {
      return _then(_value.copyWith(uploadLimit: value) as $Val);
    });
  }

  /// Create a copy of TrainingPool
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgentDeploymentInfoCopyWith<$Res>? get agentDeploymentInfo {
    if (_value.agentDeploymentInfo == null) {
      return null;
    }

    return $AgentDeploymentInfoCopyWith<$Res>(_value.agentDeploymentInfo!,
        (value) {
      return _then(_value.copyWith(agentDeploymentInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrainingPoolImplCopyWith<$Res>
    implements $TrainingPoolCopyWith<$Res> {
  factory _$$TrainingPoolImplCopyWith(
          _$TrainingPoolImpl value, $Res Function(_$TrainingPoolImpl) then) =
      __$$TrainingPoolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      TrainingPoolStatus status,
      int demonstrations,
      double funds,
      double? solBalance,
      Token token,
      String skills,
      String? ownerEmail,
      String ownerAddress,
      String depositAddress,
      bool expanded,
      bool unsavedSkills,
      double? pricePerDemo,
      bool unsavedPrice,
      UploadLimit? uploadLimit,
      bool unsavedUploadLimit,
      DateTime? createdAt,
      AgentDeploymentInfo? agentDeploymentInfo});

  @override
  $TokenCopyWith<$Res> get token;
  @override
  $UploadLimitCopyWith<$Res>? get uploadLimit;
  @override
  $AgentDeploymentInfoCopyWith<$Res>? get agentDeploymentInfo;
}

/// @nodoc
class __$$TrainingPoolImplCopyWithImpl<$Res>
    extends _$TrainingPoolCopyWithImpl<$Res, _$TrainingPoolImpl>
    implements _$$TrainingPoolImplCopyWith<$Res> {
  __$$TrainingPoolImplCopyWithImpl(
      _$TrainingPoolImpl _value, $Res Function(_$TrainingPoolImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainingPool
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? demonstrations = null,
    Object? funds = null,
    Object? solBalance = freezed,
    Object? token = null,
    Object? skills = null,
    Object? ownerEmail = freezed,
    Object? ownerAddress = null,
    Object? depositAddress = null,
    Object? expanded = null,
    Object? unsavedSkills = null,
    Object? pricePerDemo = freezed,
    Object? unsavedPrice = null,
    Object? uploadLimit = freezed,
    Object? unsavedUploadLimit = null,
    Object? createdAt = freezed,
    Object? agentDeploymentInfo = freezed,
  }) {
    return _then(_$TrainingPoolImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TrainingPoolStatus,
      demonstrations: null == demonstrations
          ? _value.demonstrations
          : demonstrations // ignore: cast_nullable_to_non_nullable
              as int,
      funds: null == funds
          ? _value.funds
          : funds // ignore: cast_nullable_to_non_nullable
              as double,
      solBalance: freezed == solBalance
          ? _value.solBalance
          : solBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as String,
      ownerEmail: freezed == ownerEmail
          ? _value.ownerEmail
          : ownerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      depositAddress: null == depositAddress
          ? _value.depositAddress
          : depositAddress // ignore: cast_nullable_to_non_nullable
              as String,
      expanded: null == expanded
          ? _value.expanded
          : expanded // ignore: cast_nullable_to_non_nullable
              as bool,
      unsavedSkills: null == unsavedSkills
          ? _value.unsavedSkills
          : unsavedSkills // ignore: cast_nullable_to_non_nullable
              as bool,
      pricePerDemo: freezed == pricePerDemo
          ? _value.pricePerDemo
          : pricePerDemo // ignore: cast_nullable_to_non_nullable
              as double?,
      unsavedPrice: null == unsavedPrice
          ? _value.unsavedPrice
          : unsavedPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadLimit: freezed == uploadLimit
          ? _value.uploadLimit
          : uploadLimit // ignore: cast_nullable_to_non_nullable
              as UploadLimit?,
      unsavedUploadLimit: null == unsavedUploadLimit
          ? _value.unsavedUploadLimit
          : unsavedUploadLimit // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      agentDeploymentInfo: freezed == agentDeploymentInfo
          ? _value.agentDeploymentInfo
          : agentDeploymentInfo // ignore: cast_nullable_to_non_nullable
              as AgentDeploymentInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrainingPoolImpl implements _TrainingPool {
  const _$TrainingPoolImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.status,
      required this.demonstrations,
      required this.funds,
      this.solBalance,
      required this.token,
      required this.skills,
      this.ownerEmail,
      required this.ownerAddress,
      required this.depositAddress,
      this.expanded = false,
      this.unsavedSkills = false,
      this.pricePerDemo,
      this.unsavedPrice = false,
      this.uploadLimit,
      this.unsavedUploadLimit = false,
      this.createdAt,
      this.agentDeploymentInfo});

  factory _$TrainingPoolImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainingPoolImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final TrainingPoolStatus status;
  @override
  final int demonstrations;
  @override
  final double funds;
  @override
  final double? solBalance;
  @override
  final Token token;
  @override
  final String skills;
  @override
  final String? ownerEmail;
  @override
  final String ownerAddress;
  @override
  final String depositAddress;
  @override
  @JsonKey()
  final bool expanded;
  @override
  @JsonKey()
  final bool unsavedSkills;
  @override
  final double? pricePerDemo;
  @override
  @JsonKey()
  final bool unsavedPrice;
  @override
  final UploadLimit? uploadLimit;
  @override
  @JsonKey()
  final bool unsavedUploadLimit;
  @override
  final DateTime? createdAt;
  @override
  final AgentDeploymentInfo? agentDeploymentInfo;

  @override
  String toString() {
    return 'TrainingPool(id: $id, name: $name, status: $status, demonstrations: $demonstrations, funds: $funds, solBalance: $solBalance, token: $token, skills: $skills, ownerEmail: $ownerEmail, ownerAddress: $ownerAddress, depositAddress: $depositAddress, expanded: $expanded, unsavedSkills: $unsavedSkills, pricePerDemo: $pricePerDemo, unsavedPrice: $unsavedPrice, uploadLimit: $uploadLimit, unsavedUploadLimit: $unsavedUploadLimit, createdAt: $createdAt, agentDeploymentInfo: $agentDeploymentInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainingPoolImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.demonstrations, demonstrations) ||
                other.demonstrations == demonstrations) &&
            (identical(other.funds, funds) || other.funds == funds) &&
            (identical(other.solBalance, solBalance) ||
                other.solBalance == solBalance) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.skills, skills) || other.skills == skills) &&
            (identical(other.ownerEmail, ownerEmail) ||
                other.ownerEmail == ownerEmail) &&
            (identical(other.ownerAddress, ownerAddress) ||
                other.ownerAddress == ownerAddress) &&
            (identical(other.depositAddress, depositAddress) ||
                other.depositAddress == depositAddress) &&
            (identical(other.expanded, expanded) ||
                other.expanded == expanded) &&
            (identical(other.unsavedSkills, unsavedSkills) ||
                other.unsavedSkills == unsavedSkills) &&
            (identical(other.pricePerDemo, pricePerDemo) ||
                other.pricePerDemo == pricePerDemo) &&
            (identical(other.unsavedPrice, unsavedPrice) ||
                other.unsavedPrice == unsavedPrice) &&
            (identical(other.uploadLimit, uploadLimit) ||
                other.uploadLimit == uploadLimit) &&
            (identical(other.unsavedUploadLimit, unsavedUploadLimit) ||
                other.unsavedUploadLimit == unsavedUploadLimit) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.agentDeploymentInfo, agentDeploymentInfo) ||
                other.agentDeploymentInfo == agentDeploymentInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        status,
        demonstrations,
        funds,
        solBalance,
        token,
        skills,
        ownerEmail,
        ownerAddress,
        depositAddress,
        expanded,
        unsavedSkills,
        pricePerDemo,
        unsavedPrice,
        uploadLimit,
        unsavedUploadLimit,
        createdAt,
        agentDeploymentInfo
      ]);

  /// Create a copy of TrainingPool
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingPoolImplCopyWith<_$TrainingPoolImpl> get copyWith =>
      __$$TrainingPoolImplCopyWithImpl<_$TrainingPoolImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainingPoolImplToJson(
      this,
    );
  }
}

abstract class _TrainingPool implements TrainingPool {
  const factory _TrainingPool(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final TrainingPoolStatus status,
      required final int demonstrations,
      required final double funds,
      final double? solBalance,
      required final Token token,
      required final String skills,
      final String? ownerEmail,
      required final String ownerAddress,
      required final String depositAddress,
      final bool expanded,
      final bool unsavedSkills,
      final double? pricePerDemo,
      final bool unsavedPrice,
      final UploadLimit? uploadLimit,
      final bool unsavedUploadLimit,
      final DateTime? createdAt,
      final AgentDeploymentInfo? agentDeploymentInfo}) = _$TrainingPoolImpl;

  factory _TrainingPool.fromJson(Map<String, dynamic> json) =
      _$TrainingPoolImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  TrainingPoolStatus get status;
  @override
  int get demonstrations;
  @override
  double get funds;
  @override
  double? get solBalance;
  @override
  Token get token;
  @override
  String get skills;
  @override
  String? get ownerEmail;
  @override
  String get ownerAddress;
  @override
  String get depositAddress;
  @override
  bool get expanded;
  @override
  bool get unsavedSkills;
  @override
  double? get pricePerDemo;
  @override
  bool get unsavedPrice;
  @override
  UploadLimit? get uploadLimit;
  @override
  bool get unsavedUploadLimit;
  @override
  DateTime? get createdAt;
  @override
  AgentDeploymentInfo? get agentDeploymentInfo;

  /// Create a copy of TrainingPool
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainingPoolImplCopyWith<_$TrainingPoolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
