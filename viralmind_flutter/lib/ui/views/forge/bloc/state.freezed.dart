// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgeState {
  TrainingPool? get pool => throw _privateConstructorUsedError;

  /// Create a copy of ForgeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgeStateCopyWith<ForgeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgeStateCopyWith<$Res> {
  factory $ForgeStateCopyWith(
          ForgeState value, $Res Function(ForgeState) then) =
      _$ForgeStateCopyWithImpl<$Res, ForgeState>;
  @useResult
  $Res call({TrainingPool? pool});

  $TrainingPoolCopyWith<$Res>? get pool;
}

/// @nodoc
class _$ForgeStateCopyWithImpl<$Res, $Val extends ForgeState>
    implements $ForgeStateCopyWith<$Res> {
  _$ForgeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pool = freezed,
  }) {
    return _then(_value.copyWith(
      pool: freezed == pool
          ? _value.pool
          : pool // ignore: cast_nullable_to_non_nullable
              as TrainingPool?,
    ) as $Val);
  }

  /// Create a copy of ForgeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrainingPoolCopyWith<$Res>? get pool {
    if (_value.pool == null) {
      return null;
    }

    return $TrainingPoolCopyWith<$Res>(_value.pool!, (value) {
      return _then(_value.copyWith(pool: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForgeStateImplCopyWith<$Res>
    implements $ForgeStateCopyWith<$Res> {
  factory _$$ForgeStateImplCopyWith(
          _$ForgeStateImpl value, $Res Function(_$ForgeStateImpl) then) =
      __$$ForgeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TrainingPool? pool});

  @override
  $TrainingPoolCopyWith<$Res>? get pool;
}

/// @nodoc
class __$$ForgeStateImplCopyWithImpl<$Res>
    extends _$ForgeStateCopyWithImpl<$Res, _$ForgeStateImpl>
    implements _$$ForgeStateImplCopyWith<$Res> {
  __$$ForgeStateImplCopyWithImpl(
      _$ForgeStateImpl _value, $Res Function(_$ForgeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pool = freezed,
  }) {
    return _then(_$ForgeStateImpl(
      pool: freezed == pool
          ? _value.pool
          : pool // ignore: cast_nullable_to_non_nullable
              as TrainingPool?,
    ));
  }
}

/// @nodoc

class _$ForgeStateImpl extends _ForgeState {
  const _$ForgeStateImpl({this.pool}) : super._();

  @override
  final TrainingPool? pool;

  @override
  String toString() {
    return 'ForgeState(pool: $pool)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgeStateImpl &&
            (identical(other.pool, pool) || other.pool == pool));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pool);

  /// Create a copy of ForgeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgeStateImplCopyWith<_$ForgeStateImpl> get copyWith =>
      __$$ForgeStateImplCopyWithImpl<_$ForgeStateImpl>(this, _$identity);
}

abstract class _ForgeState extends ForgeState {
  const factory _ForgeState({final TrainingPool? pool}) = _$ForgeStateImpl;
  const _ForgeState._() : super._();

  @override
  TrainingPool? get pool;

  /// Create a copy of ForgeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgeStateImplCopyWith<_$ForgeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
