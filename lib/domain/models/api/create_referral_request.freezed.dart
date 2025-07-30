// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_referral_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateReferralRequest _$CreateReferralRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateReferralRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateReferralRequest {
  String get walletAddress => throw _privateConstructorUsedError;

  /// Serializes this CreateReferralRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateReferralRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateReferralRequestCopyWith<CreateReferralRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReferralRequestCopyWith<$Res> {
  factory $CreateReferralRequestCopyWith(CreateReferralRequest value,
          $Res Function(CreateReferralRequest) then) =
      _$CreateReferralRequestCopyWithImpl<$Res, CreateReferralRequest>;
  @useResult
  $Res call({String walletAddress});
}

/// @nodoc
class _$CreateReferralRequestCopyWithImpl<$Res,
        $Val extends CreateReferralRequest>
    implements $CreateReferralRequestCopyWith<$Res> {
  _$CreateReferralRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateReferralRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletAddress = null,
  }) {
    return _then(_value.copyWith(
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateReferralRequestImplCopyWith<$Res>
    implements $CreateReferralRequestCopyWith<$Res> {
  factory _$$CreateReferralRequestImplCopyWith(
          _$CreateReferralRequestImpl value,
          $Res Function(_$CreateReferralRequestImpl) then) =
      __$$CreateReferralRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String walletAddress});
}

/// @nodoc
class __$$CreateReferralRequestImplCopyWithImpl<$Res>
    extends _$CreateReferralRequestCopyWithImpl<$Res,
        _$CreateReferralRequestImpl>
    implements _$$CreateReferralRequestImplCopyWith<$Res> {
  __$$CreateReferralRequestImplCopyWithImpl(_$CreateReferralRequestImpl _value,
      $Res Function(_$CreateReferralRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateReferralRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletAddress = null,
  }) {
    return _then(_$CreateReferralRequestImpl(
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateReferralRequestImpl implements _CreateReferralRequest {
  const _$CreateReferralRequestImpl({required this.walletAddress});

  factory _$CreateReferralRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReferralRequestImplFromJson(json);

  @override
  final String walletAddress;

  @override
  String toString() {
    return 'CreateReferralRequest(walletAddress: $walletAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReferralRequestImpl &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, walletAddress);

  /// Create a copy of CreateReferralRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReferralRequestImplCopyWith<_$CreateReferralRequestImpl>
      get copyWith => __$$CreateReferralRequestImplCopyWithImpl<
          _$CreateReferralRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateReferralRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateReferralRequest implements CreateReferralRequest {
  const factory _CreateReferralRequest({required final String walletAddress}) =
      _$CreateReferralRequestImpl;

  factory _CreateReferralRequest.fromJson(Map<String, dynamic> json) =
      _$CreateReferralRequestImpl.fromJson;

  @override
  String get walletAddress;

  /// Create a copy of CreateReferralRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateReferralRequestImplCopyWith<_$CreateReferralRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
