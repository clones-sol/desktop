// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_error_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiErrorDetail _$ApiErrorDetailFromJson(Map<String, dynamic> json) {
  return _ApiErrorDetail.fromJson(json);
}

/// @nodoc
mixin _$ApiErrorDetail {
  ErrorCode get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, dynamic>? get details => throw _privateConstructorUsedError;

  /// Serializes this ApiErrorDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiErrorDetailCopyWith<ApiErrorDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorDetailCopyWith<$Res> {
  factory $ApiErrorDetailCopyWith(
          ApiErrorDetail value, $Res Function(ApiErrorDetail) then) =
      _$ApiErrorDetailCopyWithImpl<$Res, ApiErrorDetail>;
  @useResult
  $Res call({ErrorCode code, String message, Map<String, dynamic>? details});
}

/// @nodoc
class _$ApiErrorDetailCopyWithImpl<$Res, $Val extends ApiErrorDetail>
    implements $ApiErrorDetailCopyWith<$Res> {
  _$ApiErrorDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as ErrorCode,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiErrorDetailImplCopyWith<$Res>
    implements $ApiErrorDetailCopyWith<$Res> {
  factory _$$ApiErrorDetailImplCopyWith(_$ApiErrorDetailImpl value,
          $Res Function(_$ApiErrorDetailImpl) then) =
      __$$ApiErrorDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ErrorCode code, String message, Map<String, dynamic>? details});
}

/// @nodoc
class __$$ApiErrorDetailImplCopyWithImpl<$Res>
    extends _$ApiErrorDetailCopyWithImpl<$Res, _$ApiErrorDetailImpl>
    implements _$$ApiErrorDetailImplCopyWith<$Res> {
  __$$ApiErrorDetailImplCopyWithImpl(
      _$ApiErrorDetailImpl _value, $Res Function(_$ApiErrorDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(_$ApiErrorDetailImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as ErrorCode,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiErrorDetailImpl implements _ApiErrorDetail {
  const _$ApiErrorDetailImpl(
      {required this.code,
      required this.message,
      final Map<String, dynamic>? details})
      : _details = details;

  factory _$ApiErrorDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiErrorDetailImplFromJson(json);

  @override
  final ErrorCode code;
  @override
  final String message;
  final Map<String, dynamic>? _details;
  @override
  Map<String, dynamic>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ApiErrorDetail(code: $code, message: $message, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorDetailImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message,
      const DeepCollectionEquality().hash(_details));

  /// Create a copy of ApiErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorDetailImplCopyWith<_$ApiErrorDetailImpl> get copyWith =>
      __$$ApiErrorDetailImplCopyWithImpl<_$ApiErrorDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiErrorDetailImplToJson(
      this,
    );
  }
}

abstract class _ApiErrorDetail implements ApiErrorDetail {
  const factory _ApiErrorDetail(
      {required final ErrorCode code,
      required final String message,
      final Map<String, dynamic>? details}) = _$ApiErrorDetailImpl;

  factory _ApiErrorDetail.fromJson(Map<String, dynamic> json) =
      _$ApiErrorDetailImpl.fromJson;

  @override
  ErrorCode get code;
  @override
  String get message;
  @override
  Map<String, dynamic>? get details;

  /// Create a copy of ApiErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiErrorDetailImplCopyWith<_$ApiErrorDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
