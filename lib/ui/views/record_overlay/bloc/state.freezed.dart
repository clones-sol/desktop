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
mixin _$RecordOverlayState {
  Quest? get demo => throw _privateConstructorUsedError;
  RecordingState get recordingState => throw _privateConstructorUsedError;
  Timer? get timer => throw _privateConstructorUsedError;
  int get seconds => throw _privateConstructorUsedError;
  bool get isLocked => throw _privateConstructorUsedError;
  bool get isCollapsed => throw _privateConstructorUsedError;
  bool get focused => throw _privateConstructorUsedError;

  /// Create a copy of RecordOverlayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordOverlayStateCopyWith<RecordOverlayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordOverlayStateCopyWith<$Res> {
  factory $RecordOverlayStateCopyWith(
          RecordOverlayState value, $Res Function(RecordOverlayState) then) =
      _$RecordOverlayStateCopyWithImpl<$Res, RecordOverlayState>;
  @useResult
  $Res call(
      {Quest? demo,
      RecordingState recordingState,
      Timer? timer,
      int seconds,
      bool isLocked,
      bool isCollapsed,
      bool focused});

  $QuestCopyWith<$Res>? get demo;
}

/// @nodoc
class _$RecordOverlayStateCopyWithImpl<$Res, $Val extends RecordOverlayState>
    implements $RecordOverlayStateCopyWith<$Res> {
  _$RecordOverlayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordOverlayState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? demo = freezed,
    Object? recordingState = null,
    Object? timer = freezed,
    Object? seconds = null,
    Object? isLocked = null,
    Object? isCollapsed = null,
    Object? focused = null,
  }) {
    return _then(_value.copyWith(
      demo: freezed == demo
          ? _value.demo
          : demo // ignore: cast_nullable_to_non_nullable
              as Quest?,
      recordingState: null == recordingState
          ? _value.recordingState
          : recordingState // ignore: cast_nullable_to_non_nullable
              as RecordingState,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      isCollapsed: null == isCollapsed
          ? _value.isCollapsed
          : isCollapsed // ignore: cast_nullable_to_non_nullable
              as bool,
      focused: null == focused
          ? _value.focused
          : focused // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of RecordOverlayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestCopyWith<$Res>? get demo {
    if (_value.demo == null) {
      return null;
    }

    return $QuestCopyWith<$Res>(_value.demo!, (value) {
      return _then(_value.copyWith(demo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecordOverlayStateImplCopyWith<$Res>
    implements $RecordOverlayStateCopyWith<$Res> {
  factory _$$RecordOverlayStateImplCopyWith(_$RecordOverlayStateImpl value,
          $Res Function(_$RecordOverlayStateImpl) then) =
      __$$RecordOverlayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Quest? demo,
      RecordingState recordingState,
      Timer? timer,
      int seconds,
      bool isLocked,
      bool isCollapsed,
      bool focused});

  @override
  $QuestCopyWith<$Res>? get demo;
}

/// @nodoc
class __$$RecordOverlayStateImplCopyWithImpl<$Res>
    extends _$RecordOverlayStateCopyWithImpl<$Res, _$RecordOverlayStateImpl>
    implements _$$RecordOverlayStateImplCopyWith<$Res> {
  __$$RecordOverlayStateImplCopyWithImpl(_$RecordOverlayStateImpl _value,
      $Res Function(_$RecordOverlayStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordOverlayState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? demo = freezed,
    Object? recordingState = null,
    Object? timer = freezed,
    Object? seconds = null,
    Object? isLocked = null,
    Object? isCollapsed = null,
    Object? focused = null,
  }) {
    return _then(_$RecordOverlayStateImpl(
      demo: freezed == demo
          ? _value.demo
          : demo // ignore: cast_nullable_to_non_nullable
              as Quest?,
      recordingState: null == recordingState
          ? _value.recordingState
          : recordingState // ignore: cast_nullable_to_non_nullable
              as RecordingState,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      isCollapsed: null == isCollapsed
          ? _value.isCollapsed
          : isCollapsed // ignore: cast_nullable_to_non_nullable
              as bool,
      focused: null == focused
          ? _value.focused
          : focused // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RecordOverlayStateImpl extends _RecordOverlayState {
  const _$RecordOverlayStateImpl(
      {this.demo,
      this.recordingState = RecordingState.off,
      this.timer = null,
      this.seconds = 0,
      this.isLocked = false,
      this.isCollapsed = false,
      this.focused = true})
      : super._();

  @override
  final Quest? demo;
  @override
  @JsonKey()
  final RecordingState recordingState;
  @override
  @JsonKey()
  final Timer? timer;
  @override
  @JsonKey()
  final int seconds;
  @override
  @JsonKey()
  final bool isLocked;
  @override
  @JsonKey()
  final bool isCollapsed;
  @override
  @JsonKey()
  final bool focused;

  @override
  String toString() {
    return 'RecordOverlayState(demo: $demo, recordingState: $recordingState, timer: $timer, seconds: $seconds, isLocked: $isLocked, isCollapsed: $isCollapsed, focused: $focused)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordOverlayStateImpl &&
            (identical(other.demo, demo) || other.demo == demo) &&
            (identical(other.recordingState, recordingState) ||
                other.recordingState == recordingState) &&
            (identical(other.timer, timer) || other.timer == timer) &&
            (identical(other.seconds, seconds) || other.seconds == seconds) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked) &&
            (identical(other.isCollapsed, isCollapsed) ||
                other.isCollapsed == isCollapsed) &&
            (identical(other.focused, focused) || other.focused == focused));
  }

  @override
  int get hashCode => Object.hash(runtimeType, demo, recordingState, timer,
      seconds, isLocked, isCollapsed, focused);

  /// Create a copy of RecordOverlayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordOverlayStateImplCopyWith<_$RecordOverlayStateImpl> get copyWith =>
      __$$RecordOverlayStateImplCopyWithImpl<_$RecordOverlayStateImpl>(
          this, _$identity);
}

abstract class _RecordOverlayState extends RecordOverlayState {
  const factory _RecordOverlayState(
      {final Quest? demo,
      final RecordingState recordingState,
      final Timer? timer,
      final int seconds,
      final bool isLocked,
      final bool isCollapsed,
      final bool focused}) = _$RecordOverlayStateImpl;
  const _RecordOverlayState._() : super._();

  @override
  Quest? get demo;
  @override
  RecordingState get recordingState;
  @override
  Timer? get timer;
  @override
  int get seconds;
  @override
  bool get isLocked;
  @override
  bool get isCollapsed;
  @override
  bool get focused;

  /// Create a copy of RecordOverlayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordOverlayStateImplCopyWith<_$RecordOverlayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
