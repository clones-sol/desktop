// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'factory_generate_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FactoryGenerateResponse _$FactoryGenerateResponseFromJson(
    Map<String, dynamic> json) {
  return _FactoryGenerateResponse.fromJson(json);
}

/// @nodoc
mixin _$FactoryGenerateResponse {
  FactoryGenerateResponseContent get content =>
      throw _privateConstructorUsedError;

  /// Serializes this FactoryGenerateResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FactoryGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FactoryGenerateResponseCopyWith<FactoryGenerateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactoryGenerateResponseCopyWith<$Res> {
  factory $FactoryGenerateResponseCopyWith(FactoryGenerateResponse value,
          $Res Function(FactoryGenerateResponse) then) =
      _$FactoryGenerateResponseCopyWithImpl<$Res, FactoryGenerateResponse>;
  @useResult
  $Res call({FactoryGenerateResponseContent content});

  $FactoryGenerateResponseContentCopyWith<$Res> get content;
}

/// @nodoc
class _$FactoryGenerateResponseCopyWithImpl<$Res,
        $Val extends FactoryGenerateResponse>
    implements $FactoryGenerateResponseCopyWith<$Res> {
  _$FactoryGenerateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FactoryGenerateResponse
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
              as FactoryGenerateResponseContent,
    ) as $Val);
  }

  /// Create a copy of FactoryGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FactoryGenerateResponseContentCopyWith<$Res> get content {
    return $FactoryGenerateResponseContentCopyWith<$Res>(_value.content,
        (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FactoryGenerateResponseImplCopyWith<$Res>
    implements $FactoryGenerateResponseCopyWith<$Res> {
  factory _$$FactoryGenerateResponseImplCopyWith(
          _$FactoryGenerateResponseImpl value,
          $Res Function(_$FactoryGenerateResponseImpl) then) =
      __$$FactoryGenerateResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FactoryGenerateResponseContent content});

  @override
  $FactoryGenerateResponseContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$FactoryGenerateResponseImplCopyWithImpl<$Res>
    extends _$FactoryGenerateResponseCopyWithImpl<$Res,
        _$FactoryGenerateResponseImpl>
    implements _$$FactoryGenerateResponseImplCopyWith<$Res> {
  __$$FactoryGenerateResponseImplCopyWithImpl(
      _$FactoryGenerateResponseImpl _value,
      $Res Function(_$FactoryGenerateResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FactoryGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$FactoryGenerateResponseImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as FactoryGenerateResponseContent,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FactoryGenerateResponseImpl implements _FactoryGenerateResponse {
  const _$FactoryGenerateResponseImpl({required this.content});

  factory _$FactoryGenerateResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FactoryGenerateResponseImplFromJson(json);

  @override
  final FactoryGenerateResponseContent content;

  @override
  String toString() {
    return 'FactoryGenerateResponse(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FactoryGenerateResponseImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content);

  /// Create a copy of FactoryGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FactoryGenerateResponseImplCopyWith<_$FactoryGenerateResponseImpl>
      get copyWith => __$$FactoryGenerateResponseImplCopyWithImpl<
          _$FactoryGenerateResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FactoryGenerateResponseImplToJson(
      this,
    );
  }
}

abstract class _FactoryGenerateResponse implements FactoryGenerateResponse {
  const factory _FactoryGenerateResponse(
          {required final FactoryGenerateResponseContent content}) =
      _$FactoryGenerateResponseImpl;

  factory _FactoryGenerateResponse.fromJson(Map<String, dynamic> json) =
      _$FactoryGenerateResponseImpl.fromJson;

  @override
  FactoryGenerateResponseContent get content;

  /// Create a copy of FactoryGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FactoryGenerateResponseImplCopyWith<_$FactoryGenerateResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FactoryGenerateResponseContent _$FactoryGenerateResponseContentFromJson(
    Map<String, dynamic> json) {
  return _FactoryGenerateResponseContent.fromJson(json);
}

/// @nodoc
mixin _$FactoryGenerateResponseContent {
  String get name => throw _privateConstructorUsedError;
  List<ForgeApp> get apps => throw _privateConstructorUsedError;

  /// Serializes this FactoryGenerateResponseContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FactoryGenerateResponseContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FactoryGenerateResponseContentCopyWith<FactoryGenerateResponseContent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactoryGenerateResponseContentCopyWith<$Res> {
  factory $FactoryGenerateResponseContentCopyWith(
          FactoryGenerateResponseContent value,
          $Res Function(FactoryGenerateResponseContent) then) =
      _$FactoryGenerateResponseContentCopyWithImpl<$Res,
          FactoryGenerateResponseContent>;
  @useResult
  $Res call({String name, List<ForgeApp> apps});
}

/// @nodoc
class _$FactoryGenerateResponseContentCopyWithImpl<$Res,
        $Val extends FactoryGenerateResponseContent>
    implements $FactoryGenerateResponseContentCopyWith<$Res> {
  _$FactoryGenerateResponseContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FactoryGenerateResponseContent
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
abstract class _$$FactoryGenerateResponseContentImplCopyWith<$Res>
    implements $FactoryGenerateResponseContentCopyWith<$Res> {
  factory _$$FactoryGenerateResponseContentImplCopyWith(
          _$FactoryGenerateResponseContentImpl value,
          $Res Function(_$FactoryGenerateResponseContentImpl) then) =
      __$$FactoryGenerateResponseContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<ForgeApp> apps});
}

/// @nodoc
class __$$FactoryGenerateResponseContentImplCopyWithImpl<$Res>
    extends _$FactoryGenerateResponseContentCopyWithImpl<$Res,
        _$FactoryGenerateResponseContentImpl>
    implements _$$FactoryGenerateResponseContentImplCopyWith<$Res> {
  __$$FactoryGenerateResponseContentImplCopyWithImpl(
      _$FactoryGenerateResponseContentImpl _value,
      $Res Function(_$FactoryGenerateResponseContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of FactoryGenerateResponseContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? apps = null,
  }) {
    return _then(_$FactoryGenerateResponseContentImpl(
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
class _$FactoryGenerateResponseContentImpl
    implements _FactoryGenerateResponseContent {
  const _$FactoryGenerateResponseContentImpl(
      {required this.name, required final List<ForgeApp> apps})
      : _apps = apps;

  factory _$FactoryGenerateResponseContentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FactoryGenerateResponseContentImplFromJson(json);

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
    return 'FactoryGenerateResponseContent(name: $name, apps: $apps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FactoryGenerateResponseContentImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._apps, _apps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_apps));

  /// Create a copy of FactoryGenerateResponseContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FactoryGenerateResponseContentImplCopyWith<
          _$FactoryGenerateResponseContentImpl>
      get copyWith => __$$FactoryGenerateResponseContentImplCopyWithImpl<
          _$FactoryGenerateResponseContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FactoryGenerateResponseContentImplToJson(
      this,
    );
  }
}

abstract class _FactoryGenerateResponseContent
    implements FactoryGenerateResponseContent {
  const factory _FactoryGenerateResponseContent(
          {required final String name, required final List<ForgeApp> apps}) =
      _$FactoryGenerateResponseContentImpl;

  factory _FactoryGenerateResponseContent.fromJson(Map<String, dynamic> json) =
      _$FactoryGenerateResponseContentImpl.fromJson;

  @override
  String get name;
  @override
  List<ForgeApp> get apps;

  /// Create a copy of FactoryGenerateResponseContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FactoryGenerateResponseContentImplCopyWith<
          _$FactoryGenerateResponseContentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
