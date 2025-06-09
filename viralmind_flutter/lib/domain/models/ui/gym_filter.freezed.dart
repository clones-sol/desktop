// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gym_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GymFilter _$GymFilterFromJson(Map<String, dynamic> json) {
  return _GymFilter.fromJson(json);
}

/// @nodoc
mixin _$GymFilter {
  String get poolId => throw _privateConstructorUsedError;

  /// Serializes this GymFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GymFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GymFilterCopyWith<GymFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GymFilterCopyWith<$Res> {
  factory $GymFilterCopyWith(GymFilter value, $Res Function(GymFilter) then) =
      _$GymFilterCopyWithImpl<$Res, GymFilter>;
  @useResult
  $Res call({String poolId});
}

/// @nodoc
class _$GymFilterCopyWithImpl<$Res, $Val extends GymFilter>
    implements $GymFilterCopyWith<$Res> {
  _$GymFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GymFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poolId = null,
  }) {
    return _then(_value.copyWith(
      poolId: null == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GymFilterImplCopyWith<$Res>
    implements $GymFilterCopyWith<$Res> {
  factory _$$GymFilterImplCopyWith(
          _$GymFilterImpl value, $Res Function(_$GymFilterImpl) then) =
      __$$GymFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String poolId});
}

/// @nodoc
class __$$GymFilterImplCopyWithImpl<$Res>
    extends _$GymFilterCopyWithImpl<$Res, _$GymFilterImpl>
    implements _$$GymFilterImplCopyWith<$Res> {
  __$$GymFilterImplCopyWithImpl(
      _$GymFilterImpl _value, $Res Function(_$GymFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of GymFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poolId = null,
  }) {
    return _then(_$GymFilterImpl(
      poolId: null == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GymFilterImpl implements _GymFilter {
  const _$GymFilterImpl({required this.poolId});

  factory _$GymFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$GymFilterImplFromJson(json);

  @override
  final String poolId;

  @override
  String toString() {
    return 'GymFilter(poolId: $poolId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GymFilterImpl &&
            (identical(other.poolId, poolId) || other.poolId == poolId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, poolId);

  /// Create a copy of GymFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GymFilterImplCopyWith<_$GymFilterImpl> get copyWith =>
      __$$GymFilterImplCopyWithImpl<_$GymFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GymFilterImplToJson(
      this,
    );
  }
}

abstract class _GymFilter implements GymFilter {
  const factory _GymFilter({required final String poolId}) = _$GymFilterImpl;

  factory _GymFilter.fromJson(Map<String, dynamic> json) =
      _$GymFilterImpl.fromJson;

  @override
  String get poolId;

  /// Create a copy of GymFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GymFilterImplCopyWith<_$GymFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
