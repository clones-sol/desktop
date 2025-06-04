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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
mixin _$Token {
  TokenType get type => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  /// Serializes this Token to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res, Token>;
  @useResult
  $Res call({TokenType type, String symbol, String address});
}

/// @nodoc
class _$TokenCopyWithImpl<$Res, $Val extends Token>
    implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? symbol = null,
    Object? address = null,
  }) {
    return _then(
      _value.copyWith(
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as TokenType,
            symbol:
                null == symbol
                    ? _value.symbol
                    : symbol // ignore: cast_nullable_to_non_nullable
                        as String,
            address:
                null == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TokenImplCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$$TokenImplCopyWith(
    _$TokenImpl value,
    $Res Function(_$TokenImpl) then,
  ) = __$$TokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TokenType type, String symbol, String address});
}

/// @nodoc
class __$$TokenImplCopyWithImpl<$Res>
    extends _$TokenCopyWithImpl<$Res, _$TokenImpl>
    implements _$$TokenImplCopyWith<$Res> {
  __$$TokenImplCopyWithImpl(
    _$TokenImpl _value,
    $Res Function(_$TokenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? symbol = null,
    Object? address = null,
  }) {
    return _then(
      _$TokenImpl(
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as TokenType,
        symbol:
            null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                    as String,
        address:
            null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenImpl implements _Token {
  const _$TokenImpl({
    required this.type,
    required this.symbol,
    required this.address,
  });

  factory _$TokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenImplFromJson(json);

  @override
  final TokenType type;
  @override
  final String symbol;
  @override
  final String address;

  @override
  String toString() {
    return 'Token(type: $type, symbol: $symbol, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, symbol, address);

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenImplCopyWith<_$TokenImpl> get copyWith =>
      __$$TokenImplCopyWithImpl<_$TokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenImplToJson(this);
  }
}

abstract class _Token implements Token {
  const factory _Token({
    required final TokenType type,
    required final String symbol,
    required final String address,
  }) = _$TokenImpl;

  factory _Token.fromJson(Map<String, dynamic> json) = _$TokenImpl.fromJson;

  @override
  TokenType get type;
  @override
  String get symbol;
  @override
  String get address;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenImplCopyWith<_$TokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrainingPool _$TrainingPoolFromJson(Map<String, dynamic> json) {
  return _TrainingPool.fromJson(json);
}

/// @nodoc
mixin _$TrainingPool {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  TrainingPoolStatus get status => throw _privateConstructorUsedError;
  int get demonstrations => throw _privateConstructorUsedError;
  double get funds => throw _privateConstructorUsedError;
  double get solBalance => throw _privateConstructorUsedError;
  Token get token => throw _privateConstructorUsedError;
  String get skills => throw _privateConstructorUsedError;
  String? get ownerEmail => throw _privateConstructorUsedError;
  String get ownerAddress => throw _privateConstructorUsedError;
  String get depositAddress => throw _privateConstructorUsedError;
  bool? get expanded => throw _privateConstructorUsedError;
  bool? get unsavedSkills => throw _privateConstructorUsedError;
  double? get pricePerDemo => throw _privateConstructorUsedError;
  bool? get unsavedPrice => throw _privateConstructorUsedError;
  UploadLimit? get uploadLimit => throw _privateConstructorUsedError;
  bool? get unsavedUploadLimit => throw _privateConstructorUsedError;

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
    TrainingPool value,
    $Res Function(TrainingPool) then,
  ) = _$TrainingPoolCopyWithImpl<$Res, TrainingPool>;
  @useResult
  $Res call({
    String id,
    String name,
    TrainingPoolStatus status,
    int demonstrations,
    double funds,
    double solBalance,
    Token token,
    String skills,
    String? ownerEmail,
    String ownerAddress,
    String depositAddress,
    bool? expanded,
    bool? unsavedSkills,
    double? pricePerDemo,
    bool? unsavedPrice,
    UploadLimit? uploadLimit,
    bool? unsavedUploadLimit,
  });

  $TokenCopyWith<$Res> get token;
  $UploadLimitCopyWith<$Res>? get uploadLimit;
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
    Object? solBalance = null,
    Object? token = null,
    Object? skills = null,
    Object? ownerEmail = freezed,
    Object? ownerAddress = null,
    Object? depositAddress = null,
    Object? expanded = freezed,
    Object? unsavedSkills = freezed,
    Object? pricePerDemo = freezed,
    Object? unsavedPrice = freezed,
    Object? uploadLimit = freezed,
    Object? unsavedUploadLimit = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as TrainingPoolStatus,
            demonstrations:
                null == demonstrations
                    ? _value.demonstrations
                    : demonstrations // ignore: cast_nullable_to_non_nullable
                        as int,
            funds:
                null == funds
                    ? _value.funds
                    : funds // ignore: cast_nullable_to_non_nullable
                        as double,
            solBalance:
                null == solBalance
                    ? _value.solBalance
                    : solBalance // ignore: cast_nullable_to_non_nullable
                        as double,
            token:
                null == token
                    ? _value.token
                    : token // ignore: cast_nullable_to_non_nullable
                        as Token,
            skills:
                null == skills
                    ? _value.skills
                    : skills // ignore: cast_nullable_to_non_nullable
                        as String,
            ownerEmail:
                freezed == ownerEmail
                    ? _value.ownerEmail
                    : ownerEmail // ignore: cast_nullable_to_non_nullable
                        as String?,
            ownerAddress:
                null == ownerAddress
                    ? _value.ownerAddress
                    : ownerAddress // ignore: cast_nullable_to_non_nullable
                        as String,
            depositAddress:
                null == depositAddress
                    ? _value.depositAddress
                    : depositAddress // ignore: cast_nullable_to_non_nullable
                        as String,
            expanded:
                freezed == expanded
                    ? _value.expanded
                    : expanded // ignore: cast_nullable_to_non_nullable
                        as bool?,
            unsavedSkills:
                freezed == unsavedSkills
                    ? _value.unsavedSkills
                    : unsavedSkills // ignore: cast_nullable_to_non_nullable
                        as bool?,
            pricePerDemo:
                freezed == pricePerDemo
                    ? _value.pricePerDemo
                    : pricePerDemo // ignore: cast_nullable_to_non_nullable
                        as double?,
            unsavedPrice:
                freezed == unsavedPrice
                    ? _value.unsavedPrice
                    : unsavedPrice // ignore: cast_nullable_to_non_nullable
                        as bool?,
            uploadLimit:
                freezed == uploadLimit
                    ? _value.uploadLimit
                    : uploadLimit // ignore: cast_nullable_to_non_nullable
                        as UploadLimit?,
            unsavedUploadLimit:
                freezed == unsavedUploadLimit
                    ? _value.unsavedUploadLimit
                    : unsavedUploadLimit // ignore: cast_nullable_to_non_nullable
                        as bool?,
          )
          as $Val,
    );
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
}

/// @nodoc
abstract class _$$TrainingPoolImplCopyWith<$Res>
    implements $TrainingPoolCopyWith<$Res> {
  factory _$$TrainingPoolImplCopyWith(
    _$TrainingPoolImpl value,
    $Res Function(_$TrainingPoolImpl) then,
  ) = __$$TrainingPoolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    TrainingPoolStatus status,
    int demonstrations,
    double funds,
    double solBalance,
    Token token,
    String skills,
    String? ownerEmail,
    String ownerAddress,
    String depositAddress,
    bool? expanded,
    bool? unsavedSkills,
    double? pricePerDemo,
    bool? unsavedPrice,
    UploadLimit? uploadLimit,
    bool? unsavedUploadLimit,
  });

  @override
  $TokenCopyWith<$Res> get token;
  @override
  $UploadLimitCopyWith<$Res>? get uploadLimit;
}

