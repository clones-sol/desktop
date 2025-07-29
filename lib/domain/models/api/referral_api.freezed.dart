// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_api.dart';

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

CreateReferralResponse _$CreateReferralResponseFromJson(
    Map<String, dynamic> json) {
  return _CreateReferralResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateReferralResponse {
  String get referralCode => throw _privateConstructorUsedError;
  String get referralLink => throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this CreateReferralResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateReferralResponseCopyWith<CreateReferralResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReferralResponseCopyWith<$Res> {
  factory $CreateReferralResponseCopyWith(CreateReferralResponse value,
          $Res Function(CreateReferralResponse) then) =
      _$CreateReferralResponseCopyWithImpl<$Res, CreateReferralResponse>;
  @useResult
  $Res call(
      {String referralCode,
      String referralLink,
      String walletAddress,
      bool success,
      String? message});
}

/// @nodoc
class _$CreateReferralResponseCopyWithImpl<$Res,
        $Val extends CreateReferralResponse>
    implements $CreateReferralResponseCopyWith<$Res> {
  _$CreateReferralResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCode = null,
    Object? referralLink = null,
    Object? walletAddress = null,
    Object? success = null,
    Object? message = freezed,
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
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateReferralResponseImplCopyWith<$Res>
    implements $CreateReferralResponseCopyWith<$Res> {
  factory _$$CreateReferralResponseImplCopyWith(
          _$CreateReferralResponseImpl value,
          $Res Function(_$CreateReferralResponseImpl) then) =
      __$$CreateReferralResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String referralCode,
      String referralLink,
      String walletAddress,
      bool success,
      String? message});
}

/// @nodoc
class __$$CreateReferralResponseImplCopyWithImpl<$Res>
    extends _$CreateReferralResponseCopyWithImpl<$Res,
        _$CreateReferralResponseImpl>
    implements _$$CreateReferralResponseImplCopyWith<$Res> {
  __$$CreateReferralResponseImplCopyWithImpl(
      _$CreateReferralResponseImpl _value,
      $Res Function(_$CreateReferralResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCode = null,
    Object? referralLink = null,
    Object? walletAddress = null,
    Object? success = null,
    Object? message = freezed,
  }) {
    return _then(_$CreateReferralResponseImpl(
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
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateReferralResponseImpl implements _CreateReferralResponse {
  const _$CreateReferralResponseImpl(
      {required this.referralCode,
      required this.referralLink,
      required this.walletAddress,
      required this.success,
      this.message});

  factory _$CreateReferralResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReferralResponseImplFromJson(json);

  @override
  final String referralCode;
  @override
  final String referralLink;
  @override
  final String walletAddress;
  @override
  final bool success;
  @override
  final String? message;

  @override
  String toString() {
    return 'CreateReferralResponse(referralCode: $referralCode, referralLink: $referralLink, walletAddress: $walletAddress, success: $success, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReferralResponseImpl &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.referralLink, referralLink) ||
                other.referralLink == referralLink) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, referralCode, referralLink, walletAddress, success, message);

  /// Create a copy of CreateReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReferralResponseImplCopyWith<_$CreateReferralResponseImpl>
      get copyWith => __$$CreateReferralResponseImplCopyWithImpl<
          _$CreateReferralResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateReferralResponseImplToJson(
      this,
    );
  }
}

abstract class _CreateReferralResponse implements CreateReferralResponse {
  const factory _CreateReferralResponse(
      {required final String referralCode,
      required final String referralLink,
      required final String walletAddress,
      required final bool success,
      final String? message}) = _$CreateReferralResponseImpl;

  factory _CreateReferralResponse.fromJson(Map<String, dynamic> json) =
      _$CreateReferralResponseImpl.fromJson;

  @override
  String get referralCode;
  @override
  String get referralLink;
  @override
  String get walletAddress;
  @override
  bool get success;
  @override
  String? get message;

  /// Create a copy of CreateReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateReferralResponseImplCopyWith<_$CreateReferralResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetReferralInfoResponse _$GetReferralInfoResponseFromJson(
    Map<String, dynamic> json) {
  return _GetReferralInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$GetReferralInfoResponse {
  String get referralCode => throw _privateConstructorUsedError;
  String get referralLink => throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;
  int get totalReferrals => throw _privateConstructorUsedError;
  double get totalRewards => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

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
      {String referralCode,
      String referralLink,
      String walletAddress,
      int totalReferrals,
      double totalRewards,
      bool isActive,
      DateTime createdAt,
      DateTime? lastUpdated,
      bool success,
      String? message});
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
    Object? referralCode = null,
    Object? referralLink = null,
    Object? walletAddress = null,
    Object? totalReferrals = null,
    Object? totalRewards = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? lastUpdated = freezed,
    Object? success = null,
    Object? message = freezed,
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
      totalReferrals: null == totalReferrals
          ? _value.totalReferrals
          : totalReferrals // ignore: cast_nullable_to_non_nullable
              as int,
      totalRewards: null == totalRewards
          ? _value.totalRewards
          : totalRewards // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {String referralCode,
      String referralLink,
      String walletAddress,
      int totalReferrals,
      double totalRewards,
      bool isActive,
      DateTime createdAt,
      DateTime? lastUpdated,
      bool success,
      String? message});
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
    Object? referralCode = null,
    Object? referralLink = null,
    Object? walletAddress = null,
    Object? totalReferrals = null,
    Object? totalRewards = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? lastUpdated = freezed,
    Object? success = null,
    Object? message = freezed,
  }) {
    return _then(_$GetReferralInfoResponseImpl(
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
      totalReferrals: null == totalReferrals
          ? _value.totalReferrals
          : totalReferrals // ignore: cast_nullable_to_non_nullable
              as int,
      totalRewards: null == totalRewards
          ? _value.totalRewards
          : totalRewards // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetReferralInfoResponseImpl implements _GetReferralInfoResponse {
  const _$GetReferralInfoResponseImpl(
      {required this.referralCode,
      required this.referralLink,
      required this.walletAddress,
      required this.totalReferrals,
      required this.totalRewards,
      required this.isActive,
      required this.createdAt,
      this.lastUpdated,
      required this.success,
      this.message});

  factory _$GetReferralInfoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetReferralInfoResponseImplFromJson(json);

  @override
  final String referralCode;
  @override
  final String referralLink;
  @override
  final String walletAddress;
  @override
  final int totalReferrals;
  @override
  final double totalRewards;
  @override
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime? lastUpdated;
  @override
  final bool success;
  @override
  final String? message;

  @override
  String toString() {
    return 'GetReferralInfoResponse(referralCode: $referralCode, referralLink: $referralLink, walletAddress: $walletAddress, totalReferrals: $totalReferrals, totalRewards: $totalRewards, isActive: $isActive, createdAt: $createdAt, lastUpdated: $lastUpdated, success: $success, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetReferralInfoResponseImpl &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.referralLink, referralLink) ||
                other.referralLink == referralLink) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.totalReferrals, totalReferrals) ||
                other.totalReferrals == totalReferrals) &&
            (identical(other.totalRewards, totalRewards) ||
                other.totalRewards == totalRewards) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      referralCode,
      referralLink,
      walletAddress,
      totalReferrals,
      totalRewards,
      isActive,
      createdAt,
      lastUpdated,
      success,
      message);

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
      {required final String referralCode,
      required final String referralLink,
      required final String walletAddress,
      required final int totalReferrals,
      required final double totalRewards,
      required final bool isActive,
      required final DateTime createdAt,
      final DateTime? lastUpdated,
      required final bool success,
      final String? message}) = _$GetReferralInfoResponseImpl;

  factory _GetReferralInfoResponse.fromJson(Map<String, dynamic> json) =
      _$GetReferralInfoResponseImpl.fromJson;

  @override
  String get referralCode;
  @override
  String get referralLink;
  @override
  String get walletAddress;
  @override
  int get totalReferrals;
  @override
  double get totalRewards;
  @override
  bool get isActive;
  @override
  DateTime get createdAt;
  @override
  DateTime? get lastUpdated;
  @override
  bool get success;
  @override
  String? get message;

  /// Create a copy of GetReferralInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetReferralInfoResponseImplCopyWith<_$GetReferralInfoResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
