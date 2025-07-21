// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_blockchain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgentBlockchain _$AgentBlockchainFromJson(Map<String, dynamic> json) {
  return _AgentBlockchain.fromJson(json);
}

/// @nodoc
mixin _$AgentBlockchain {
  String? get tokenAddress => throw _privateConstructorUsedError;
  TokenCreationDetails? get tokenCreationDetails =>
      throw _privateConstructorUsedError;
  String? get poolAddress => throw _privateConstructorUsedError;
  PoolCreationDetails? get poolCreationDetails =>
      throw _privateConstructorUsedError;

  /// Serializes this AgentBlockchain to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentBlockchain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentBlockchainCopyWith<AgentBlockchain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentBlockchainCopyWith<$Res> {
  factory $AgentBlockchainCopyWith(
          AgentBlockchain value, $Res Function(AgentBlockchain) then) =
      _$AgentBlockchainCopyWithImpl<$Res, AgentBlockchain>;
  @useResult
  $Res call(
      {String? tokenAddress,
      TokenCreationDetails? tokenCreationDetails,
      String? poolAddress,
      PoolCreationDetails? poolCreationDetails});

  $TokenCreationDetailsCopyWith<$Res>? get tokenCreationDetails;
  $PoolCreationDetailsCopyWith<$Res>? get poolCreationDetails;
}

/// @nodoc
class _$AgentBlockchainCopyWithImpl<$Res, $Val extends AgentBlockchain>
    implements $AgentBlockchainCopyWith<$Res> {
  _$AgentBlockchainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentBlockchain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenAddress = freezed,
    Object? tokenCreationDetails = freezed,
    Object? poolAddress = freezed,
    Object? poolCreationDetails = freezed,
  }) {
    return _then(_value.copyWith(
      tokenAddress: freezed == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenCreationDetails: freezed == tokenCreationDetails
          ? _value.tokenCreationDetails
          : tokenCreationDetails // ignore: cast_nullable_to_non_nullable
              as TokenCreationDetails?,
      poolAddress: freezed == poolAddress
          ? _value.poolAddress
          : poolAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      poolCreationDetails: freezed == poolCreationDetails
          ? _value.poolCreationDetails
          : poolCreationDetails // ignore: cast_nullable_to_non_nullable
              as PoolCreationDetails?,
    ) as $Val);
  }

  /// Create a copy of AgentBlockchain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenCreationDetailsCopyWith<$Res>? get tokenCreationDetails {
    if (_value.tokenCreationDetails == null) {
      return null;
    }

    return $TokenCreationDetailsCopyWith<$Res>(_value.tokenCreationDetails!,
        (value) {
      return _then(_value.copyWith(tokenCreationDetails: value) as $Val);
    });
  }

  /// Create a copy of AgentBlockchain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PoolCreationDetailsCopyWith<$Res>? get poolCreationDetails {
    if (_value.poolCreationDetails == null) {
      return null;
    }

    return $PoolCreationDetailsCopyWith<$Res>(_value.poolCreationDetails!,
        (value) {
      return _then(_value.copyWith(poolCreationDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AgentBlockchainImplCopyWith<$Res>
    implements $AgentBlockchainCopyWith<$Res> {
  factory _$$AgentBlockchainImplCopyWith(_$AgentBlockchainImpl value,
          $Res Function(_$AgentBlockchainImpl) then) =
      __$$AgentBlockchainImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? tokenAddress,
      TokenCreationDetails? tokenCreationDetails,
      String? poolAddress,
      PoolCreationDetails? poolCreationDetails});

  @override
  $TokenCreationDetailsCopyWith<$Res>? get tokenCreationDetails;
  @override
  $PoolCreationDetailsCopyWith<$Res>? get poolCreationDetails;
}

/// @nodoc
class __$$AgentBlockchainImplCopyWithImpl<$Res>
    extends _$AgentBlockchainCopyWithImpl<$Res, _$AgentBlockchainImpl>
    implements _$$AgentBlockchainImplCopyWith<$Res> {
  __$$AgentBlockchainImplCopyWithImpl(
      _$AgentBlockchainImpl _value, $Res Function(_$AgentBlockchainImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentBlockchain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenAddress = freezed,
    Object? tokenCreationDetails = freezed,
    Object? poolAddress = freezed,
    Object? poolCreationDetails = freezed,
  }) {
    return _then(_$AgentBlockchainImpl(
      tokenAddress: freezed == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenCreationDetails: freezed == tokenCreationDetails
          ? _value.tokenCreationDetails
          : tokenCreationDetails // ignore: cast_nullable_to_non_nullable
              as TokenCreationDetails?,
      poolAddress: freezed == poolAddress
          ? _value.poolAddress
          : poolAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      poolCreationDetails: freezed == poolCreationDetails
          ? _value.poolCreationDetails
          : poolCreationDetails // ignore: cast_nullable_to_non_nullable
              as PoolCreationDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentBlockchainImpl implements _AgentBlockchain {
  const _$AgentBlockchainImpl(
      {this.tokenAddress,
      this.tokenCreationDetails,
      this.poolAddress,
      this.poolCreationDetails});

  factory _$AgentBlockchainImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentBlockchainImplFromJson(json);

  @override
  final String? tokenAddress;
  @override
  final TokenCreationDetails? tokenCreationDetails;
  @override
  final String? poolAddress;
  @override
  final PoolCreationDetails? poolCreationDetails;

  @override
  String toString() {
    return 'AgentBlockchain(tokenAddress: $tokenAddress, tokenCreationDetails: $tokenCreationDetails, poolAddress: $poolAddress, poolCreationDetails: $poolCreationDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentBlockchainImpl &&
            (identical(other.tokenAddress, tokenAddress) ||
                other.tokenAddress == tokenAddress) &&
            (identical(other.tokenCreationDetails, tokenCreationDetails) ||
                other.tokenCreationDetails == tokenCreationDetails) &&
            (identical(other.poolAddress, poolAddress) ||
                other.poolAddress == poolAddress) &&
            (identical(other.poolCreationDetails, poolCreationDetails) ||
                other.poolCreationDetails == poolCreationDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tokenAddress,
      tokenCreationDetails, poolAddress, poolCreationDetails);

  /// Create a copy of AgentBlockchain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentBlockchainImplCopyWith<_$AgentBlockchainImpl> get copyWith =>
      __$$AgentBlockchainImplCopyWithImpl<_$AgentBlockchainImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentBlockchainImplToJson(
      this,
    );
  }
}

abstract class _AgentBlockchain implements AgentBlockchain {
  const factory _AgentBlockchain(
      {final String? tokenAddress,
      final TokenCreationDetails? tokenCreationDetails,
      final String? poolAddress,
      final PoolCreationDetails? poolCreationDetails}) = _$AgentBlockchainImpl;

  factory _AgentBlockchain.fromJson(Map<String, dynamic> json) =
      _$AgentBlockchainImpl.fromJson;

  @override
  String? get tokenAddress;
  @override
  TokenCreationDetails? get tokenCreationDetails;
  @override
  String? get poolAddress;
  @override
  PoolCreationDetails? get poolCreationDetails;

  /// Create a copy of AgentBlockchain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentBlockchainImplCopyWith<_$AgentBlockchainImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
