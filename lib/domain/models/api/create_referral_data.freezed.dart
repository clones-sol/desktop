// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_referral_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateReferralData _$CreateReferralDataFromJson(Map<String, dynamic> json) {
  return _CreateReferralData.fromJson(json);
}

/// @nodoc
mixin _$CreateReferralData {
  String get referralCode => throw _privateConstructorUsedError;
  String get referralLink => throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;

  /// Serializes this CreateReferralData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateReferralData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateReferralDataCopyWith<CreateReferralData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReferralDataCopyWith<$Res> {
  factory $CreateReferralDataCopyWith(
          CreateReferralData value, $Res Function(CreateReferralData) then) =
      _$CreateReferralDataCopyWithImpl<$Res, CreateReferralData>;
  @useResult
  $Res call({String referralCode, String referralLink, String walletAddress});
}

/// @nodoc
class _$CreateReferralDataCopyWithImpl<$Res, $Val extends CreateReferralData>
    implements $CreateReferralDataCopyWith<$Res> {
  _$CreateReferralDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateReferralData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCode = null,
    Object? referralLink = null,
    Object? walletAddress = null,
  }) {
    return _then(_value.copyWith(
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      referralLink: null == referralLink
          ? _value.referralLink
          : referralLink // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateReferralDataImplCopyWith<$Res>
    implements $CreateReferralDataCopyWith<$Res> {
  factory _$$CreateReferralDataImplCopyWith(_$CreateReferralDataImpl value,
          $Res Function(_$CreateReferralDataImpl) then) =
      __$$CreateReferralDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String referralCode, String referralLink, String walletAddress});
}

/// @nodoc
class __$$CreateReferralDataImplCopyWithImpl<$Res>
    extends _$CreateReferralDataCopyWithImpl<$Res, _$CreateReferralDataImpl>
    implements _$$CreateReferralDataImplCopyWith<$Res> {
  __$$CreateReferralDataImplCopyWithImpl(_$CreateReferralDataImpl _value,
      $Res Function(_$CreateReferralDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateReferralData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCode = null,
    Object? referralLink = null,
    Object? walletAddress = null,
  }) {
    return _then(_$CreateReferralDataImpl(
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      referralLink: null == referralLink
          ? _value.referralLink
          : referralLink // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateReferralDataImpl implements _CreateReferralData {
  const _$CreateReferralDataImpl(
      {required this.referralCode,
      required this.referralLink,
      required this.walletAddress});

  factory _$CreateReferralDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReferralDataImplFromJson(json);

  @override
  final String referralCode;
  @override
  final String referralLink;
  @override
  final String walletAddress;

  @override
  String toString() {
    return 'CreateReferralData(referralCode: $referralCode, referralLink: $referralLink, walletAddress: $walletAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReferralDataImpl &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.referralLink, referralLink) ||
                other.referralLink == referralLink) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, referralCode, referralLink, walletAddress);

  /// Create a copy of CreateReferralData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReferralDataImplCopyWith<_$CreateReferralDataImpl> get copyWith =>
      __$$CreateReferralDataImplCopyWithImpl<_$CreateReferralDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateReferralDataImplToJson(
      this,
    );
  }
}

abstract class _CreateReferralData implements CreateReferralData {
  const factory _CreateReferralData(
      {required final String referralCode,
      required final String referralLink,
      required final String walletAddress}) = _$CreateReferralDataImpl;

  factory _CreateReferralData.fromJson(Map<String, dynamic> json) =
      _$CreateReferralDataImpl.fromJson;

  @override
  String get referralCode;
  @override
  String get referralLink;
  @override
  String get walletAddress;

  /// Create a copy of CreateReferralData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateReferralDataImplCopyWith<_$CreateReferralDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