/// @nodoc
class __$$TrainingPoolImplCopyWithImpl<$Res>
    extends _$TrainingPoolCopyWithImpl<$Res, _$TrainingPoolImpl>
    implements _$$TrainingPoolImplCopyWith<$Res> {
  __$$TrainingPoolImplCopyWithImpl(
    _$TrainingPoolImpl _value,
    $Res Function(_$TrainingPoolImpl) _then,
  ) : super(_value, _then);

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
    Object? solBalance = null,
    Object? token = null,
    Object? skills = null,
    Object? ownerEmail = freezed,
    Object? ownerAddress = null,
    Object? depositAddress = null,
    Object? expanded = freezed,
    Object? unsavedSkills = freezed,
    Object? pricePerDemo = freezed,
    Object? unsavedPrice = freezed,
    Object? uploadLimit = freezed,
    Object? unsavedUploadLimit = freezed,
  }) {
    return _then(
      _$TrainingPoolImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as TrainingPoolStatus,
        demonstrations:
            null == demonstrations
                ? _value.demonstrations
                : demonstrations // ignore: cast_nullable_to_non_nullable
                    as int,
        funds:
            null == funds
                ? _value.funds
                : funds // ignore: cast_nullable_to_non_nullable
                    as double,
        solBalance:
            null == solBalance
                ? _value.solBalance
                : solBalance // ignore: cast_nullable_to_non_nullable
                    as double,
        token:
            null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as Token,
        skills:
            null == skills
                ? _value.skills
                : skills // ignore: cast_nullable_to_non_nullable
                    as String,
        ownerEmail:
            freezed == ownerEmail
                ? _value.ownerEmail
                : ownerEmail // ignore: cast_nullable_to_non_nullable
                    as String?,
        ownerAddress:
            null == ownerAddress
                ? _value.ownerAddress
                : ownerAddress // ignore: cast_nullable_to_non_nullable
                    as String,
        depositAddress:
            null == depositAddress
                ? _value.depositAddress
                : depositAddress // ignore: cast_nullable_to_non_nullable
                    as String,
        expanded:
            freezed == expanded
                ? _value.expanded
                : expanded // ignore: cast_nullable_to_non_nullable
                    as bool?,
        unsavedSkills:
            freezed == unsavedSkills
                ? _value.unsavedSkills
                : unsavedSkills // ignore: cast_nullable_to_non_nullable
                    as bool?,
        pricePerDemo:
            freezed == pricePerDemo
                ? _value.pricePerDemo
                : pricePerDemo // ignore: cast_nullable_to_non_nullable
                    as double?,
        unsavedPrice:
            freezed == unsavedPrice
                ? _value.unsavedPrice
                : unsavedPrice // ignore: cast_nullable_to_non_nullable
                    as bool?,
        uploadLimit:
            freezed == uploadLimit
                ? _value.uploadLimit
                : uploadLimit // ignore: cast_nullable_to_non_nullable
                    as UploadLimit?,
        unsavedUploadLimit:
            freezed == unsavedUploadLimit
                ? _value.unsavedUploadLimit
                : unsavedUploadLimit // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TrainingPoolImpl implements _TrainingPool {
  const _$TrainingPoolImpl({
    required this.id,
    required this.name,
    required this.status,
    required this.demonstrations,
    required this.funds,
    required this.solBalance,
    required this.token,
    required this.skills,
    this.ownerEmail,
    required this.ownerAddress,
    required this.depositAddress,
    this.expanded,
    this.unsavedSkills,
    this.pricePerDemo,
    this.unsavedPrice,
    this.uploadLimit,
    this.unsavedUploadLimit,
  });

  factory _$TrainingPoolImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainingPoolImplFromJson(json);

  @override
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
  final double solBalance;
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
  final bool? expanded;
  @override
  final bool? unsavedSkills;
  @override
  final double? pricePerDemo;
  @override
  final bool? unsavedPrice;
  @override
  final UploadLimit? uploadLimit;
  @override
  final bool? unsavedUploadLimit;

  @override
  String toString() {
    return 'TrainingPool(id: $id, name: $name, status: $status, demonstrations: $demonstrations, funds: $funds, solBalance: $solBalance, token: $token, skills: $skills, ownerEmail: $ownerEmail, ownerAddress: $ownerAddress, depositAddress: $depositAddress, expanded: $expanded, unsavedSkills: $unsavedSkills, pricePerDemo: $pricePerDemo, unsavedPrice: $unsavedPrice, uploadLimit: $uploadLimit, unsavedUploadLimit: $unsavedUploadLimit)';
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
                other.unsavedUploadLimit == unsavedUploadLimit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
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
  );

  /// Create a copy of TrainingPool
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingPoolImplCopyWith<_$TrainingPoolImpl> get copyWith =>
      __$$TrainingPoolImplCopyWithImpl<_$TrainingPoolImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainingPoolImplToJson(this);
  }
}

