// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_creation_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenCreationDetails _$TokenCreationDetailsFromJson(Map<String, dynamic> json) {
  return _TokenCreationDetails.fromJson(json);
}

/// @nodoc
mixin _$TokenCreationDetails {
  String get txHash => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  int get slot => throw _privateConstructorUsedError;

  /// Serializes this TokenCreationDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenCreationDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenCreationDetailsCopyWith<TokenCreationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCreationDetailsCopyWith<$Res> {
  factory $TokenCreationDetailsCopyWith(TokenCreationDetails value,
          $Res Function(TokenCreationDetails) then) =
      _$TokenCreationDetailsCopyWithImpl<$Res, TokenCreationDetails>;
  @useResult
  $Res call({String txHash, int timestamp, int slot});
}

/// @nodoc
class _$TokenCreationDetailsCopyWithImpl<$Res,
        $Val extends TokenCreationDetails>
    implements $TokenCreationDetailsCopyWith<$Res> {
  _$TokenCreationDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenCreationDetails
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
abstract class _$$TokenCreationDetailsImplCopyWith<$Res>
    implements $TokenCreationDetailsCopyWith<$Res> {
  factory _$$TokenCreationDetailsImplCopyWith(_$TokenCreationDetailsImpl value,
          $Res Function(_$TokenCreationDetailsImpl) then) =
      __$$TokenCreationDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String txHash, int timestamp, int slot});
}

/// @nodoc
class __$$TokenCreationDetailsImplCopyWithImpl<$Res>
    extends _$TokenCreationDetailsCopyWithImpl<$Res, _$TokenCreationDetailsImpl>
    implements _$$TokenCreationDetailsImplCopyWith<$Res> {
  __$$TokenCreationDetailsImplCopyWithImpl(_$TokenCreationDetailsImpl _value,
      $Res Function(_$TokenCreationDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenCreationDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txHash = null,
    Object? timestamp = null,
    Object? slot = null,
  }) {
    return _then(_$TokenCreationDetailsImpl(
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
class _$TokenCreationDetailsImpl implements _TokenCreationDetails {
  const _$TokenCreationDetailsImpl(
      {required this.txHash, required this.timestamp, required this.slot});

  factory _$TokenCreationDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenCreationDetailsImplFromJson(json);

  @override
  final String txHash;
  @override
  final int timestamp;
  @override
  final int slot;

  @override
  String toString() {
    return 'TokenCreationDetails(txHash: $txHash, timestamp: $timestamp, slot: $slot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenCreationDetailsImpl &&
            (identical(other.txHash, txHash) || other.txHash == txHash) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.slot, slot) || other.slot == slot));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, txHash, timestamp, slot);

  /// Create a copy of TokenCreationDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenCreationDetailsImplCopyWith<_$TokenCreationDetailsImpl>
      get copyWith =>
          __$$TokenCreationDetailsImplCopyWithImpl<_$TokenCreationDetailsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenCreationDetailsImplToJson(
      this,
    );
  }
}

abstract class _TokenCreationDetails implements TokenCreationDetails {
  const factory _TokenCreationDetails(
      {required final String txHash,
      required final int timestamp,
      required final int slot}) = _$TokenCreationDetailsImpl;

  factory _TokenCreationDetails.fromJson(Map<String, dynamic> json) =
      _$TokenCreationDetailsImpl.fromJson;

  @override
  String get txHash;
  @override
  int get timestamp;
  @override
  int get slot;

  /// Create a copy of TokenCreationDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenCreationDetailsImplCopyWith<_$TokenCreationDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
