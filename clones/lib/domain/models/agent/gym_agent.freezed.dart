// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gym_agent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GymAgent _$GymAgentFromJson(Map<String, dynamic> json) {
  return _GymAgent.fromJson(json);
}

/// @nodoc
mixin _$GymAgent {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'pool_id')
  String get poolId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get ticker => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  AgentTokenomics get tokenomics => throw _privateConstructorUsedError;
  AgentLegal get legal => throw _privateConstructorUsedError;
  AgentDeployment get deployment => throw _privateConstructorUsedError;
  AgentBlockchain get blockchain => throw _privateConstructorUsedError;
  List<AgentAuditLogEntry> get auditLog => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this GymAgent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GymAgent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GymAgentCopyWith<GymAgent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GymAgentCopyWith<$Res> {
  factory $GymAgentCopyWith(GymAgent value, $Res Function(GymAgent) then) =
      _$GymAgentCopyWithImpl<$Res, GymAgent>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'pool_id') String poolId,
      String name,
      String ticker,
      String description,
      String? logoUrl,
      AgentTokenomics tokenomics,
      AgentLegal legal,
      AgentDeployment deployment,
      AgentBlockchain blockchain,
      List<AgentAuditLogEntry> auditLog,
      DateTime? createdAt,
      DateTime? updatedAt});

  $AgentTokenomicsCopyWith<$Res> get tokenomics;
  $AgentLegalCopyWith<$Res> get legal;
  $AgentDeploymentCopyWith<$Res> get deployment;
  $AgentBlockchainCopyWith<$Res> get blockchain;
}

