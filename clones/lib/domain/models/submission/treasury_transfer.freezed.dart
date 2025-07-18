// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'treasury_transfer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TreasuryTransfer _$TreasuryTransferFromJson(Map<String, dynamic> json) {
  return _TreasuryTransfer.fromJson(json);
}

/// @nodoc
mixin _$TreasuryTransfer {
  String get tokenAddress => throw _privateConstructorUsedError;
  String get treasuryWallet => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  String? get txHash => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;

  /// Serializes this TreasuryTransfer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TreasuryTransfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreasuryTransferCopyWith<TreasuryTransfer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreasuryTransferCopyWith<$Res> {
  factory $TreasuryTransferCopyWith(
          TreasuryTransfer value, $Res Function(TreasuryTransfer) then) =
      _$TreasuryTransferCopyWithImpl<$Res, TreasuryTransfer>;
  @useResult
  $Res call(
      {String tokenAddress,
      String treasuryWallet,
      int amount,
      int timestamp,
      String? txHash,
      @JsonKey(name: '_id') String id});
}

/// @nodoc
class _$TreasuryTransferCopyWithImpl<$Res, $Val extends TreasuryTransfer>
    implements $TreasuryTransferCopyWith<$Res> {
  _$TreasuryTransferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreasuryTransfer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenAddress = null,
    Object? treasuryWallet = null,
    Object? amount = null,
    Object? timestamp = null,
    Object? txHash = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      tokenAddress: null == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String,
      treasuryWallet: null == treasuryWallet
          ? _value.treasuryWallet
          : treasuryWallet // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      txHash: freezed == txHash
          ? _value.txHash
          : txHash // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreasuryTransferImplCopyWith<$Res>
    implements $TreasuryTransferCopyWith<$Res> {
  factory _$$TreasuryTransferImplCopyWith(_$TreasuryTransferImpl value,
          $Res Function(_$TreasuryTransferImpl) then) =
      __$$TreasuryTransferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tokenAddress,
      String treasuryWallet,
      int amount,
      int timestamp,
      String? txHash,
      @JsonKey(name: '_id') String id});
}

/// @nodoc
class __$$TreasuryTransferImplCopyWithImpl<$Res>
    extends _$TreasuryTransferCopyWithImpl<$Res, _$TreasuryTransferImpl>
    implements _$$TreasuryTransferImplCopyWith<$Res> {
  __$$TreasuryTransferImplCopyWithImpl(_$TreasuryTransferImpl _value,
      $Res Function(_$TreasuryTransferImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreasuryTransfer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenAddress = null,
    Object? treasuryWallet = null,
    Object? amount = null,
    Object? timestamp = null,
    Object? txHash = freezed,
    Object? id = null,
  }) {
    return _then(_$TreasuryTransferImpl(
      tokenAddress: null == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String,
      treasuryWallet: null == treasuryWallet
          ? _value.treasuryWallet
          : treasuryWallet // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      txHash: freezed == txHash
          ? _value.txHash
          : txHash // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreasuryTransferImpl implements _TreasuryTransfer {
  const _$TreasuryTransferImpl(
      {required this.tokenAddress,
      required this.treasuryWallet,
      required this.amount,
      required this.timestamp,
      this.txHash,
      @JsonKey(name: '_id') required this.id});

  factory _$TreasuryTransferImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreasuryTransferImplFromJson(json);

  @override
  final String tokenAddress;
  @override
  final String treasuryWallet;
  @override
  final int amount;
  @override
  final int timestamp;
  @override
  final String? txHash;
  @override
  @JsonKey(name: '_id')
  final String id;

  @override
  String toString() {
    return 'TreasuryTransfer(tokenAddress: $tokenAddress, treasuryWallet: $treasuryWallet, amount: $amount, timestamp: $timestamp, txHash: $txHash, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreasuryTransferImpl &&
            (identical(other.tokenAddress, tokenAddress) ||
                other.tokenAddress == tokenAddress) &&
            (identical(other.treasuryWallet, treasuryWallet) ||
                other.treasuryWallet == treasuryWallet) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.txHash, txHash) || other.txHash == txHash) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, tokenAddress, treasuryWallet, amount, timestamp, txHash, id);

  /// Create a copy of TreasuryTransfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreasuryTransferImplCopyWith<_$TreasuryTransferImpl> get copyWith =>
      __$$TreasuryTransferImplCopyWithImpl<_$TreasuryTransferImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreasuryTransferImplToJson(
      this,
    );
  }
}

abstract class _TreasuryTransfer implements TreasuryTransfer {
  const factory _TreasuryTransfer(
      {required final String tokenAddress,
      required final String treasuryWallet,
      required final int amount,
      required final int timestamp,
      final String? txHash,
      @JsonKey(name: '_id') required final String id}) = _$TreasuryTransferImpl;

  factory _TreasuryTransfer.fromJson(Map<String, dynamic> json) =
      _$TreasuryTransferImpl.fromJson;

  @override
  String get tokenAddress;
  @override
  String get treasuryWallet;
  @override
  int get amount;
  @override
  int get timestamp;
  @override
  String? get txHash;
  @override
  @JsonKey(name: '_id')
  String get id;

  /// Create a copy of TreasuryTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreasuryTransferImplCopyWith<_$TreasuryTransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
