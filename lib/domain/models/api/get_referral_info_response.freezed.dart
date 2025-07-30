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
