// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UnsignedTransaction _$UnsignedTransactionFromJson(Map<String, dynamic> json) {
  return _UnsignedTransaction.fromJson(json);
}

/// @nodoc
mixin _$UnsignedTransaction {
  String get transaction => throw _privateConstructorUsedError;
  String get idempotencyKey => throw _privateConstructorUsedError;
  double get estimatedFeeSol => throw _privateConstructorUsedError;

  /// Serializes this UnsignedTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnsignedTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnsignedTransactionCopyWith<UnsignedTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnsignedTransactionCopyWith<$Res> {
  factory $UnsignedTransactionCopyWith(
          UnsignedTransaction value, $Res Function(UnsignedTransaction) then) =
      _$UnsignedTransactionCopyWithImpl<$Res, UnsignedTransaction>;
  @useResult
  $Res call(
      {String transaction, String idempotencyKey, double estimatedFeeSol});
}

/// @nodoc
class _$UnsignedTransactionCopyWithImpl<$Res, $Val extends UnsignedTransaction>
    implements $UnsignedTransactionCopyWith<$Res> {
  _$UnsignedTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnsignedTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
    Object? idempotencyKey = null,
    Object? estimatedFeeSol = null,
  }) {
    return _then(_value.copyWith(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as String,
      idempotencyKey: null == idempotencyKey
          ? _value.idempotencyKey
          : idempotencyKey // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedFeeSol: null == estimatedFeeSol
          ? _value.estimatedFeeSol
          : estimatedFeeSol // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnsignedTransactionImplCopyWith<$Res>
    implements $UnsignedTransactionCopyWith<$Res> {
  factory _$$UnsignedTransactionImplCopyWith(_$UnsignedTransactionImpl value,
          $Res Function(_$UnsignedTransactionImpl) then) =
      __$$UnsignedTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String transaction, String idempotencyKey, double estimatedFeeSol});
}

/// @nodoc
class __$$UnsignedTransactionImplCopyWithImpl<$Res>
    extends _$UnsignedTransactionCopyWithImpl<$Res, _$UnsignedTransactionImpl>
    implements _$$UnsignedTransactionImplCopyWith<$Res> {
  __$$UnsignedTransactionImplCopyWithImpl(_$UnsignedTransactionImpl _value,
      $Res Function(_$UnsignedTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnsignedTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
    Object? idempotencyKey = null,
    Object? estimatedFeeSol = null,
  }) {
    return _then(_$UnsignedTransactionImpl(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as String,
      idempotencyKey: null == idempotencyKey
          ? _value.idempotencyKey
          : idempotencyKey // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedFeeSol: null == estimatedFeeSol
          ? _value.estimatedFeeSol
          : estimatedFeeSol // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnsignedTransactionImpl implements _UnsignedTransaction {
  const _$UnsignedTransactionImpl(
      {required this.transaction,
      required this.idempotencyKey,
      required this.estimatedFeeSol});

  factory _$UnsignedTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnsignedTransactionImplFromJson(json);

  @override
  final String transaction;
  @override
  final String idempotencyKey;
  @override
  final double estimatedFeeSol;

  @override
  String toString() {
    return 'UnsignedTransaction(transaction: $transaction, idempotencyKey: $idempotencyKey, estimatedFeeSol: $estimatedFeeSol)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnsignedTransactionImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.idempotencyKey, idempotencyKey) ||
                other.idempotencyKey == idempotencyKey) &&
            (identical(other.estimatedFeeSol, estimatedFeeSol) ||
                other.estimatedFeeSol == estimatedFeeSol));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, transaction, idempotencyKey, estimatedFeeSol);

  /// Create a copy of UnsignedTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnsignedTransactionImplCopyWith<_$UnsignedTransactionImpl> get copyWith =>
      __$$UnsignedTransactionImplCopyWithImpl<_$UnsignedTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnsignedTransactionImplToJson(
      this,
    );
  }
}

abstract class _UnsignedTransaction implements UnsignedTransaction {
  const factory _UnsignedTransaction(
      {required final String transaction,
      required final String idempotencyKey,
      required final double estimatedFeeSol}) = _$UnsignedTransactionImpl;

  factory _UnsignedTransaction.fromJson(Map<String, dynamic> json) =
      _$UnsignedTransactionImpl.fromJson;

  @override
  String get transaction;
  @override
  String get idempotencyKey;
  @override
  double get estimatedFeeSol;

  /// Create a copy of UnsignedTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnsignedTransactionImplCopyWith<_$UnsignedTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignedTransactionRequest _$SignedTransactionRequestFromJson(
    Map<String, dynamic> json) {
  return _SignedTransactionRequest.fromJson(json);
}

/// @nodoc
mixin _$SignedTransactionRequest {
  AgentTransactionType get type => throw _privateConstructorUsedError;
  String get signedTransaction => throw _privateConstructorUsedError;
  String get idempotencyKey => throw _privateConstructorUsedError;

  /// Serializes this SignedTransactionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignedTransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignedTransactionRequestCopyWith<SignedTransactionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignedTransactionRequestCopyWith<$Res> {
  factory $SignedTransactionRequestCopyWith(SignedTransactionRequest value,
          $Res Function(SignedTransactionRequest) then) =
      _$SignedTransactionRequestCopyWithImpl<$Res, SignedTransactionRequest>;
  @useResult
  $Res call(
      {AgentTransactionType type,
      String signedTransaction,
      String idempotencyKey});
}

/// @nodoc
class _$SignedTransactionRequestCopyWithImpl<$Res,
        $Val extends SignedTransactionRequest>
    implements $SignedTransactionRequestCopyWith<$Res> {
  _$SignedTransactionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignedTransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? signedTransaction = null,
    Object? idempotencyKey = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AgentTransactionType,
      signedTransaction: null == signedTransaction
          ? _value.signedTransaction
          : signedTransaction // ignore: cast_nullable_to_non_nullable
              as String,
      idempotencyKey: null == idempotencyKey
          ? _value.idempotencyKey
          : idempotencyKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignedTransactionRequestImplCopyWith<$Res>
    implements $SignedTransactionRequestCopyWith<$Res> {
  factory _$$SignedTransactionRequestImplCopyWith(
          _$SignedTransactionRequestImpl value,
          $Res Function(_$SignedTransactionRequestImpl) then) =
      __$$SignedTransactionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AgentTransactionType type,
      String signedTransaction,
      String idempotencyKey});
}

