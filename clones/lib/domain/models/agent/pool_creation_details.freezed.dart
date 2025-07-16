// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pool_creation_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PoolCreationDetails _$PoolCreationDetailsFromJson(Map<String, dynamic> json) {
  return _PoolCreationDetails.fromJson(json);
}

/// @nodoc
mixin _$PoolCreationDetails {
  String get txHash => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  int get slot => throw _privateConstructorUsedError;

  /// Serializes this PoolCreationDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoolCreationDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoolCreationDetailsCopyWith<PoolCreationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoolCreationDetailsCopyWith<$Res> {
  factory $PoolCreationDetailsCopyWith(
          PoolCreationDetails value, $Res Function(PoolCreationDetails) then) =
      _$PoolCreationDetailsCopyWithImpl<$Res, PoolCreationDetails>;
  @useResult
  $Res call({String txHash, int timestamp, int slot});
}

/// @nodoc
class _$PoolCreationDetailsCopyWithImpl<$Res, $Val extends PoolCreationDetails>
    implements $PoolCreationDetailsCopyWith<$Res> {
  _$PoolCreationDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoolCreationDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txHash = null,
    Object? timestamp = null,
    Object? slot = null,
  }) {
    return _then(_value.copyWith(
      txHash: null == txHash
          ? _value.txHash
          : txHash // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoolCreationDetailsImplCopyWith<$Res>
    implements $PoolCreationDetailsCopyWith<$Res> {
  factory _$$PoolCreationDetailsImplCopyWith(_$PoolCreationDetailsImpl value,
          $Res Function(_$PoolCreationDetailsImpl) then) =
      __$$PoolCreationDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String txHash, int timestamp, int slot});
}

/// @nodoc
class __$$PoolCreationDetailsImplCopyWithImpl<$Res>
    extends _$PoolCreationDetailsCopyWithImpl<$Res, _$PoolCreationDetailsImpl>
    implements _$$PoolCreationDetailsImplCopyWith<$Res> {
  __$$PoolCreationDetailsImplCopyWithImpl(_$PoolCreationDetailsImpl _value,
      $Res Function(_$PoolCreationDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoolCreationDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txHash = null,
    Object? timestamp = null,
    Object? slot = null,
  }) {
    return _then(_$PoolCreationDetailsImpl(
      txHash: null == txHash
          ? _value.txHash
          : txHash // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoolCreationDetailsImpl implements _PoolCreationDetails {
  const _$PoolCreationDetailsImpl(
      {required this.txHash, required this.timestamp, required this.slot});

  factory _$PoolCreationDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoolCreationDetailsImplFromJson(json);

  @override
  final String txHash;
  @override
  final int timestamp;
  @override
  final int slot;

  @override
  String toString() {
    return 'PoolCreationDetails(txHash: $txHash, timestamp: $timestamp, slot: $slot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoolCreationDetailsImpl &&
            (identical(other.txHash, txHash) || other.txHash == txHash) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.slot, slot) || other.slot == slot));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, txHash, timestamp, slot);

  /// Create a copy of PoolCreationDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoolCreationDetailsImplCopyWith<_$PoolCreationDetailsImpl> get copyWith =>
      __$$PoolCreationDetailsImplCopyWithImpl<_$PoolCreationDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoolCreationDetailsImplToJson(
      this,
    );
  }
}

abstract class _PoolCreationDetails implements PoolCreationDetails {
  const factory _PoolCreationDetails(
      {required final String txHash,
      required final int timestamp,
      required final int slot}) = _$PoolCreationDetailsImpl;

  factory _PoolCreationDetails.fromJson(Map<String, dynamic> json) =
      _$PoolCreationDetailsImpl.fromJson;

  @override
  String get txHash;
  @override
  int get timestamp;
  @override
  int get slot;

  /// Create a copy of PoolCreationDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoolCreationDetailsImplCopyWith<_$PoolCreationDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
