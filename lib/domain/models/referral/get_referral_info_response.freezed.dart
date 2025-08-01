// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_referral_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetReferralInfoResponse _$GetReferralInfoResponseFromJson(
    Map<String, dynamic> json) {
  return _GetReferralInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$GetReferralInfoResponse {
  int get totalReferrals => throw _privateConstructorUsedError;
  double get totalRewards => throw _privateConstructorUsedError;
  String get referralCode => throw _privateConstructorUsedError;
  List<Referral> get referrals => throw _privateConstructorUsedError;

  /// Serializes this GetReferralInfoResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetReferralInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetReferralInfoResponseCopyWith<GetReferralInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetReferralInfoResponseCopyWith<$Res> {
  factory $GetReferralInfoResponseCopyWith(GetReferralInfoResponse value,
          $Res Function(GetReferralInfoResponse) then) =
      _$GetReferralInfoResponseCopyWithImpl<$Res, GetReferralInfoResponse>;
  @useResult
  $Res call(
      {int totalReferrals,
      double totalRewards,
      String referralCode,
      List<Referral> referrals});
}

/// @nodoc
class _$GetReferralInfoResponseCopyWithImpl<$Res,
        $Val extends GetReferralInfoResponse>
    implements $GetReferralInfoResponseCopyWith<$Res> {
  _$GetReferralInfoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetReferralInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReferrals = null,
    Object? totalRewards = null,
    Object? referralCode = null,
    Object? referrals = null,
  }) {
    return _then(_value.copyWith(
      totalReferrals: null == totalReferrals
          ? _value.totalReferrals
          : totalReferrals // ignore: cast_nullable_to_non_nullable
              as int,
      totalRewards: null == totalRewards
          ? _value.totalRewards
          : totalRewards // ignore: cast_nullable_to_non_nullable
              as double,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      referrals: null == referrals
          ? _value.referrals
          : referrals // ignore: cast_nullable_to_non_nullable
              as List<Referral>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetReferralInfoResponseImplCopyWith<$Res>
    implements $GetReferralInfoResponseCopyWith<$Res> {
  factory _$$GetReferralInfoResponseImplCopyWith(
          _$GetReferralInfoResponseImpl value,
          $Res Function(_$GetReferralInfoResponseImpl) then) =
      __$$GetReferralInfoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalReferrals,
      double totalRewards,
      String referralCode,
      List<Referral> referrals});
}

/// @nodoc
class __$$GetReferralInfoResponseImplCopyWithImpl<$Res>
    extends _$GetReferralInfoResponseCopyWithImpl<$Res,
        _$GetReferralInfoResponseImpl>
    implements _$$GetReferralInfoResponseImplCopyWith<$Res> {
  __$$GetReferralInfoResponseImplCopyWithImpl(
      _$GetReferralInfoResponseImpl _value,
      $Res Function(_$GetReferralInfoResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetReferralInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReferrals = null,
    Object? totalRewards = null,
    Object? referralCode = null,
    Object? referrals = null,
  }) {
    return _then(_$GetReferralInfoResponseImpl(
      totalReferrals: null == totalReferrals
          ? _value.totalReferrals
          : totalReferrals // ignore: cast_nullable_to_non_nullable
              as int,
      totalRewards: null == totalRewards
          ? _value.totalRewards
          : totalRewards // ignore: cast_nullable_to_non_nullable
              as double,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      referrals: null == referrals
          ? _value._referrals
          : referrals // ignore: cast_nullable_to_non_nullable
              as List<Referral>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetReferralInfoResponseImpl implements _GetReferralInfoResponse {
  const _$GetReferralInfoResponseImpl(
      {required this.totalReferrals,
      required this.totalRewards,
      required this.referralCode,
      required final List<Referral> referrals})
      : _referrals = referrals;

  factory _$GetReferralInfoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetReferralInfoResponseImplFromJson(json);

  @override
  final int totalReferrals;
  @override
  final double totalRewards;
  @override
  final String referralCode;
  final List<Referral> _referrals;
  @override
  List<Referral> get referrals {
    if (_referrals is EqualUnmodifiableListView) return _referrals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_referrals);
  }

  @override
  String toString() {
    return 'GetReferralInfoResponse(totalReferrals: $totalReferrals, totalRewards: $totalRewards, referralCode: $referralCode, referrals: $referrals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetReferralInfoResponseImpl &&
            (identical(other.totalReferrals, totalReferrals) ||
                other.totalReferrals == totalReferrals) &&
            (identical(other.totalRewards, totalRewards) ||
                other.totalRewards == totalRewards) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            const DeepCollectionEquality()
                .equals(other._referrals, _referrals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalReferrals, totalRewards,
      referralCode, const DeepCollectionEquality().hash(_referrals));

  /// Create a copy of GetReferralInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetReferralInfoResponseImplCopyWith<_$GetReferralInfoResponseImpl>
      get copyWith => __$$GetReferralInfoResponseImplCopyWithImpl<
          _$GetReferralInfoResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetReferralInfoResponseImplToJson(
      this,
    );
  }
}

abstract class _GetReferralInfoResponse implements GetReferralInfoResponse {
  const factory _GetReferralInfoResponse(
      {required final int totalReferrals,
      required final double totalRewards,
      required final String referralCode,
      required final List<Referral> referrals}) = _$GetReferralInfoResponseImpl;

  factory _GetReferralInfoResponse.fromJson(Map<String, dynamic> json) =
      _$GetReferralInfoResponseImpl.fromJson;

  @override
  int get totalReferrals;
  @override
  double get totalRewards;
  @override
  String get referralCode;
  @override
  List<Referral> get referrals;

  /// Create a copy of GetReferralInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetReferralInfoResponseImplCopyWith<_$GetReferralInfoResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