/// @nodoc
class __$$SignedTransactionRequestImplCopyWithImpl<$Res>
    extends _$SignedTransactionRequestCopyWithImpl<$Res,
        _$SignedTransactionRequestImpl>
    implements _$$SignedTransactionRequestImplCopyWith<$Res> {
  __$$SignedTransactionRequestImplCopyWithImpl(
      _$SignedTransactionRequestImpl _value,
      $Res Function(_$SignedTransactionRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignedTransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? signedTransaction = null,
    Object? idempotencyKey = null,
  }) {
    return _then(_$SignedTransactionRequestImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AgentTransactionType,
      signedTransaction: null == signedTransaction
          ? _value.signedTransaction
          : signedTransaction // ignore: cast_nullable_to_non_nullable
              as String,
      idempotencyKey: null == idempotencyKey
          ? _value.idempotencyKey
          : idempotencyKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignedTransactionRequestImpl implements _SignedTransactionRequest {
  const _$SignedTransactionRequestImpl(
      {required this.type,
      required this.signedTransaction,
      required this.idempotencyKey});

  factory _$SignedTransactionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignedTransactionRequestImplFromJson(json);

  @override
  final AgentTransactionType type;
  @override
  final String signedTransaction;
  @override
  final String idempotencyKey;

  @override
  String toString() {
    return 'SignedTransactionRequest(type: $type, signedTransaction: $signedTransaction, idempotencyKey: $idempotencyKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignedTransactionRequestImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.signedTransaction, signedTransaction) ||
                other.signedTransaction == signedTransaction) &&
            (identical(other.idempotencyKey, idempotencyKey) ||
                other.idempotencyKey == idempotencyKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, signedTransaction, idempotencyKey);

  /// Create a copy of SignedTransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignedTransactionRequestImplCopyWith<_$SignedTransactionRequestImpl>
      get copyWith => __$$SignedTransactionRequestImplCopyWithImpl<
          _$SignedTransactionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignedTransactionRequestImplToJson(
      this,
    );
  }
}

abstract class _SignedTransactionRequest implements SignedTransactionRequest {
  const factory _SignedTransactionRequest(
      {required final AgentTransactionType type,
      required final String signedTransaction,
      required final String idempotencyKey}) = _$SignedTransactionRequestImpl;

  factory _SignedTransactionRequest.fromJson(Map<String, dynamic> json) =
      _$SignedTransactionRequestImpl.fromJson;

  @override
  AgentTransactionType get type;
  @override
  String get signedTransaction;
  @override
  String get idempotencyKey;

  /// Create a copy of SignedTransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignedTransactionRequestImplCopyWith<_$SignedTransactionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AgentHealth _$AgentHealthFromJson(Map<String, dynamic> json) {
  return _AgentHealth.fromJson(json);
}

/// @nodoc
mixin _$AgentHealth {
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this AgentHealth to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentHealth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentHealthCopyWith<AgentHealth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentHealthCopyWith<$Res> {
  factory $AgentHealthCopyWith(
          AgentHealth value, $Res Function(AgentHealth) then) =
      _$AgentHealthCopyWithImpl<$Res, AgentHealth>;
  @useResult
  $Res call({String status, String? message});
}

/// @nodoc
class _$AgentHealthCopyWithImpl<$Res, $Val extends AgentHealth>
    implements $AgentHealthCopyWith<$Res> {
  _$AgentHealthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentHealth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgentHealthImplCopyWith<$Res>
    implements $AgentHealthCopyWith<$Res> {
  factory _$$AgentHealthImplCopyWith(
          _$AgentHealthImpl value, $Res Function(_$AgentHealthImpl) then) =
      __$$AgentHealthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? message});
}

/// @nodoc
class __$$AgentHealthImplCopyWithImpl<$Res>
    extends _$AgentHealthCopyWithImpl<$Res, _$AgentHealthImpl>
    implements _$$AgentHealthImplCopyWith<$Res> {
  __$$AgentHealthImplCopyWithImpl(
      _$AgentHealthImpl _value, $Res Function(_$AgentHealthImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentHealth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
  }) {
    return _then(_$AgentHealthImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentHealthImpl implements _AgentHealth {
  const _$AgentHealthImpl({required this.status, this.message});

  factory _$AgentHealthImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentHealthImplFromJson(json);

  @override
  final String status;
  @override
  final String? message;

  @override
  String toString() {
    return 'AgentHealth(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentHealthImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  /// Create a copy of AgentHealth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentHealthImplCopyWith<_$AgentHealthImpl> get copyWith =>
      __$$AgentHealthImplCopyWithImpl<_$AgentHealthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentHealthImplToJson(
      this,
    );
  }
}

abstract class _AgentHealth implements AgentHealth {
  const factory _AgentHealth(
      {required final String status,
      final String? message}) = _$AgentHealthImpl;

  factory _AgentHealth.fromJson(Map<String, dynamic> json) =
      _$AgentHealthImpl.fromJson;

  @override
  String get status;
  @override
  String? get message;

  /// Create a copy of AgentHealth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentHealthImplCopyWith<_$AgentHealthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AgentMetrics _$AgentMetricsFromJson(Map<String, dynamic> json) {
  return _AgentMetrics.fromJson(json);
}

/// @nodoc
mixin _$AgentMetrics {
  String get timeframe => throw _privateConstructorUsedError;
  int get totalRequests => throw _privateConstructorUsedError;
  double get errorRate => throw _privateConstructorUsedError;
  int get averageResponseTimeMs => throw _privateConstructorUsedError;

  /// Serializes this AgentMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentMetricsCopyWith<AgentMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentMetricsCopyWith<$Res> {
  factory $AgentMetricsCopyWith(
          AgentMetrics value, $Res Function(AgentMetrics) then) =
      _$AgentMetricsCopyWithImpl<$Res, AgentMetrics>;
  @useResult
  $Res call(
      {String timeframe,
      int totalRequests,
      double errorRate,
      int averageResponseTimeMs});
}

/// @nodoc
class _$AgentMetricsCopyWithImpl<$Res, $Val extends AgentMetrics>
    implements $AgentMetricsCopyWith<$Res> {
  _$AgentMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeframe = null,
    Object? totalRequests = null,
    Object? errorRate = null,
    Object? averageResponseTimeMs = null,
  }) {
    return _then(_value.copyWith(
      timeframe: null == timeframe
          ? _value.timeframe
          : timeframe // ignore: cast_nullable_to_non_nullable
              as String,
      totalRequests: null == totalRequests
          ? _value.totalRequests
          : totalRequests // ignore: cast_nullable_to_non_nullable
              as int,
      errorRate: null == errorRate
          ? _value.errorRate
          : errorRate // ignore: cast_nullable_to_non_nullable
              as double,
      averageResponseTimeMs: null == averageResponseTimeMs
          ? _value.averageResponseTimeMs
          : averageResponseTimeMs // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgentMetricsImplCopyWith<$Res>
    implements $AgentMetricsCopyWith<$Res> {
  factory _$$AgentMetricsImplCopyWith(
          _$AgentMetricsImpl value, $Res Function(_$AgentMetricsImpl) then) =
      __$$AgentMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String timeframe,
      int totalRequests,
      double errorRate,
      int averageResponseTimeMs});
}

/// @nodoc
class __$$AgentMetricsImplCopyWithImpl<$Res>
    extends _$AgentMetricsCopyWithImpl<$Res, _$AgentMetricsImpl>
    implements _$$AgentMetricsImplCopyWith<$Res> {
  __$$AgentMetricsImplCopyWithImpl(
      _$AgentMetricsImpl _value, $Res Function(_$AgentMetricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeframe = null,
    Object? totalRequests = null,
    Object? errorRate = null,
    Object? averageResponseTimeMs = null,
  }) {
    return _then(_$AgentMetricsImpl(
      timeframe: null == timeframe
          ? _value.timeframe
          : timeframe // ignore: cast_nullable_to_non_nullable
              as String,
      totalRequests: null == totalRequests
          ? _value.totalRequests
          : totalRequests // ignore: cast_nullable_to_non_nullable
              as int,
      errorRate: null == errorRate
          ? _value.errorRate
          : errorRate // ignore: cast_nullable_to_non_nullable
              as double,
      averageResponseTimeMs: null == averageResponseTimeMs
          ? _value.averageResponseTimeMs
          : averageResponseTimeMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentMetricsImpl implements _AgentMetrics {
  const _$AgentMetricsImpl(
      {required this.timeframe,
      required this.totalRequests,
      required this.errorRate,
      required this.averageResponseTimeMs});

  factory _$AgentMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentMetricsImplFromJson(json);

  @override
  final String timeframe;
  @override
  final int totalRequests;
  @override
  final double errorRate;
  @override
  final int averageResponseTimeMs;

  @override
  String toString() {
    return 'AgentMetrics(timeframe: $timeframe, totalRequests: $totalRequests, errorRate: $errorRate, averageResponseTimeMs: $averageResponseTimeMs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentMetricsImpl &&
            (identical(other.timeframe, timeframe) ||
                other.timeframe == timeframe) &&
            (identical(other.totalRequests, totalRequests) ||
                other.totalRequests == totalRequests) &&
            (identical(other.errorRate, errorRate) ||
                other.errorRate == errorRate) &&
            (identical(other.averageResponseTimeMs, averageResponseTimeMs) ||
                other.averageResponseTimeMs == averageResponseTimeMs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, timeframe, totalRequests, errorRate, averageResponseTimeMs);

  /// Create a copy of AgentMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentMetricsImplCopyWith<_$AgentMetricsImpl> get copyWith =>
      __$$AgentMetricsImplCopyWithImpl<_$AgentMetricsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentMetricsImplToJson(
      this,
    );
  }
}

abstract class _AgentMetrics implements AgentMetrics {
  const factory _AgentMetrics(
      {required final String timeframe,
      required final int totalRequests,
      required final double errorRate,
      required final int averageResponseTimeMs}) = _$AgentMetricsImpl;

  factory _AgentMetrics.fromJson(Map<String, dynamic> json) =
      _$AgentMetricsImpl.fromJson;

  @override
  String get timeframe;
  @override
  int get totalRequests;
  @override
  double get errorRate;
  @override
  int get averageResponseTimeMs;

  /// Create a copy of AgentMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentMetricsImplCopyWith<_$AgentMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AgentSearchResponse _$AgentSearchResponseFromJson(Map<String, dynamic> json) {
  return _AgentSearchResponse.fromJson(json);
}

/// @nodoc
mixin _$AgentSearchResponse {
  List<GymAgent> get data => throw _privateConstructorUsedError;
  AgentPagination get pagination => throw _privateConstructorUsedError;

  /// Serializes this AgentSearchResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentSearchResponseCopyWith<AgentSearchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentSearchResponseCopyWith<$Res> {
  factory $AgentSearchResponseCopyWith(
          AgentSearchResponse value, $Res Function(AgentSearchResponse) then) =
      _$AgentSearchResponseCopyWithImpl<$Res, AgentSearchResponse>;
  @useResult
  $Res call({List<GymAgent> data, AgentPagination pagination});

  $AgentPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$AgentSearchResponseCopyWithImpl<$Res, $Val extends AgentSearchResponse>
    implements $AgentSearchResponseCopyWith<$Res> {
  _$AgentSearchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GymAgent>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as AgentPagination,
    ) as $Val);
  }

  /// Create a copy of AgentSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgentPaginationCopyWith<$Res> get pagination {
    return $AgentPaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AgentSearchResponseImplCopyWith<$Res>
    implements $AgentSearchResponseCopyWith<$Res> {
  factory _$$AgentSearchResponseImplCopyWith(_$AgentSearchResponseImpl value,
          $Res Function(_$AgentSearchResponseImpl) then) =
      __$$AgentSearchResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GymAgent> data, AgentPagination pagination});

  @override
  $AgentPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$AgentSearchResponseImplCopyWithImpl<$Res>
    extends _$AgentSearchResponseCopyWithImpl<$Res, _$AgentSearchResponseImpl>
    implements _$$AgentSearchResponseImplCopyWith<$Res> {
  __$$AgentSearchResponseImplCopyWithImpl(_$AgentSearchResponseImpl _value,
      $Res Function(_$AgentSearchResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? pagination = null,
  }) {
    return _then(_$AgentSearchResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GymAgent>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as AgentPagination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentSearchResponseImpl implements _AgentSearchResponse {
  const _$AgentSearchResponseImpl(
      {required final List<GymAgent> data, required this.pagination})
      : _data = data;

  factory _$AgentSearchResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentSearchResponseImplFromJson(json);

  final List<GymAgent> _data;
  @override
  List<GymAgent> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final AgentPagination pagination;

  @override
  String toString() {
    return 'AgentSearchResponse(data: $data, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentSearchResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), pagination);

  /// Create a copy of AgentSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentSearchResponseImplCopyWith<_$AgentSearchResponseImpl> get copyWith =>
      __$$AgentSearchResponseImplCopyWithImpl<_$AgentSearchResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentSearchResponseImplToJson(
      this,
    );
  }
}

abstract class _AgentSearchResponse implements AgentSearchResponse {
  const factory _AgentSearchResponse(
      {required final List<GymAgent> data,
      required final AgentPagination pagination}) = _$AgentSearchResponseImpl;

  factory _AgentSearchResponse.fromJson(Map<String, dynamic> json) =
      _$AgentSearchResponseImpl.fromJson;

  @override
  List<GymAgent> get data;
  @override
  AgentPagination get pagination;

  /// Create a copy of AgentSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentSearchResponseImplCopyWith<_$AgentSearchResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AgentPagination _$AgentPaginationFromJson(Map<String, dynamic> json) {
  return _AgentPagination.fromJson(json);
}

/// @nodoc
mixin _$AgentPagination {
  int get total => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;

  /// Serializes this AgentPagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentPaginationCopyWith<AgentPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentPaginationCopyWith<$Res> {
  factory $AgentPaginationCopyWith(
          AgentPagination value, $Res Function(AgentPagination) then) =
      _$AgentPaginationCopyWithImpl<$Res, AgentPagination>;
  @useResult
  $Res call({int total, int limit, int offset});
}

/// @nodoc
class _$AgentPaginationCopyWithImpl<$Res, $Val extends AgentPagination>
    implements $AgentPaginationCopyWith<$Res> {
  _$AgentPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgentPaginationImplCopyWith<$Res>
    implements $AgentPaginationCopyWith<$Res> {
  factory _$$AgentPaginationImplCopyWith(_$AgentPaginationImpl value,
          $Res Function(_$AgentPaginationImpl) then) =
      __$$AgentPaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int limit, int offset});
}

/// @nodoc
class __$$AgentPaginationImplCopyWithImpl<$Res>
    extends _$AgentPaginationCopyWithImpl<$Res, _$AgentPaginationImpl>
    implements _$$AgentPaginationImplCopyWith<$Res> {
  __$$AgentPaginationImplCopyWithImpl(
      _$AgentPaginationImpl _value, $Res Function(_$AgentPaginationImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_$AgentPaginationImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentPaginationImpl implements _AgentPagination {
  const _$AgentPaginationImpl(
      {required this.total, required this.limit, required this.offset});

  factory _$AgentPaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentPaginationImplFromJson(json);

  @override
  final int total;
  @override
  final int limit;
  @override
  final int offset;

  @override
  String toString() {
    return 'AgentPagination(total: $total, limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentPaginationImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, limit, offset);

  /// Create a copy of AgentPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentPaginationImplCopyWith<_$AgentPaginationImpl> get copyWith =>
      __$$AgentPaginationImplCopyWithImpl<_$AgentPaginationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentPaginationImplToJson(
      this,
    );
  }
}

abstract class _AgentPagination implements AgentPagination {
  const factory _AgentPagination(
      {required final int total,
      required final int limit,
      required final int offset}) = _$AgentPaginationImpl;

  factory _AgentPagination.fromJson(Map<String, dynamic> json) =
      _$AgentPaginationImpl.fromJson;

  @override
  int get total;
  @override
  int get limit;
  @override
  int get offset;

  /// Create a copy of AgentPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentPaginationImplCopyWith<_$AgentPaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubmitTxResponse _$SubmitTxResponseFromJson(Map<String, dynamic> json) {
  return _SubmitTxResponse.fromJson(json);
}

/// @nodoc
mixin _$SubmitTxResponse {
  String get message => throw _privateConstructorUsedError;
  String get agentId => throw _privateConstructorUsedError;
  AgentDeploymentStatus get status => throw _privateConstructorUsedError;
  String get idempotencyKey => throw _privateConstructorUsedError;

  /// Serializes this SubmitTxResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubmitTxResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubmitTxResponseCopyWith<SubmitTxResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitTxResponseCopyWith<$Res> {
  factory $SubmitTxResponseCopyWith(
          SubmitTxResponse value, $Res Function(SubmitTxResponse) then) =
      _$SubmitTxResponseCopyWithImpl<$Res, SubmitTxResponse>;
  @useResult
  $Res call(
      {String message,
      String agentId,
      AgentDeploymentStatus status,
      String idempotencyKey});
}

/// @nodoc
class _$SubmitTxResponseCopyWithImpl<$Res, $Val extends SubmitTxResponse>
    implements $SubmitTxResponseCopyWith<$Res> {
  _$SubmitTxResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubmitTxResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? agentId = null,
    Object? status = null,
    Object? idempotencyKey = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AgentDeploymentStatus,
      idempotencyKey: null == idempotencyKey
          ? _value.idempotencyKey
          : idempotencyKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmitTxResponseImplCopyWith<$Res>
    implements $SubmitTxResponseCopyWith<$Res> {
  factory _$$SubmitTxResponseImplCopyWith(_$SubmitTxResponseImpl value,
          $Res Function(_$SubmitTxResponseImpl) then) =
      __$$SubmitTxResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String agentId,
      AgentDeploymentStatus status,
      String idempotencyKey});
}

/// @nodoc
class __$$SubmitTxResponseImplCopyWithImpl<$Res>
    extends _$SubmitTxResponseCopyWithImpl<$Res, _$SubmitTxResponseImpl>
    implements _$$SubmitTxResponseImplCopyWith<$Res> {
  __$$SubmitTxResponseImplCopyWithImpl(_$SubmitTxResponseImpl _value,
      $Res Function(_$SubmitTxResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubmitTxResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? agentId = null,
    Object? status = null,
    Object? idempotencyKey = null,
  }) {
    return _then(_$SubmitTxResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AgentDeploymentStatus,
      idempotencyKey: null == idempotencyKey
          ? _value.idempotencyKey
          : idempotencyKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmitTxResponseImpl implements _SubmitTxResponse {
  const _$SubmitTxResponseImpl(
      {required this.message,
      required this.agentId,
      required this.status,
      required this.idempotencyKey});

  factory _$SubmitTxResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmitTxResponseImplFromJson(json);

  @override
  final String message;
  @override
  final String agentId;
  @override
  final AgentDeploymentStatus status;
  @override
  final String idempotencyKey;

  @override
  String toString() {
    return 'SubmitTxResponse(message: $message, agentId: $agentId, status: $status, idempotencyKey: $idempotencyKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitTxResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.agentId, agentId) || other.agentId == agentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.idempotencyKey, idempotencyKey) ||
                other.idempotencyKey == idempotencyKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, agentId, status, idempotencyKey);

  /// Create a copy of SubmitTxResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitTxResponseImplCopyWith<_$SubmitTxResponseImpl> get copyWith =>
      __$$SubmitTxResponseImplCopyWithImpl<_$SubmitTxResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmitTxResponseImplToJson(
      this,
    );
  }
}

abstract class _SubmitTxResponse implements SubmitTxResponse {
  const factory _SubmitTxResponse(
      {required final String message,
      required final String agentId,
      required final AgentDeploymentStatus status,
      required final String idempotencyKey}) = _$SubmitTxResponseImpl;

  factory _SubmitTxResponse.fromJson(Map<String, dynamic> json) =
      _$SubmitTxResponseImpl.fromJson;

  @override
  String get message;
  @override
  String get agentId;
  @override
  AgentDeploymentStatus get status;
  @override
  String get idempotencyKey;

  /// Create a copy of SubmitTxResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitTxResponseImplCopyWith<_$SubmitTxResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
