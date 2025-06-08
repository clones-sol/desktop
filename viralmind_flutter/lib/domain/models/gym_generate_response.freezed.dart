// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gym_generate_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GymGenerateResponse _$GymGenerateResponseFromJson(Map<String, dynamic> json) {
  return _GymGenerateResponse.fromJson(json);
}

/// @nodoc
mixin _$GymGenerateResponse {
  GymGenerateResponseContent get content => throw _privateConstructorUsedError;

  /// Serializes this GymGenerateResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GymGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GymGenerateResponseCopyWith<GymGenerateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GymGenerateResponseCopyWith<$Res> {
  factory $GymGenerateResponseCopyWith(
          GymGenerateResponse value, $Res Function(GymGenerateResponse) then) =
      _$GymGenerateResponseCopyWithImpl<$Res, GymGenerateResponse>;
  @useResult
  $Res call({GymGenerateResponseContent content});

  $GymGenerateResponseContentCopyWith<$Res> get content;
}

/// @nodoc
class _$GymGenerateResponseCopyWithImpl<$Res, $Val extends GymGenerateResponse>
    implements $GymGenerateResponseCopyWith<$Res> {
  _$GymGenerateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GymGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as GymGenerateResponseContent,
    ) as $Val);
  }

  /// Create a copy of GymGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GymGenerateResponseContentCopyWith<$Res> get content {
    return $GymGenerateResponseContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GymGenerateResponseImplCopyWith<$Res>
    implements $GymGenerateResponseCopyWith<$Res> {
  factory _$$GymGenerateResponseImplCopyWith(_$GymGenerateResponseImpl value,
          $Res Function(_$GymGenerateResponseImpl) then) =
      __$$GymGenerateResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GymGenerateResponseContent content});

  @override
  $GymGenerateResponseContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$GymGenerateResponseImplCopyWithImpl<$Res>
    extends _$GymGenerateResponseCopyWithImpl<$Res, _$GymGenerateResponseImpl>
    implements _$$GymGenerateResponseImplCopyWith<$Res> {
  __$$GymGenerateResponseImplCopyWithImpl(_$GymGenerateResponseImpl _value,
      $Res Function(_$GymGenerateResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GymGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$GymGenerateResponseImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as GymGenerateResponseContent,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GymGenerateResponseImpl implements _GymGenerateResponse {
  const _$GymGenerateResponseImpl({required this.content});

  factory _$GymGenerateResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GymGenerateResponseImplFromJson(json);

  @override
  final GymGenerateResponseContent content;

  @override
  String toString() {
    return 'GymGenerateResponse(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GymGenerateResponseImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content);

  /// Create a copy of GymGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GymGenerateResponseImplCopyWith<_$GymGenerateResponseImpl> get copyWith =>
      __$$GymGenerateResponseImplCopyWithImpl<_$GymGenerateResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GymGenerateResponseImplToJson(
      this,
    );
  }
}

abstract class _GymGenerateResponse implements GymGenerateResponse {
  const factory _GymGenerateResponse(
          {required final GymGenerateResponseContent content}) =
      _$GymGenerateResponseImpl;

  factory _GymGenerateResponse.fromJson(Map<String, dynamic> json) =
      _$GymGenerateResponseImpl.fromJson;

  @override
  GymGenerateResponseContent get content;

  /// Create a copy of GymGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GymGenerateResponseImplCopyWith<_$GymGenerateResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GymGenerateResponseContent _$GymGenerateResponseContentFromJson(
    Map<String, dynamic> json) {
  return _GymGenerateResponseContent.fromJson(json);
}

/// @nodoc
mixin _$GymGenerateResponseContent {
  String get name => throw _privateConstructorUsedError;
  List<ForgeApp> get apps => throw _privateConstructorUsedError;

  /// Serializes this GymGenerateResponseContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GymGenerateResponseContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GymGenerateResponseContentCopyWith<GymGenerateResponseContent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GymGenerateResponseContentCopyWith<$Res> {
  factory $GymGenerateResponseContentCopyWith(GymGenerateResponseContent value,
          $Res Function(GymGenerateResponseContent) then) =
      _$GymGenerateResponseContentCopyWithImpl<$Res,
          GymGenerateResponseContent>;
  @useResult
  $Res call({String name, List<ForgeApp> apps});
}

/// @nodoc
class _$GymGenerateResponseContentCopyWithImpl<$Res,
        $Val extends GymGenerateResponseContent>
    implements $GymGenerateResponseContentCopyWith<$Res> {
  _$GymGenerateResponseContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GymGenerateResponseContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? apps = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      apps: null == apps
          ? _value.apps
          : apps // ignore: cast_nullable_to_non_nullable
              as List<ForgeApp>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GymGenerateResponseContentImplCopyWith<$Res>
    implements $GymGenerateResponseContentCopyWith<$Res> {
  factory _$$GymGenerateResponseContentImplCopyWith(
          _$GymGenerateResponseContentImpl value,
          $Res Function(_$GymGenerateResponseContentImpl) then) =
      __$$GymGenerateResponseContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<ForgeApp> apps});
}

/// @nodoc
class __$$GymGenerateResponseContentImplCopyWithImpl<$Res>
    extends _$GymGenerateResponseContentCopyWithImpl<$Res,
        _$GymGenerateResponseContentImpl>
    implements _$$GymGenerateResponseContentImplCopyWith<$Res> {
  __$$GymGenerateResponseContentImplCopyWithImpl(
      _$GymGenerateResponseContentImpl _value,
      $Res Function(_$GymGenerateResponseContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of GymGenerateResponseContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? apps = null,
  }) {
    return _then(_$GymGenerateResponseContentImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      apps: null == apps
          ? _value._apps
          : apps // ignore: cast_nullable_to_non_nullable
              as List<ForgeApp>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GymGenerateResponseContentImpl implements _GymGenerateResponseContent {
  const _$GymGenerateResponseContentImpl(
      {required this.name, required final List<ForgeApp> apps})
      : _apps = apps;

  factory _$GymGenerateResponseContentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GymGenerateResponseContentImplFromJson(json);

  @override
  final String name;
  final List<ForgeApp> _apps;
  @override
  List<ForgeApp> get apps {
    if (_apps is EqualUnmodifiableListView) return _apps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_apps);
  }

  @override
  String toString() {
    return 'GymGenerateResponseContent(name: $name, apps: $apps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GymGenerateResponseContentImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._apps, _apps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_apps));

  /// Create a copy of GymGenerateResponseContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GymGenerateResponseContentImplCopyWith<_$GymGenerateResponseContentImpl>
      get copyWith => __$$GymGenerateResponseContentImplCopyWithImpl<
          _$GymGenerateResponseContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GymGenerateResponseContentImplToJson(
      this,
    );
  }
}

abstract class _GymGenerateResponseContent
    implements GymGenerateResponseContent {
  const factory _GymGenerateResponseContent(
      {required final String name,
      required final List<ForgeApp> apps}) = _$GymGenerateResponseContentImpl;

  factory _GymGenerateResponseContent.fromJson(Map<String, dynamic> json) =
      _$GymGenerateResponseContentImpl.fromJson;

  @override
  String get name;
  @override
  List<ForgeApp> get apps;

  /// Create a copy of GymGenerateResponseContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GymGenerateResponseContentImplCopyWith<_$GymGenerateResponseContentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
