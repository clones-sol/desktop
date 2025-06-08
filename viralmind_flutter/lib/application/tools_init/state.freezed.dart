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

ToolsInitState _$ToolsInitStateFromJson(Map<String, dynamic> json) {
  return _ToolsInitState.fromJson(json);
}

/// @nodoc
mixin _$ToolsInitState {
  bool get initializing => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;

  /// Serializes this ToolsInitState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ToolsInitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ToolsInitStateCopyWith<ToolsInitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolsInitStateCopyWith<$Res> {
  factory $ToolsInitStateCopyWith(
          ToolsInitState value, $Res Function(ToolsInitState) then) =
      _$ToolsInitStateCopyWithImpl<$Res, ToolsInitState>;
  @useResult
  $Res call({bool initializing, double progress});
}

/// @nodoc
class _$ToolsInitStateCopyWithImpl<$Res, $Val extends ToolsInitState>
    implements $ToolsInitStateCopyWith<$Res> {
  _$ToolsInitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ToolsInitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initializing = null,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      initializing: null == initializing
          ? _value.initializing
          : initializing // ignore: cast_nullable_to_non_nullable
              as bool,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToolsInitStateImplCopyWith<$Res>
    implements $ToolsInitStateCopyWith<$Res> {
  factory _$$ToolsInitStateImplCopyWith(_$ToolsInitStateImpl value,
          $Res Function(_$ToolsInitStateImpl) then) =
      __$$ToolsInitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool initializing, double progress});
}

/// @nodoc
class __$$ToolsInitStateImplCopyWithImpl<$Res>
    extends _$ToolsInitStateCopyWithImpl<$Res, _$ToolsInitStateImpl>
    implements _$$ToolsInitStateImplCopyWith<$Res> {
  __$$ToolsInitStateImplCopyWithImpl(
      _$ToolsInitStateImpl _value, $Res Function(_$ToolsInitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ToolsInitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initializing = null,
    Object? progress = null,
  }) {
    return _then(_$ToolsInitStateImpl(
      initializing: null == initializing
          ? _value.initializing
          : initializing // ignore: cast_nullable_to_non_nullable
              as bool,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolsInitStateImpl implements _ToolsInitState {
  const _$ToolsInitStateImpl(
      {required this.initializing, required this.progress});

  factory _$ToolsInitStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToolsInitStateImplFromJson(json);

  @override
  final bool initializing;
  @override
  final double progress;

  @override
  String toString() {
    return 'ToolsInitState(initializing: $initializing, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolsInitStateImpl &&
            (identical(other.initializing, initializing) ||
                other.initializing == initializing) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, initializing, progress);

  /// Create a copy of ToolsInitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolsInitStateImplCopyWith<_$ToolsInitStateImpl> get copyWith =>
      __$$ToolsInitStateImplCopyWithImpl<_$ToolsInitStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToolsInitStateImplToJson(
      this,
    );
  }
}

abstract class _ToolsInitState implements ToolsInitState {
  const factory _ToolsInitState(
      {required final bool initializing,
      required final double progress}) = _$ToolsInitStateImpl;

  factory _ToolsInitState.fromJson(Map<String, dynamic> json) =
      _$ToolsInitStateImpl.fromJson;

  @override
  bool get initializing;
  @override
  double get progress;

  /// Create a copy of ToolsInitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToolsInitStateImplCopyWith<_$ToolsInitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