/// @nodoc
class _$GymAgentCopyWithImpl<$Res, $Val extends GymAgent>
    implements $GymAgentCopyWith<$Res> {
  _$GymAgentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GymAgent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poolId = null,
    Object? name = null,
    Object? ticker = null,
    Object? description = null,
    Object? logoUrl = freezed,
    Object? tokenomics = null,
    Object? legal = null,
    Object? deployment = null,
    Object? blockchain = null,
    Object? auditLog = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poolId: null == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenomics: null == tokenomics
          ? _value.tokenomics
          : tokenomics // ignore: cast_nullable_to_non_nullable
              as AgentTokenomics,
      legal: null == legal
          ? _value.legal
          : legal // ignore: cast_nullable_to_non_nullable
              as AgentLegal,
      deployment: null == deployment
          ? _value.deployment
          : deployment // ignore: cast_nullable_to_non_nullable
              as AgentDeployment,
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as AgentBlockchain,
      auditLog: null == auditLog
          ? _value.auditLog
          : auditLog // ignore: cast_nullable_to_non_nullable
              as List<AgentAuditLogEntry>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of GymAgent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgentTokenomicsCopyWith<$Res> get tokenomics {
    return $AgentTokenomicsCopyWith<$Res>(_value.tokenomics, (value) {
      return _then(_value.copyWith(tokenomics: value) as $Val);
    });
  }

  /// Create a copy of GymAgent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgentLegalCopyWith<$Res> get legal {
    return $AgentLegalCopyWith<$Res>(_value.legal, (value) {
      return _then(_value.copyWith(legal: value) as $Val);
    });
  }

  /// Create a copy of GymAgent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgentDeploymentCopyWith<$Res> get deployment {
    return $AgentDeploymentCopyWith<$Res>(_value.deployment, (value) {
      return _then(_value.copyWith(deployment: value) as $Val);
    });
  }

  /// Create a copy of GymAgent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgentBlockchainCopyWith<$Res> get blockchain {
    return $AgentBlockchainCopyWith<$Res>(_value.blockchain, (value) {
      return _then(_value.copyWith(blockchain: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GymAgentImplCopyWith<$Res>
    implements $GymAgentCopyWith<$Res> {
  factory _$$GymAgentImplCopyWith(
          _$GymAgentImpl value, $Res Function(_$GymAgentImpl) then) =
      __$$GymAgentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'pool_id') String poolId,
      String name,
      String ticker,
      String description,
      String? logoUrl,
      AgentTokenomics tokenomics,
      AgentLegal legal,
      AgentDeployment deployment,
      AgentBlockchain blockchain,
      List<AgentAuditLogEntry> auditLog,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $AgentTokenomicsCopyWith<$Res> get tokenomics;
  @override
  $AgentLegalCopyWith<$Res> get legal;
  @override
  $AgentDeploymentCopyWith<$Res> get deployment;
  @override
  $AgentBlockchainCopyWith<$Res> get blockchain;
}

/// @nodoc
class __$$GymAgentImplCopyWithImpl<$Res>
    extends _$GymAgentCopyWithImpl<$Res, _$GymAgentImpl>
    implements _$$GymAgentImplCopyWith<$Res> {
  __$$GymAgentImplCopyWithImpl(
      _$GymAgentImpl _value, $Res Function(_$GymAgentImpl) _then)
      : super(_value, _then);

  /// Create a copy of GymAgent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poolId = null,
    Object? name = null,
    Object? ticker = null,
    Object? description = null,
    Object? logoUrl = freezed,
    Object? tokenomics = null,
    Object? legal = null,
    Object? deployment = null,
    Object? blockchain = null,
    Object? auditLog = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$GymAgentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poolId: null == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenomics: null == tokenomics
          ? _value.tokenomics
          : tokenomics // ignore: cast_nullable_to_non_nullable
              as AgentTokenomics,
      legal: null == legal
          ? _value.legal
          : legal // ignore: cast_nullable_to_non_nullable
              as AgentLegal,
      deployment: null == deployment
          ? _value.deployment
          : deployment // ignore: cast_nullable_to_non_nullable
              as AgentDeployment,
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as AgentBlockchain,
      auditLog: null == auditLog
          ? _value._auditLog
          : auditLog // ignore: cast_nullable_to_non_nullable
              as List<AgentAuditLogEntry>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GymAgentImpl implements _GymAgent {
  const _$GymAgentImpl(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'pool_id') required this.poolId,
      required this.name,
      required this.ticker,
      required this.description,
      this.logoUrl,
      required this.tokenomics,
      required this.legal,
      required this.deployment,
      required this.blockchain,
      final List<AgentAuditLogEntry> auditLog = const [],
      this.createdAt,
      this.updatedAt})
      : _auditLog = auditLog;

  factory _$GymAgentImpl.fromJson(Map<String, dynamic> json) =>
      _$$GymAgentImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'pool_id')
  final String poolId;
  @override
  final String name;
  @override
  final String ticker;
  @override
  final String description;
  @override
  final String? logoUrl;
  @override
  final AgentTokenomics tokenomics;
  @override
  final AgentLegal legal;
  @override
  final AgentDeployment deployment;
  @override
  final AgentBlockchain blockchain;
  final List<AgentAuditLogEntry> _auditLog;
  @override
  @JsonKey()
  List<AgentAuditLogEntry> get auditLog {
    if (_auditLog is EqualUnmodifiableListView) return _auditLog;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_auditLog);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'GymAgent(id: $id, poolId: $poolId, name: $name, ticker: $ticker, description: $description, logoUrl: $logoUrl, tokenomics: $tokenomics, legal: $legal, deployment: $deployment, blockchain: $blockchain, auditLog: $auditLog, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GymAgentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.poolId, poolId) || other.poolId == poolId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ticker, ticker) || other.ticker == ticker) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.tokenomics, tokenomics) ||
                other.tokenomics == tokenomics) &&
            (identical(other.legal, legal) || other.legal == legal) &&
            (identical(other.deployment, deployment) ||
                other.deployment == deployment) &&
            (identical(other.blockchain, blockchain) ||
                other.blockchain == blockchain) &&
            const DeepCollectionEquality().equals(other._auditLog, _auditLog) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      poolId,
      name,
      ticker,
      description,
      logoUrl,
      tokenomics,
      legal,
      deployment,
      blockchain,
      const DeepCollectionEquality().hash(_auditLog),
      createdAt,
      updatedAt);

  /// Create a copy of GymAgent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GymAgentImplCopyWith<_$GymAgentImpl> get copyWith =>
      __$$GymAgentImplCopyWithImpl<_$GymAgentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GymAgentImplToJson(
      this,
    );
  }
}

abstract class _GymAgent implements GymAgent {
  const factory _GymAgent(
      {@JsonKey(name: '_id') required final String id,
      @JsonKey(name: 'pool_id') required final String poolId,
      required final String name,
      required final String ticker,
      required final String description,
      final String? logoUrl,
      required final AgentTokenomics tokenomics,
      required final AgentLegal legal,
      required final AgentDeployment deployment,
      required final AgentBlockchain blockchain,
      final List<AgentAuditLogEntry> auditLog,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$GymAgentImpl;

  factory _GymAgent.fromJson(Map<String, dynamic> json) =
      _$GymAgentImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'pool_id')
  String get poolId;
  @override
  String get name;
  @override
  String get ticker;
  @override
  String get description;
  @override
  String? get logoUrl;
  @override
  AgentTokenomics get tokenomics;
  @override
  AgentLegal get legal;
  @override
  AgentDeployment get deployment;
  @override
  AgentBlockchain get blockchain;
  @override
  List<AgentAuditLogEntry> get auditLog;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of GymAgent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GymAgentImplCopyWith<_$GymAgentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
