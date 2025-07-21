// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recording_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecordingEvent {
  int get time => throw _privateConstructorUsedError;
  String get event => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  /// Create a copy of RecordingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordingEventCopyWith<RecordingEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordingEventCopyWith<$Res> {
  factory $RecordingEventCopyWith(
          RecordingEvent value, $Res Function(RecordingEvent) then) =
      _$RecordingEventCopyWithImpl<$Res, RecordingEvent>;
  @useResult
  $Res call({int time, String event, Map<String, dynamic> data});
}

/// @nodoc
class _$RecordingEventCopyWithImpl<$Res, $Val extends RecordingEvent>
    implements $RecordingEventCopyWith<$Res> {
  _$RecordingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? event = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordingEventImplCopyWith<$Res>
    implements $RecordingEventCopyWith<$Res> {
  factory _$$RecordingEventImplCopyWith(_$RecordingEventImpl value,
          $Res Function(_$RecordingEventImpl) then) =
      __$$RecordingEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int time, String event, Map<String, dynamic> data});
}

/// @nodoc
class __$$RecordingEventImplCopyWithImpl<$Res>
    extends _$RecordingEventCopyWithImpl<$Res, _$RecordingEventImpl>
    implements _$$RecordingEventImplCopyWith<$Res> {
  __$$RecordingEventImplCopyWithImpl(
      _$RecordingEventImpl _value, $Res Function(_$RecordingEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? event = null,
    Object? data = null,
  }) {
    return _then(_$RecordingEventImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$RecordingEventImpl implements _RecordingEvent {
  const _$RecordingEventImpl(
      {required this.time,
      required this.event,
      required final Map<String, dynamic> data})
      : _data = data;

  @override
  final int time;
  @override
  final String event;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'RecordingEvent(time: $time, event: $event, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingEventImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.event, event) || other.event == event) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, time, event, const DeepCollectionEquality().hash(_data));

  /// Create a copy of RecordingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordingEventImplCopyWith<_$RecordingEventImpl> get copyWith =>
      __$$RecordingEventImplCopyWithImpl<_$RecordingEventImpl>(
          this, _$identity);
}

abstract class _RecordingEvent implements RecordingEvent {
  const factory _RecordingEvent(
      {required final int time,
      required final String event,
      required final Map<String, dynamic> data}) = _$RecordingEventImpl;

  @override
  int get time;
  @override
  String get event;
  @override
  Map<String, dynamic> get data;

  /// Create a copy of RecordingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordingEventImplCopyWith<_$RecordingEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
