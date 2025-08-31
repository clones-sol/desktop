// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'factory_upload_limit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FactoryUploadLimit _$FactoryUploadLimitFromJson(Map<String, dynamic> json) {
  return _FactoryUploadLimit.fromJson(json);
}

/// @nodoc
mixin _$FactoryUploadLimit {
  int get value => throw _privateConstructorUsedError;
  UploadLimitType get type => throw _privateConstructorUsedError;

  /// Serializes this FactoryUploadLimit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FactoryUploadLimit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FactoryUploadLimitCopyWith<FactoryUploadLimit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactoryUploadLimitCopyWith<$Res> {
  factory $FactoryUploadLimitCopyWith(
          FactoryUploadLimit value, $Res Function(FactoryUploadLimit) then) =
      _$FactoryUploadLimitCopyWithImpl<$Res, FactoryUploadLimit>;
  @useResult
  $Res call({int value, UploadLimitType type});
}

/// @nodoc
class _$FactoryUploadLimitCopyWithImpl<$Res, $Val extends FactoryUploadLimit>
    implements $FactoryUploadLimitCopyWith<$Res> {
  _$FactoryUploadLimitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FactoryUploadLimit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UploadLimitType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FactoryUploadLimitImplCopyWith<$Res>
    implements $FactoryUploadLimitCopyWith<$Res> {
  factory _$$FactoryUploadLimitImplCopyWith(_$FactoryUploadLimitImpl value,
          $Res Function(_$FactoryUploadLimitImpl) then) =
      __$$FactoryUploadLimitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value, UploadLimitType type});
}

/// @nodoc
class __$$FactoryUploadLimitImplCopyWithImpl<$Res>
    extends _$FactoryUploadLimitCopyWithImpl<$Res, _$FactoryUploadLimitImpl>
    implements _$$FactoryUploadLimitImplCopyWith<$Res> {
  __$$FactoryUploadLimitImplCopyWithImpl(_$FactoryUploadLimitImpl _value,
      $Res Function(_$FactoryUploadLimitImpl) _then)
      : super(_value, _then);

  /// Create a copy of FactoryUploadLimit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? type = null,
  }) {
    return _then(_$FactoryUploadLimitImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UploadLimitType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FactoryUploadLimitImpl implements _FactoryUploadLimit {
  const _$FactoryUploadLimitImpl({required this.value, required this.type});

  factory _$FactoryUploadLimitImpl.fromJson(Map<String, dynamic> json) =>
      _$$FactoryUploadLimitImplFromJson(json);

  @override
  final int value;
  @override
  final UploadLimitType type;

  @override
  String toString() {
    return 'FactoryUploadLimit(value: $value, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FactoryUploadLimitImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, type);

  /// Create a copy of FactoryUploadLimit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FactoryUploadLimitImplCopyWith<_$FactoryUploadLimitImpl> get copyWith =>
      __$$FactoryUploadLimitImplCopyWithImpl<_$FactoryUploadLimitImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FactoryUploadLimitImplToJson(
      this,
    );
  }
}

abstract class _FactoryUploadLimit implements FactoryUploadLimit {
  const factory _FactoryUploadLimit(
      {required final int value,
      required final UploadLimitType type}) = _$FactoryUploadLimitImpl;

  factory _FactoryUploadLimit.fromJson(Map<String, dynamic> json) =
      _$FactoryUploadLimitImpl.fromJson;

  @override
  int get value;
  @override
  UploadLimitType get type;

  /// Create a copy of FactoryUploadLimit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FactoryUploadLimitImplCopyWith<_$FactoryUploadLimitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
