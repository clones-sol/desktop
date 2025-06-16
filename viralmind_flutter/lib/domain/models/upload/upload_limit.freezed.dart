// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_limit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadLimit _$UploadLimitFromJson(Map<String, dynamic> json) {
  return _UploadLimit.fromJson(json);
}

/// @nodoc
mixin _$UploadLimit {
  int get type => throw _privateConstructorUsedError;
  UploadLimitType get limitType => throw _privateConstructorUsedError;

  /// Serializes this UploadLimit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadLimit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadLimitCopyWith<UploadLimit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadLimitCopyWith<$Res> {
  factory $UploadLimitCopyWith(
          UploadLimit value, $Res Function(UploadLimit) then) =
      _$UploadLimitCopyWithImpl<$Res, UploadLimit>;
  @useResult
  $Res call({int type, UploadLimitType limitType});
}

/// @nodoc
class _$UploadLimitCopyWithImpl<$Res, $Val extends UploadLimit>
    implements $UploadLimitCopyWith<$Res> {
  _$UploadLimitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadLimit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? limitType = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      limitType: null == limitType
          ? _value.limitType
          : limitType // ignore: cast_nullable_to_non_nullable
              as UploadLimitType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadLimitImplCopyWith<$Res>
    implements $UploadLimitCopyWith<$Res> {
  factory _$$UploadLimitImplCopyWith(
          _$UploadLimitImpl value, $Res Function(_$UploadLimitImpl) then) =
      __$$UploadLimitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int type, UploadLimitType limitType});
}

/// @nodoc
class __$$UploadLimitImplCopyWithImpl<$Res>
    extends _$UploadLimitCopyWithImpl<$Res, _$UploadLimitImpl>
    implements _$$UploadLimitImplCopyWith<$Res> {
  __$$UploadLimitImplCopyWithImpl(
      _$UploadLimitImpl _value, $Res Function(_$UploadLimitImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadLimit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? limitType = null,
  }) {
    return _then(_$UploadLimitImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      limitType: null == limitType
          ? _value.limitType
          : limitType // ignore: cast_nullable_to_non_nullable
              as UploadLimitType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadLimitImpl implements _UploadLimit {
  const _$UploadLimitImpl({required this.type, required this.limitType});

  factory _$UploadLimitImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadLimitImplFromJson(json);

  @override
  final int type;
  @override
  final UploadLimitType limitType;

  @override
  String toString() {
    return 'UploadLimit(type: $type, limitType: $limitType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadLimitImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.limitType, limitType) ||
                other.limitType == limitType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, limitType);

  /// Create a copy of UploadLimit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadLimitImplCopyWith<_$UploadLimitImpl> get copyWith =>
      __$$UploadLimitImplCopyWithImpl<_$UploadLimitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadLimitImplToJson(
      this,
    );
  }
}

abstract class _UploadLimit implements UploadLimit {
  const factory _UploadLimit(
      {required final int type,
      required final UploadLimitType limitType}) = _$UploadLimitImpl;

  factory _UploadLimit.fromJson(Map<String, dynamic> json) =
      _$UploadLimitImpl.fromJson;

  @override
  int get type;
  @override
  UploadLimitType get limitType;

  /// Create a copy of UploadLimit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadLimitImplCopyWith<_$UploadLimitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