abstract class _TrainingPool implements TrainingPool {
  const factory _TrainingPool({
    required final String id,
    required final String name,
    required final TrainingPoolStatus status,
    required final int demonstrations,
    required final double funds,
    required final double solBalance,
    required final Token token,
    required final String skills,
    final String? ownerEmail,
    required final String ownerAddress,
    required final String depositAddress,
    final bool? expanded,
    final bool? unsavedSkills,
    final double? pricePerDemo,
    final bool? unsavedPrice,
    final UploadLimit? uploadLimit,
    final bool? unsavedUploadLimit,
  }) = _$TrainingPoolImpl;

  factory _TrainingPool.fromJson(Map<String, dynamic> json) =
      _$TrainingPoolImpl.fromJson;

  @override
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
  double get solBalance;
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
  bool? get expanded;
  @override
  bool? get unsavedSkills;
  @override
  double? get pricePerDemo;
  @override
  bool? get unsavedPrice;
  @override
  UploadLimit? get uploadLimit;
  @override
  bool? get unsavedUploadLimit;

  /// Create a copy of TrainingPool
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainingPoolImplCopyWith<_$TrainingPoolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadLimit _$UploadLimitFromJson(Map<String, dynamic> json) {
  return _UploadLimit.fromJson(json);
}

/// @nodoc
mixin _$UploadLimit {
  int get type => throw _privateConstructorUsedError;
  String get limitType => throw _privateConstructorUsedError;

  /// Serializes this UploadLimit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadLimit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadLimitCopyWith<UploadLimit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadLimitCopyWith<$Res> {
  factory $UploadLimitCopyWith(
    UploadLimit value,
    $Res Function(UploadLimit) then,
  ) = _$UploadLimitCopyWithImpl<$Res, UploadLimit>;
  @useResult
  $Res call({int type, String limitType});
}

/// @nodoc
class _$UploadLimitCopyWithImpl<$Res, $Val extends UploadLimit>
    implements $UploadLimitCopyWith<$Res> {
  _$UploadLimitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadLimit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? limitType = null}) {
    return _then(
      _value.copyWith(
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as int,
            limitType:
                null == limitType
                    ? _value.limitType
                    : limitType // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UploadLimitImplCopyWith<$Res>
    implements $UploadLimitCopyWith<$Res> {
  factory _$$UploadLimitImplCopyWith(
    _$UploadLimitImpl value,
    $Res Function(_$UploadLimitImpl) then,
  ) = __$$UploadLimitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int type, String limitType});
}

/// @nodoc
class __$$UploadLimitImplCopyWithImpl<$Res>
    extends _$UploadLimitCopyWithImpl<$Res, _$UploadLimitImpl>
    implements _$$UploadLimitImplCopyWith<$Res> {
  __$$UploadLimitImplCopyWithImpl(
    _$UploadLimitImpl _value,
    $Res Function(_$UploadLimitImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UploadLimit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? limitType = null}) {
    return _then(
      _$UploadLimitImpl(
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as int,
        limitType:
            null == limitType
                ? _value.limitType
                : limitType // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadLimitImpl implements _UploadLimit {
  const _$UploadLimitImpl({required this.type, required this.limitType});

  factory _$UploadLimitImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadLimitImplFromJson(json);

  @override
  final int type;
  @override
  final String limitType;

  @override
  String toString() {
    return 'UploadLimit(type: $type, limitType: $limitType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadLimitImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.limitType, limitType) ||
                other.limitType == limitType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, limitType);

  /// Create a copy of UploadLimit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadLimitImplCopyWith<_$UploadLimitImpl> get copyWith =>
      __$$UploadLimitImplCopyWithImpl<_$UploadLimitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadLimitImplToJson(this);
  }
}

abstract class _UploadLimit implements UploadLimit {
  const factory _UploadLimit({
    required final int type,
    required final String limitType,
  }) = _$UploadLimitImpl;

  factory _UploadLimit.fromJson(Map<String, dynamic> json) =
      _$UploadLimitImpl.fromJson;

  @override
  int get type;
  @override
  String get limitType;

  /// Create a copy of UploadLimit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadLimitImplCopyWith<_$UploadLimitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatePoolInput _$CreatePoolInputFromJson(Map<String, dynamic> json) {
  return _CreatePoolInput.fromJson(json);
}

/// @nodoc
mixin _$CreatePoolInput {
  String get name => throw _privateConstructorUsedError;
  String get skills => throw _privateConstructorUsedError;
  Token get token => throw _privateConstructorUsedError;
  String get ownerAddress => throw _privateConstructorUsedError;

  /// Serializes this CreatePoolInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePoolInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePoolInputCopyWith<CreatePoolInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePoolInputCopyWith<$Res> {
  factory $CreatePoolInputCopyWith(
    CreatePoolInput value,
    $Res Function(CreatePoolInput) then,
  ) = _$CreatePoolInputCopyWithImpl<$Res, CreatePoolInput>;
  @useResult
  $Res call({String name, String skills, Token token, String ownerAddress});

  $TokenCopyWith<$Res> get token;
}

/// @nodoc
class _$CreatePoolInputCopyWithImpl<$Res, $Val extends CreatePoolInput>
    implements $CreatePoolInputCopyWith<$Res> {
  _$CreatePoolInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePoolInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? skills = null,
    Object? token = null,
    Object? ownerAddress = null,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            skills:
                null == skills
                    ? _value.skills
                    : skills // ignore: cast_nullable_to_non_nullable
                        as String,
            token:
                null == token
                    ? _value.token
                    : token // ignore: cast_nullable_to_non_nullable
                        as Token,
            ownerAddress:
                null == ownerAddress
                    ? _value.ownerAddress
                    : ownerAddress // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }

  /// Create a copy of CreatePoolInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenCopyWith<$Res> get token {
    return $TokenCopyWith<$Res>(_value.token, (value) {
      return _then(_value.copyWith(token: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreatePoolInputImplCopyWith<$Res>
    implements $CreatePoolInputCopyWith<$Res> {
  factory _$$CreatePoolInputImplCopyWith(
    _$CreatePoolInputImpl value,
    $Res Function(_$CreatePoolInputImpl) then,
  ) = __$$CreatePoolInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String skills, Token token, String ownerAddress});

  @override
  $TokenCopyWith<$Res> get token;
}

/// @nodoc
class __$$CreatePoolInputImplCopyWithImpl<$Res>
    extends _$CreatePoolInputCopyWithImpl<$Res, _$CreatePoolInputImpl>
    implements _$$CreatePoolInputImplCopyWith<$Res> {
  __$$CreatePoolInputImplCopyWithImpl(
    _$CreatePoolInputImpl _value,
    $Res Function(_$CreatePoolInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreatePoolInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? skills = null,
    Object? token = null,
    Object? ownerAddress = null,
  }) {
    return _then(
      _$CreatePoolInputImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        skills:
            null == skills
                ? _value.skills
                : skills // ignore: cast_nullable_to_non_nullable
                    as String,
        token:
            null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as Token,
        ownerAddress:
            null == ownerAddress
                ? _value.ownerAddress
                : ownerAddress // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePoolInputImpl implements _CreatePoolInput {
  const _$CreatePoolInputImpl({
    required this.name,
    required this.skills,
    required this.token,
    required this.ownerAddress,
  });

  factory _$CreatePoolInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePoolInputImplFromJson(json);

  @override
  final String name;
  @override
  final String skills;
  @override
  final Token token;
  @override
  final String ownerAddress;

  @override
  String toString() {
    return 'CreatePoolInput(name: $name, skills: $skills, token: $token, ownerAddress: $ownerAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePoolInputImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.skills, skills) || other.skills == skills) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.ownerAddress, ownerAddress) ||
                other.ownerAddress == ownerAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, skills, token, ownerAddress);

  /// Create a copy of CreatePoolInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePoolInputImplCopyWith<_$CreatePoolInputImpl> get copyWith =>
      __$$CreatePoolInputImplCopyWithImpl<_$CreatePoolInputImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePoolInputImplToJson(this);
  }
}

abstract class _CreatePoolInput implements CreatePoolInput {
  const factory _CreatePoolInput({
    required final String name,
    required final String skills,
    required final Token token,
    required final String ownerAddress,
  }) = _$CreatePoolInputImpl;

  factory _CreatePoolInput.fromJson(Map<String, dynamic> json) =
      _$CreatePoolInputImpl.fromJson;

  @override
  String get name;
  @override
  String get skills;
  @override
  Token get token;
  @override
  String get ownerAddress;

  /// Create a copy of CreatePoolInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePoolInputImplCopyWith<_$CreatePoolInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdatePoolInput _$UpdatePoolInputFromJson(Map<String, dynamic> json) {
  return _UpdatePoolInput.fromJson(json);
}

/// @nodoc
mixin _$UpdatePoolInput {
  String get id => throw _privateConstructorUsedError;
  TrainingPoolStatus? get status => throw _privateConstructorUsedError;
  String? get skills => throw _privateConstructorUsedError;
  double? get pricePerDemo => throw _privateConstructorUsedError;
  UploadLimit? get uploadLimit => throw _privateConstructorUsedError;
  List<dynamic>? get apps => throw _privateConstructorUsedError;

  /// Serializes this UpdatePoolInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePoolInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePoolInputCopyWith<UpdatePoolInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePoolInputCopyWith<$Res> {
  factory $UpdatePoolInputCopyWith(
    UpdatePoolInput value,
    $Res Function(UpdatePoolInput) then,
  ) = _$UpdatePoolInputCopyWithImpl<$Res, UpdatePoolInput>;
  @useResult
  $Res call({
    String id,
    TrainingPoolStatus? status,
    String? skills,
    double? pricePerDemo,
    UploadLimit? uploadLimit,
    List<dynamic>? apps,
  });

  $UploadLimitCopyWith<$Res>? get uploadLimit;
}

/// @nodoc
class _$UpdatePoolInputCopyWithImpl<$Res, $Val extends UpdatePoolInput>
    implements $UpdatePoolInputCopyWith<$Res> {
  _$UpdatePoolInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePoolInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = freezed,
    Object? skills = freezed,
    Object? pricePerDemo = freezed,
    Object? uploadLimit = freezed,
    Object? apps = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as TrainingPoolStatus?,
            skills:
                freezed == skills
                    ? _value.skills
                    : skills // ignore: cast_nullable_to_non_nullable
                        as String?,
            pricePerDemo:
                freezed == pricePerDemo
                    ? _value.pricePerDemo
                    : pricePerDemo // ignore: cast_nullable_to_non_nullable
                        as double?,
            uploadLimit:
                freezed == uploadLimit
                    ? _value.uploadLimit
                    : uploadLimit // ignore: cast_nullable_to_non_nullable
                        as UploadLimit?,
            apps:
                freezed == apps
                    ? _value.apps
                    : apps // ignore: cast_nullable_to_non_nullable
                        as List<dynamic>?,
          )
          as $Val,
    );
  }

  /// Create a copy of UpdatePoolInput
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
}

/// @nodoc
abstract class _$$UpdatePoolInputImplCopyWith<$Res>
    implements $UpdatePoolInputCopyWith<$Res> {
  factory _$$UpdatePoolInputImplCopyWith(
    _$UpdatePoolInputImpl value,
    $Res Function(_$UpdatePoolInputImpl) then,
  ) = __$$UpdatePoolInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    TrainingPoolStatus? status,
    String? skills,
    double? pricePerDemo,
    UploadLimit? uploadLimit,
    List<dynamic>? apps,
  });

  @override
  $UploadLimitCopyWith<$Res>? get uploadLimit;
}

/// @nodoc
class __$$UpdatePoolInputImplCopyWithImpl<$Res>
    extends _$UpdatePoolInputCopyWithImpl<$Res, _$UpdatePoolInputImpl>
    implements _$$UpdatePoolInputImplCopyWith<$Res> {
  __$$UpdatePoolInputImplCopyWithImpl(
    _$UpdatePoolInputImpl _value,
    $Res Function(_$UpdatePoolInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdatePoolInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = freezed,
    Object? skills = freezed,
    Object? pricePerDemo = freezed,
    Object? uploadLimit = freezed,
    Object? apps = freezed,
  }) {
    return _then(
      _$UpdatePoolInputImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as TrainingPoolStatus?,
        skills:
            freezed == skills
                ? _value.skills
                : skills // ignore: cast_nullable_to_non_nullable
                    as String?,
        pricePerDemo:
            freezed == pricePerDemo
                ? _value.pricePerDemo
                : pricePerDemo // ignore: cast_nullable_to_non_nullable
                    as double?,
        uploadLimit:
            freezed == uploadLimit
                ? _value.uploadLimit
                : uploadLimit // ignore: cast_nullable_to_non_nullable
                    as UploadLimit?,
        apps:
            freezed == apps
                ? _value._apps
                : apps // ignore: cast_nullable_to_non_nullable
                    as List<dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePoolInputImpl implements _UpdatePoolInput {
  const _$UpdatePoolInputImpl({
    required this.id,
    this.status,
    this.skills,
    this.pricePerDemo,
    this.uploadLimit,
    final List<dynamic>? apps,
  }) : _apps = apps;

  factory _$UpdatePoolInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePoolInputImplFromJson(json);

  @override
  final String id;
  @override
  final TrainingPoolStatus? status;
  @override
  final String? skills;
  @override
  final double? pricePerDemo;
  @override
  final UploadLimit? uploadLimit;
  final List<dynamic>? _apps;
  @override
  List<dynamic>? get apps {
    final value = _apps;
    if (value == null) return null;
    if (_apps is EqualUnmodifiableListView) return _apps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UpdatePoolInput(id: $id, status: $status, skills: $skills, pricePerDemo: $pricePerDemo, uploadLimit: $uploadLimit, apps: $apps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePoolInputImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.skills, skills) || other.skills == skills) &&
            (identical(other.pricePerDemo, pricePerDemo) ||
                other.pricePerDemo == pricePerDemo) &&
            (identical(other.uploadLimit, uploadLimit) ||
                other.uploadLimit == uploadLimit) &&
            const DeepCollectionEquality().equals(other._apps, _apps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    status,
    skills,
    pricePerDemo,
    uploadLimit,
    const DeepCollectionEquality().hash(_apps),
  );

  /// Create a copy of UpdatePoolInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePoolInputImplCopyWith<_$UpdatePoolInputImpl> get copyWith =>
      __$$UpdatePoolInputImplCopyWithImpl<_$UpdatePoolInputImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePoolInputImplToJson(this);
  }
}

abstract class _UpdatePoolInput implements UpdatePoolInput {
  const factory _UpdatePoolInput({
    required final String id,
    final TrainingPoolStatus? status,
    final String? skills,
    final double? pricePerDemo,
    final UploadLimit? uploadLimit,
    final List<dynamic>? apps,
  }) = _$UpdatePoolInputImpl;

  factory _UpdatePoolInput.fromJson(Map<String, dynamic> json) =
      _$UpdatePoolInputImpl.fromJson;

  @override
  String get id;
  @override
  TrainingPoolStatus? get status;
  @override
  String? get skills;
  @override
  double? get pricePerDemo;
  @override
  UploadLimit? get uploadLimit;
  @override
  List<dynamic>? get apps;

  /// Create a copy of UpdatePoolInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePoolInputImplCopyWith<_$UpdatePoolInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
