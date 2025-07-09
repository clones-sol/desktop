// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestOptions _$RequestOptionsFromJson(Map<String, dynamic> json) {
  return _RequestOptions.fromJson(json);
}

/// @nodoc
mixin _$RequestOptions {
  bool get requiresAuth => throw _privateConstructorUsedError;
  Map<String, String>? get headers => throw _privateConstructorUsedError;

  /// Serializes this RequestOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestOptionsCopyWith<RequestOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOptionsCopyWith<$Res> {
  factory $RequestOptionsCopyWith(
          RequestOptions value, $Res Function(RequestOptions) then) =
      _$RequestOptionsCopyWithImpl<$Res, RequestOptions>;
  @useResult
  $Res call({bool requiresAuth, Map<String, String>? headers});
}

/// @nodoc
class _$RequestOptionsCopyWithImpl<$Res, $Val extends RequestOptions>
    implements $RequestOptionsCopyWith<$Res> {
  _$RequestOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requiresAuth = null,
    Object? headers = freezed,
  }) {
    return _then(_value.copyWith(
      requiresAuth: null == requiresAuth
          ? _value.requiresAuth
          : requiresAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      headers: freezed == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestOptionsImplCopyWith<$Res>
    implements $RequestOptionsCopyWith<$Res> {
  factory _$$RequestOptionsImplCopyWith(_$RequestOptionsImpl value,
          $Res Function(_$RequestOptionsImpl) then) =
      __$$RequestOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool requiresAuth, Map<String, String>? headers});
}

/// @nodoc
class __$$RequestOptionsImplCopyWithImpl<$Res>
    extends _$RequestOptionsCopyWithImpl<$Res, _$RequestOptionsImpl>
    implements _$$RequestOptionsImplCopyWith<$Res> {
  __$$RequestOptionsImplCopyWithImpl(
      _$RequestOptionsImpl _value, $Res Function(_$RequestOptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requiresAuth = null,
    Object? headers = freezed,
  }) {
    return _then(_$RequestOptionsImpl(
      requiresAuth: null == requiresAuth
          ? _value.requiresAuth
          : requiresAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      headers: freezed == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOptionsImpl implements _RequestOptions {
  const _$RequestOptionsImpl(
      {this.requiresAuth = false, final Map<String, String>? headers})
      : _headers = headers;

  factory _$RequestOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOptionsImplFromJson(json);

  @override
  @JsonKey()
  final bool requiresAuth;
  final Map<String, String>? _headers;
  @override
  Map<String, String>? get headers {
    final value = _headers;
    if (value == null) return null;
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'RequestOptions(requiresAuth: $requiresAuth, headers: $headers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOptionsImpl &&
            (identical(other.requiresAuth, requiresAuth) ||
                other.requiresAuth == requiresAuth) &&
            const DeepCollectionEquality().equals(other._headers, _headers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, requiresAuth, const DeepCollectionEquality().hash(_headers));

  /// Create a copy of RequestOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOptionsImplCopyWith<_$RequestOptionsImpl> get copyWith =>
      __$$RequestOptionsImplCopyWithImpl<_$RequestOptionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOptionsImplToJson(
      this,
    );
  }
}

abstract class _RequestOptions implements RequestOptions {
  const factory _RequestOptions(
      {final bool requiresAuth,
      final Map<String, String>? headers}) = _$RequestOptionsImpl;

  factory _RequestOptions.fromJson(Map<String, dynamic> json) =
      _$RequestOptionsImpl.fromJson;

  @override
  bool get requiresAuth;
  @override
  Map<String, String>? get headers;

  /// Create a copy of RequestOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestOptionsImplCopyWith<_$RequestOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
