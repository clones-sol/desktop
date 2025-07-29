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
  bool get success => throw _privateConstructorUsedError;
  CreateReferralData get data => throw _privateConstructorUsedError;
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
  $Res call({bool success, CreateReferralData data, String? message});

  $CreateReferralDataCopyWith<$Res> get data;
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
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CreateReferralData,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CreateReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateReferralDataCopyWith<$Res> get data {
    return $CreateReferralDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
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
  $Res call({bool success, CreateReferralData data, String? message});

  @override
  $CreateReferralDataCopyWith<$Res> get data;
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
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(_$CreateReferralResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CreateReferralData,
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
      {required this.success, required this.data, this.message});

  factory _$CreateReferralResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReferralResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final CreateReferralData data;
  @override
  final String? message;

  @override
  String toString() {
    return 'CreateReferralResponse(success: $success, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReferralResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, message);

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
      {required final bool success,
      required final CreateReferralData data,
      final String? message}) = _$CreateReferralResponseImpl;

  factory _CreateReferralResponse.fromJson(Map<String, dynamic> json) =
      _$CreateReferralResponseImpl.fromJson;

  @override
  bool get success;
  @override
  CreateReferralData get data;
  @override
  String? get message;

  /// Create a copy of CreateReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateReferralResponseImplCopyWith<_$CreateReferralResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

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

GetReferralInfoResponse _$GetReferralInfoResponseFromJson(
    Map<String, dynamic> json) {
  return _GetReferralInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$GetReferralInfoResponse {
  bool get success => throw _privateConstructorUsedError;
  GetReferralInfoData get data => throw _privateConstructorUsedError;
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
  $Res call({bool success, GetReferralInfoData data, String? message});

  $GetReferralInfoDataCopyWith<$Res> get data;
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
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetReferralInfoData,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of GetReferralInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetReferralInfoDataCopyWith<$Res> get data {
    return $GetReferralInfoDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
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
  $Res call({bool success, GetReferralInfoData data, String? message});

  @override
  $GetReferralInfoDataCopyWith<$Res> get data;
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
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(_$GetReferralInfoResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetReferralInfoData,
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
      {required this.success, required this.data, this.message});

  factory _$GetReferralInfoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetReferralInfoResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final GetReferralInfoData data;
  @override
  final String? message;

  @override
  String toString() {
    return 'GetReferralInfoResponse(success: $success, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetReferralInfoResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, message);

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
      {required final bool success,
      required final GetReferralInfoData data,
      final String? message}) = _$GetReferralInfoResponseImpl;

  factory _GetReferralInfoResponse.fromJson(Map<String, dynamic> json) =
      _$GetReferralInfoResponseImpl.fromJson;

  @override
  bool get success;
  @override
  GetReferralInfoData get data;
  @override
  String? get message;

  /// Create a copy of GetReferralInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetReferralInfoResponseImplCopyWith<_$GetReferralInfoResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetReferralInfoData _$GetReferralInfoDataFromJson(Map<String, dynamic> json) {
  return _GetReferralInfoData.fromJson(json);
}

/// @nodoc
mixin _$GetReferralInfoData {
  int get totalReferrals => throw _privateConstructorUsedError;
  double get totalRewards => throw _privateConstructorUsedError;
  String get referralCode => throw _privateConstructorUsedError;
  List<dynamic> get referrals => throw _privateConstructorUsedError;

  /// Serializes this GetReferralInfoData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetReferralInfoData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetReferralInfoDataCopyWith<GetReferralInfoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetReferralInfoDataCopyWith<$Res> {
  factory $GetReferralInfoDataCopyWith(
          GetReferralInfoData value, $Res Function(GetReferralInfoData) then) =
      _$GetReferralInfoDataCopyWithImpl<$Res, GetReferralInfoData>;
  @useResult
  $Res call(
      {int totalReferrals,
      double totalRewards,
      String referralCode,
      List<dynamic> referrals});
}

/// @nodoc
class _$GetReferralInfoDataCopyWithImpl<$Res, $Val extends GetReferralInfoData>
    implements $GetReferralInfoDataCopyWith<$Res> {
  _$GetReferralInfoDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetReferralInfoData
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
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetReferralInfoDataImplCopyWith<$Res>
    implements $GetReferralInfoDataCopyWith<$Res> {
  factory _$$GetReferralInfoDataImplCopyWith(_$GetReferralInfoDataImpl value,
          $Res Function(_$GetReferralInfoDataImpl) then) =
      __$$GetReferralInfoDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalReferrals,
      double totalRewards,
      String referralCode,
      List<dynamic> referrals});
}

/// @nodoc
class __$$GetReferralInfoDataImplCopyWithImpl<$Res>
    extends _$GetReferralInfoDataCopyWithImpl<$Res, _$GetReferralInfoDataImpl>
    implements _$$GetReferralInfoDataImplCopyWith<$Res> {
  __$$GetReferralInfoDataImplCopyWithImpl(_$GetReferralInfoDataImpl _value,
      $Res Function(_$GetReferralInfoDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetReferralInfoData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReferrals = null,
    Object? totalRewards = null,
    Object? referralCode = null,
    Object? referrals = null,
  }) {
    return _then(_$GetReferralInfoDataImpl(
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
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetReferralInfoDataImpl implements _GetReferralInfoData {
  const _$GetReferralInfoDataImpl(
      {required this.totalReferrals,
      required this.totalRewards,
      required this.referralCode,
      required final List<dynamic> referrals})
      : _referrals = referrals;

  factory _$GetReferralInfoDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetReferralInfoDataImplFromJson(json);

  @override
  final int totalReferrals;
  @override
  final double totalRewards;
  @override
  final String referralCode;
  final List<dynamic> _referrals;
  @override
  List<dynamic> get referrals {
    if (_referrals is EqualUnmodifiableListView) return _referrals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_referrals);
  }

  @override
  String toString() {
    return 'GetReferralInfoData(totalReferrals: $totalReferrals, totalRewards: $totalRewards, referralCode: $referralCode, referrals: $referrals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetReferralInfoDataImpl &&
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

  /// Create a copy of GetReferralInfoData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetReferralInfoDataImplCopyWith<_$GetReferralInfoDataImpl> get copyWith =>
      __$$GetReferralInfoDataImplCopyWithImpl<_$GetReferralInfoDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetReferralInfoDataImplToJson(
      this,
    );
  }
}

abstract class _GetReferralInfoData implements GetReferralInfoData {
  const factory _GetReferralInfoData(
      {required final int totalReferrals,
      required final double totalRewards,
      required final String referralCode,
      required final List<dynamic> referrals}) = _$GetReferralInfoDataImpl;

  factory _GetReferralInfoData.fromJson(Map<String, dynamic> json) =
      _$GetReferralInfoDataImpl.fromJson;

  @override
  int get totalReferrals;
  @override
  double get totalRewards;
  @override
  String get referralCode;
  @override
  List<dynamic> get referrals;

  /// Create a copy of GetReferralInfoData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetReferralInfoDataImplCopyWith<_$GetReferralInfoDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
