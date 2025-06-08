// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monitor_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MonitorInfo _$MonitorInfoFromJson(Map<String, dynamic> json) {
  return _MonitorInfo.fromJson(json);
}

/// @nodoc
mixin _$MonitorInfo {
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;

  /// Serializes this MonitorInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonitorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonitorInfoCopyWith<MonitorInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitorInfoCopyWith<$Res> {
  factory $MonitorInfoCopyWith(
          MonitorInfo value, $Res Function(MonitorInfo) then) =
      _$MonitorInfoCopyWithImpl<$Res, MonitorInfo>;
  @useResult
  $Res call({int width, int height});
}

/// @nodoc
class _$MonitorInfoCopyWithImpl<$Res, $Val extends MonitorInfo>
    implements $MonitorInfoCopyWith<$Res> {
  _$MonitorInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonitorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_value.copyWith(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonitorInfoImplCopyWith<$Res>
    implements $MonitorInfoCopyWith<$Res> {
  factory _$$MonitorInfoImplCopyWith(
          _$MonitorInfoImpl value, $Res Function(_$MonitorInfoImpl) then) =
      __$$MonitorInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int width, int height});
}

/// @nodoc
class __$$MonitorInfoImplCopyWithImpl<$Res>
    extends _$MonitorInfoCopyWithImpl<$Res, _$MonitorInfoImpl>
    implements _$$MonitorInfoImplCopyWith<$Res> {
  __$$MonitorInfoImplCopyWithImpl(
      _$MonitorInfoImpl _value, $Res Function(_$MonitorInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonitorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_$MonitorInfoImpl(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonitorInfoImpl implements _MonitorInfo {
  const _$MonitorInfoImpl({required this.width, required this.height});

  factory _$MonitorInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonitorInfoImplFromJson(json);

  @override
  final int width;
  @override
  final int height;

  @override
  String toString() {
    return 'MonitorInfo(width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonitorInfoImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, width, height);

  /// Create a copy of MonitorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonitorInfoImplCopyWith<_$MonitorInfoImpl> get copyWith =>
      __$$MonitorInfoImplCopyWithImpl<_$MonitorInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonitorInfoImplToJson(
      this,
    );
  }
}

abstract class _MonitorInfo implements MonitorInfo {
  const factory _MonitorInfo(
      {required final int width,
      required final int height}) = _$MonitorInfoImpl;

  factory _MonitorInfo.fromJson(Map<String, dynamic> json) =
      _$MonitorInfoImpl.fromJson;

  @override
  int get width;
  @override
  int get height;

  /// Create a copy of MonitorInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonitorInfoImplCopyWith<_$MonitorInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
