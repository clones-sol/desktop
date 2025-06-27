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
mixin _$ForgeDetailState {
  TrainingPool? get pool => throw _privateConstructorUsedError;

  /// Create a copy of ForgeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgeDetailStateCopyWith<ForgeDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgeDetailStateCopyWith<$Res> {
  factory $ForgeDetailStateCopyWith(
          ForgeDetailState value, $Res Function(ForgeDetailState) then) =
      _$ForgeDetailStateCopyWithImpl<$Res, ForgeDetailState>;
  @useResult
  $Res call({TrainingPool? pool});

  $TrainingPoolCopyWith<$Res>? get pool;
}

/// @nodoc
class _$ForgeDetailStateCopyWithImpl<$Res, $Val extends ForgeDetailState>
    implements $ForgeDetailStateCopyWith<$Res> {
  _$ForgeDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgeDetailState
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

  /// Create a copy of ForgeDetailState
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
abstract class _$$ForgeDetailStateImplCopyWith<$Res>
    implements $ForgeDetailStateCopyWith<$Res> {
  factory _$$ForgeDetailStateImplCopyWith(_$ForgeDetailStateImpl value,
          $Res Function(_$ForgeDetailStateImpl) then) =
      __$$ForgeDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TrainingPool? pool});

  @override
  $TrainingPoolCopyWith<$Res>? get pool;
}

/// @nodoc
class __$$ForgeDetailStateImplCopyWithImpl<$Res>
    extends _$ForgeDetailStateCopyWithImpl<$Res, _$ForgeDetailStateImpl>
    implements _$$ForgeDetailStateImplCopyWith<$Res> {
  __$$ForgeDetailStateImplCopyWithImpl(_$ForgeDetailStateImpl _value,
      $Res Function(_$ForgeDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pool = freezed,
  }) {
    return _then(_$ForgeDetailStateImpl(
      pool: freezed == pool
          ? _value.pool
          : pool // ignore: cast_nullable_to_non_nullable
              as TrainingPool?,
    ));
  }
}

/// @nodoc

class _$ForgeDetailStateImpl extends _ForgeDetailState {
  const _$ForgeDetailStateImpl({this.pool}) : super._();

  @override
  final TrainingPool? pool;

  @override
  String toString() {
    return 'ForgeDetailState(pool: $pool)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgeDetailStateImpl &&
            (identical(other.pool, pool) || other.pool == pool));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pool);

  /// Create a copy of ForgeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgeDetailStateImplCopyWith<_$ForgeDetailStateImpl> get copyWith =>
      __$$ForgeDetailStateImplCopyWithImpl<_$ForgeDetailStateImpl>(
          this, _$identity);
}

abstract class _ForgeDetailState extends ForgeDetailState {
  const factory _ForgeDetailState({final TrainingPool? pool}) =
      _$ForgeDetailStateImpl;
  const _ForgeDetailState._() : super._();

  @override
  TrainingPool? get pool;

  /// Create a copy of ForgeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgeDetailStateImplCopyWith<_$ForgeDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
