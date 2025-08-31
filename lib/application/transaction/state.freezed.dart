// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionState _$TransactionStateFromJson(Map<String, dynamic> json) {
  return _TransactionState.fromJson(json);
}

/// @nodoc
mixin _$TransactionState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get awaitingCallback => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get lastSuccessfulTx => throw _privateConstructorUsedError;
  String? get currentTransactionType => throw _privateConstructorUsedError;
  String? get currentSessionId => throw _privateConstructorUsedError;

  /// Serializes this TransactionState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionStateCopyWith<TransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStateCopyWith<$Res> {
  factory $TransactionStateCopyWith(
          TransactionState value, $Res Function(TransactionState) then) =
      _$TransactionStateCopyWithImpl<$Res, TransactionState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool awaitingCallback,
      String? error,
      String? lastSuccessfulTx,
      String? currentTransactionType,
      String? currentSessionId});
}

/// @nodoc
class _$TransactionStateCopyWithImpl<$Res, $Val extends TransactionState>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? awaitingCallback = null,
    Object? error = freezed,
    Object? lastSuccessfulTx = freezed,
    Object? currentTransactionType = freezed,
    Object? currentSessionId = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      awaitingCallback: null == awaitingCallback
          ? _value.awaitingCallback
          : awaitingCallback // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSuccessfulTx: freezed == lastSuccessfulTx
          ? _value.lastSuccessfulTx
          : lastSuccessfulTx // ignore: cast_nullable_to_non_nullable
              as String?,
      currentTransactionType: freezed == currentTransactionType
          ? _value.currentTransactionType
          : currentTransactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      currentSessionId: freezed == currentSessionId
          ? _value.currentSessionId
          : currentSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionStateImplCopyWith<$Res>
    implements $TransactionStateCopyWith<$Res> {
  factory _$$TransactionStateImplCopyWith(_$TransactionStateImpl value,
          $Res Function(_$TransactionStateImpl) then) =
      __$$TransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool awaitingCallback,
      String? error,
      String? lastSuccessfulTx,
      String? currentTransactionType,
      String? currentSessionId});
}

/// @nodoc
class __$$TransactionStateImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionStateImpl>
    implements _$$TransactionStateImplCopyWith<$Res> {
  __$$TransactionStateImplCopyWithImpl(_$TransactionStateImpl _value,
      $Res Function(_$TransactionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? awaitingCallback = null,
    Object? error = freezed,
    Object? lastSuccessfulTx = freezed,
    Object? currentTransactionType = freezed,
    Object? currentSessionId = freezed,
  }) {
    return _then(_$TransactionStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      awaitingCallback: null == awaitingCallback
          ? _value.awaitingCallback
          : awaitingCallback // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSuccessfulTx: freezed == lastSuccessfulTx
          ? _value.lastSuccessfulTx
          : lastSuccessfulTx // ignore: cast_nullable_to_non_nullable
              as String?,
      currentTransactionType: freezed == currentTransactionType
          ? _value.currentTransactionType
          : currentTransactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      currentSessionId: freezed == currentSessionId
          ? _value.currentSessionId
          : currentSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionStateImpl implements _TransactionState {
  const _$TransactionStateImpl(
      {this.isLoading = false,
      this.awaitingCallback = false,
      this.error,
      this.lastSuccessfulTx,
      this.currentTransactionType,
      this.currentSessionId});

  factory _$TransactionStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool awaitingCallback;
  @override
  final String? error;
  @override
  final String? lastSuccessfulTx;
  @override
  final String? currentTransactionType;
  @override
  final String? currentSessionId;

  @override
  String toString() {
    return 'TransactionState(isLoading: $isLoading, awaitingCallback: $awaitingCallback, error: $error, lastSuccessfulTx: $lastSuccessfulTx, currentTransactionType: $currentTransactionType, currentSessionId: $currentSessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.awaitingCallback, awaitingCallback) ||
                other.awaitingCallback == awaitingCallback) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.lastSuccessfulTx, lastSuccessfulTx) ||
                other.lastSuccessfulTx == lastSuccessfulTx) &&
            (identical(other.currentTransactionType, currentTransactionType) ||
                other.currentTransactionType == currentTransactionType) &&
            (identical(other.currentSessionId, currentSessionId) ||
                other.currentSessionId == currentSessionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading, awaitingCallback,
      error, lastSuccessfulTx, currentTransactionType, currentSessionId);

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionStateImplCopyWith<_$TransactionStateImpl> get copyWith =>
      __$$TransactionStateImplCopyWithImpl<_$TransactionStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionStateImplToJson(
      this,
    );
  }
}

abstract class _TransactionState implements TransactionState {
  const factory _TransactionState(
      {final bool isLoading,
      final bool awaitingCallback,
      final String? error,
      final String? lastSuccessfulTx,
      final String? currentTransactionType,
      final String? currentSessionId}) = _$TransactionStateImpl;

  factory _TransactionState.fromJson(Map<String, dynamic> json) =
      _$TransactionStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  bool get awaitingCallback;
  @override
  String? get error;
  @override
  String? get lastSuccessfulTx;
  @override
  String? get currentTransactionType;
  @override
  String? get currentSessionId;

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionStateImplCopyWith<_$TransactionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
