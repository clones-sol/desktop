// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_socket_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AgentSocketMessage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) unknown,
    required TResult Function(String error) error,
    required TResult Function(bool success, String message) subscriptionSuccess,
    required TResult Function(String event, AgentStatusUpdateData data)
        agentStatusUpdate,
    required TResult Function(String event, TxSubmittedData data) txSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? unknown,
    TResult? Function(String error)? error,
    TResult? Function(bool success, String message)? subscriptionSuccess,
    TResult? Function(String event, AgentStatusUpdateData data)?
        agentStatusUpdate,
    TResult? Function(String event, TxSubmittedData data)? txSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? unknown,
    TResult Function(String error)? error,
    TResult Function(bool success, String message)? subscriptionSuccess,
    TResult Function(String event, AgentStatusUpdateData data)?
        agentStatusUpdate,
    TResult Function(String event, TxSubmittedData data)? txSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownMessage value) unknown,
    required TResult Function(_ErrorMessage value) error,
    required TResult Function(_SubscriptionSuccessMessage value)
        subscriptionSuccess,
    required TResult Function(_AgentStatusUpdateMessage value)
        agentStatusUpdate,
    required TResult Function(_TxSubmittedMessage value) txSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownMessage value)? unknown,
    TResult? Function(_ErrorMessage value)? error,
    TResult? Function(_SubscriptionSuccessMessage value)? subscriptionSuccess,
    TResult? Function(_AgentStatusUpdateMessage value)? agentStatusUpdate,
    TResult? Function(_TxSubmittedMessage value)? txSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownMessage value)? unknown,
    TResult Function(_ErrorMessage value)? error,
    TResult Function(_SubscriptionSuccessMessage value)? subscriptionSuccess,
    TResult Function(_AgentStatusUpdateMessage value)? agentStatusUpdate,
    TResult Function(_TxSubmittedMessage value)? txSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentSocketMessageCopyWith<$Res> {
  factory $AgentSocketMessageCopyWith(
          AgentSocketMessage value, $Res Function(AgentSocketMessage) then) =
      _$AgentSocketMessageCopyWithImpl<$Res, AgentSocketMessage>;
}

/// @nodoc
class _$AgentSocketMessageCopyWithImpl<$Res, $Val extends AgentSocketMessage>
    implements $AgentSocketMessageCopyWith<$Res> {
  _$AgentSocketMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UnknownMessageImplCopyWith<$Res> {
  factory _$$UnknownMessageImplCopyWith(_$UnknownMessageImpl value,
          $Res Function(_$UnknownMessageImpl) then) =
      __$$UnknownMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$UnknownMessageImplCopyWithImpl<$Res>
    extends _$AgentSocketMessageCopyWithImpl<$Res, _$UnknownMessageImpl>
    implements _$$UnknownMessageImplCopyWith<$Res> {
  __$$UnknownMessageImplCopyWithImpl(
      _$UnknownMessageImpl _value, $Res Function(_$UnknownMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UnknownMessageImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$UnknownMessageImpl implements _UnknownMessage {
  const _$UnknownMessageImpl(final Map<String, dynamic> data) : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'AgentSocketMessage.unknown(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownMessageImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownMessageImplCopyWith<_$UnknownMessageImpl> get copyWith =>
      __$$UnknownMessageImplCopyWithImpl<_$UnknownMessageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) unknown,
    required TResult Function(String error) error,
    required TResult Function(bool success, String message) subscriptionSuccess,
    required TResult Function(String event, AgentStatusUpdateData data)
        agentStatusUpdate,
    required TResult Function(String event, TxSubmittedData data) txSubmitted,
  }) {
    return unknown(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? unknown,
    TResult? Function(String error)? error,
    TResult? Function(bool success, String message)? subscriptionSuccess,
    TResult? Function(String event, AgentStatusUpdateData data)?
        agentStatusUpdate,
    TResult? Function(String event, TxSubmittedData data)? txSubmitted,
  }) {
    return unknown?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? unknown,
    TResult Function(String error)? error,
    TResult Function(bool success, String message)? subscriptionSuccess,
    TResult Function(String event, AgentStatusUpdateData data)?
        agentStatusUpdate,
    TResult Function(String event, TxSubmittedData data)? txSubmitted,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownMessage value) unknown,
    required TResult Function(_ErrorMessage value) error,
    required TResult Function(_SubscriptionSuccessMessage value)
        subscriptionSuccess,
    required TResult Function(_AgentStatusUpdateMessage value)
        agentStatusUpdate,
    required TResult Function(_TxSubmittedMessage value) txSubmitted,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownMessage value)? unknown,
    TResult? Function(_ErrorMessage value)? error,
    TResult? Function(_SubscriptionSuccessMessage value)? subscriptionSuccess,
    TResult? Function(_AgentStatusUpdateMessage value)? agentStatusUpdate,
    TResult? Function(_TxSubmittedMessage value)? txSubmitted,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownMessage value)? unknown,
    TResult Function(_ErrorMessage value)? error,
    TResult Function(_SubscriptionSuccessMessage value)? subscriptionSuccess,
    TResult Function(_AgentStatusUpdateMessage value)? agentStatusUpdate,
    TResult Function(_TxSubmittedMessage value)? txSubmitted,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _UnknownMessage implements AgentSocketMessage {
  const factory _UnknownMessage(final Map<String, dynamic> data) =
      _$UnknownMessageImpl;

  Map<String, dynamic> get data;

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownMessageImplCopyWith<_$UnknownMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorMessageImplCopyWith<$Res> {
  factory _$$ErrorMessageImplCopyWith(
          _$ErrorMessageImpl value, $Res Function(_$ErrorMessageImpl) then) =
      __$$ErrorMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorMessageImplCopyWithImpl<$Res>
    extends _$AgentSocketMessageCopyWithImpl<$Res, _$ErrorMessageImpl>
    implements _$$ErrorMessageImplCopyWith<$Res> {
  __$$ErrorMessageImplCopyWithImpl(
      _$ErrorMessageImpl _value, $Res Function(_$ErrorMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorMessageImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorMessageImpl implements _ErrorMessage {
  const _$ErrorMessageImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'AgentSocketMessage.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorMessageImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorMessageImplCopyWith<_$ErrorMessageImpl> get copyWith =>
      __$$ErrorMessageImplCopyWithImpl<_$ErrorMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) unknown,
    required TResult Function(String error) error,
    required TResult Function(bool success, String message) subscriptionSuccess,
    required TResult Function(String event, AgentStatusUpdateData data)
        agentStatusUpdate,
    required TResult Function(String event, TxSubmittedData data) txSubmitted,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? unknown,
    TResult? Function(String error)? error,
    TResult? Function(bool success, String message)? subscriptionSuccess,
    TResult? Function(String event, AgentStatusUpdateData data)?
        agentStatusUpdate,
    TResult? Function(String event, TxSubmittedData data)? txSubmitted,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? unknown,
    TResult Function(String error)? error,
    TResult Function(bool success, String message)? subscriptionSuccess,
    TResult Function(String event, AgentStatusUpdateData data)?
        agentStatusUpdate,
    TResult Function(String event, TxSubmittedData data)? txSubmitted,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownMessage value) unknown,
    required TResult Function(_ErrorMessage value) error,
    required TResult Function(_SubscriptionSuccessMessage value)
        subscriptionSuccess,
    required TResult Function(_AgentStatusUpdateMessage value)
        agentStatusUpdate,
    required TResult Function(_TxSubmittedMessage value) txSubmitted,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownMessage value)? unknown,
    TResult? Function(_ErrorMessage value)? error,
    TResult? Function(_SubscriptionSuccessMessage value)? subscriptionSuccess,
    TResult? Function(_AgentStatusUpdateMessage value)? agentStatusUpdate,
    TResult? Function(_TxSubmittedMessage value)? txSubmitted,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownMessage value)? unknown,
    TResult Function(_ErrorMessage value)? error,
    TResult Function(_SubscriptionSuccessMessage value)? subscriptionSuccess,
    TResult Function(_AgentStatusUpdateMessage value)? agentStatusUpdate,
    TResult Function(_TxSubmittedMessage value)? txSubmitted,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorMessage implements AgentSocketMessage {
  const factory _ErrorMessage({required final String error}) =
      _$ErrorMessageImpl;

  String get error;

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorMessageImplCopyWith<_$ErrorMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubscriptionSuccessMessageImplCopyWith<$Res> {
  factory _$$SubscriptionSuccessMessageImplCopyWith(
          _$SubscriptionSuccessMessageImpl value,
          $Res Function(_$SubscriptionSuccessMessageImpl) then) =
      __$$SubscriptionSuccessMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool success, String message});
}

/// @nodoc
class __$$SubscriptionSuccessMessageImplCopyWithImpl<$Res>
    extends _$AgentSocketMessageCopyWithImpl<$Res,
        _$SubscriptionSuccessMessageImpl>
    implements _$$SubscriptionSuccessMessageImplCopyWith<$Res> {
  __$$SubscriptionSuccessMessageImplCopyWithImpl(
      _$SubscriptionSuccessMessageImpl _value,
      $Res Function(_$SubscriptionSuccessMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_$SubscriptionSuccessMessageImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SubscriptionSuccessMessageImpl implements _SubscriptionSuccessMessage {
  const _$SubscriptionSuccessMessageImpl(
      {required this.success, required this.message});

  @override
  final bool success;
  @override
  final String message;

  @override
  String toString() {
    return 'AgentSocketMessage.subscriptionSuccess(success: $success, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionSuccessMessageImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success, message);

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionSuccessMessageImplCopyWith<_$SubscriptionSuccessMessageImpl>
      get copyWith => __$$SubscriptionSuccessMessageImplCopyWithImpl<
          _$SubscriptionSuccessMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) unknown,
    required TResult Function(String error) error,
    required TResult Function(bool success, String message) subscriptionSuccess,
    required TResult Function(String event, AgentStatusUpdateData data)
        agentStatusUpdate,
    required TResult Function(String event, TxSubmittedData data) txSubmitted,
  }) {
    return subscriptionSuccess(success, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? unknown,
    TResult? Function(String error)? error,
    TResult? Function(bool success, String message)? subscriptionSuccess,
    TResult? Function(String event, AgentStatusUpdateData data)?
        agentStatusUpdate,
    TResult? Function(String event, TxSubmittedData data)? txSubmitted,
  }) {
    return subscriptionSuccess?.call(success, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? unknown,
    TResult Function(String error)? error,
    TResult Function(bool success, String message)? subscriptionSuccess,
    TResult Function(String event, AgentStatusUpdateData data)?
        agentStatusUpdate,
    TResult Function(String event, TxSubmittedData data)? txSubmitted,
    required TResult orElse(),
  }) {
    if (subscriptionSuccess != null) {
      return subscriptionSuccess(success, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownMessage value) unknown,
    required TResult Function(_ErrorMessage value) error,
    required TResult Function(_SubscriptionSuccessMessage value)
        subscriptionSuccess,
    required TResult Function(_AgentStatusUpdateMessage value)
        agentStatusUpdate,
    required TResult Function(_TxSubmittedMessage value) txSubmitted,
  }) {
    return subscriptionSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownMessage value)? unknown,
    TResult? Function(_ErrorMessage value)? error,
    TResult? Function(_SubscriptionSuccessMessage value)? subscriptionSuccess,
    TResult? Function(_AgentStatusUpdateMessage value)? agentStatusUpdate,
    TResult? Function(_TxSubmittedMessage value)? txSubmitted,
  }) {
    return subscriptionSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownMessage value)? unknown,
    TResult Function(_ErrorMessage value)? error,
    TResult Function(_SubscriptionSuccessMessage value)? subscriptionSuccess,
    TResult Function(_AgentStatusUpdateMessage value)? agentStatusUpdate,
    TResult Function(_TxSubmittedMessage value)? txSubmitted,
    required TResult orElse(),
  }) {
    if (subscriptionSuccess != null) {
      return subscriptionSuccess(this);
    }
    return orElse();
  }
}

abstract class _SubscriptionSuccessMessage implements AgentSocketMessage {
  const factory _SubscriptionSuccessMessage(
      {required final bool success,
      required final String message}) = _$SubscriptionSuccessMessageImpl;

  bool get success;
  String get message;

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionSuccessMessageImplCopyWith<_$SubscriptionSuccessMessageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AgentStatusUpdateMessageImplCopyWith<$Res> {
  factory _$$AgentStatusUpdateMessageImplCopyWith(
          _$AgentStatusUpdateMessageImpl value,
          $Res Function(_$AgentStatusUpdateMessageImpl) then) =
      __$$AgentStatusUpdateMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String event, AgentStatusUpdateData data});

  $AgentStatusUpdateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$AgentStatusUpdateMessageImplCopyWithImpl<$Res>
    extends _$AgentSocketMessageCopyWithImpl<$Res,
        _$AgentStatusUpdateMessageImpl>
    implements _$$AgentStatusUpdateMessageImplCopyWith<$Res> {
  __$$AgentStatusUpdateMessageImplCopyWithImpl(
      _$AgentStatusUpdateMessageImpl _value,
      $Res Function(_$AgentStatusUpdateMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? data = null,
  }) {
    return _then(_$AgentStatusUpdateMessageImpl(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AgentStatusUpdateData,
    ));
  }

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgentStatusUpdateDataCopyWith<$Res> get data {
    return $AgentStatusUpdateDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$AgentStatusUpdateMessageImpl implements _AgentStatusUpdateMessage {
  const _$AgentStatusUpdateMessageImpl(
      {required this.event, required this.data});

  @override
  final String event;
  @override
  final AgentStatusUpdateData data;

  @override
  String toString() {
    return 'AgentSocketMessage.agentStatusUpdate(event: $event, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentStatusUpdateMessageImpl &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event, data);

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentStatusUpdateMessageImplCopyWith<_$AgentStatusUpdateMessageImpl>
      get copyWith => __$$AgentStatusUpdateMessageImplCopyWithImpl<
          _$AgentStatusUpdateMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) unknown,
    required TResult Function(String error) error,
    required TResult Function(bool success, String message) subscriptionSuccess,
    required TResult Function(String event, AgentStatusUpdateData data)
        agentStatusUpdate,
    required TResult Function(String event, TxSubmittedData data) txSubmitted,
  }) {
    return agentStatusUpdate(event, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? unknown,
    TResult? Function(String error)? error,
    TResult? Function(bool success, String message)? subscriptionSuccess,
    TResult? Function(String event, AgentStatusUpdateData data)?
        agentStatusUpdate,
    TResult? Function(String event, TxSubmittedData data)? txSubmitted,
  }) {
    return agentStatusUpdate?.call(event, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? unknown,
    TResult Function(String error)? error,
    TResult Function(bool success, String message)? subscriptionSuccess,
    TResult Function(String event, AgentStatusUpdateData data)?
        agentStatusUpdate,
    TResult Function(String event, TxSubmittedData data)? txSubmitted,
    required TResult orElse(),
  }) {
    if (agentStatusUpdate != null) {
      return agentStatusUpdate(event, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownMessage value) unknown,
    required TResult Function(_ErrorMessage value) error,
    required TResult Function(_SubscriptionSuccessMessage value)
        subscriptionSuccess,
    required TResult Function(_AgentStatusUpdateMessage value)
        agentStatusUpdate,
    required TResult Function(_TxSubmittedMessage value) txSubmitted,
  }) {
    return agentStatusUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownMessage value)? unknown,
    TResult? Function(_ErrorMessage value)? error,
    TResult? Function(_SubscriptionSuccessMessage value)? subscriptionSuccess,
    TResult? Function(_AgentStatusUpdateMessage value)? agentStatusUpdate,
    TResult? Function(_TxSubmittedMessage value)? txSubmitted,
  }) {
    return agentStatusUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownMessage value)? unknown,
    TResult Function(_ErrorMessage value)? error,
    TResult Function(_SubscriptionSuccessMessage value)? subscriptionSuccess,
    TResult Function(_AgentStatusUpdateMessage value)? agentStatusUpdate,
    TResult Function(_TxSubmittedMessage value)? txSubmitted,
    required TResult orElse(),
  }) {
    if (agentStatusUpdate != null) {
      return agentStatusUpdate(this);
    }
    return orElse();
  }
}

abstract class _AgentStatusUpdateMessage implements AgentSocketMessage {
  const factory _AgentStatusUpdateMessage(
          {required final String event,
          required final AgentStatusUpdateData data}) =
      _$AgentStatusUpdateMessageImpl;

  String get event;
  AgentStatusUpdateData get data;

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentStatusUpdateMessageImplCopyWith<_$AgentStatusUpdateMessageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TxSubmittedMessageImplCopyWith<$Res> {
  factory _$$TxSubmittedMessageImplCopyWith(_$TxSubmittedMessageImpl value,
          $Res Function(_$TxSubmittedMessageImpl) then) =
      __$$TxSubmittedMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String event, TxSubmittedData data});

  $TxSubmittedDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$TxSubmittedMessageImplCopyWithImpl<$Res>
    extends _$AgentSocketMessageCopyWithImpl<$Res, _$TxSubmittedMessageImpl>
    implements _$$TxSubmittedMessageImplCopyWith<$Res> {
  __$$TxSubmittedMessageImplCopyWithImpl(_$TxSubmittedMessageImpl _value,
      $Res Function(_$TxSubmittedMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? data = null,
  }) {
    return _then(_$TxSubmittedMessageImpl(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TxSubmittedData,
    ));
  }

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TxSubmittedDataCopyWith<$Res> get data {
    return $TxSubmittedDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$TxSubmittedMessageImpl implements _TxSubmittedMessage {
  const _$TxSubmittedMessageImpl({required this.event, required this.data});

  @override
  final String event;
  @override
  final TxSubmittedData data;

  @override
  String toString() {
    return 'AgentSocketMessage.txSubmitted(event: $event, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TxSubmittedMessageImpl &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event, data);

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TxSubmittedMessageImplCopyWith<_$TxSubmittedMessageImpl> get copyWith =>
      __$$TxSubmittedMessageImplCopyWithImpl<_$TxSubmittedMessageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) unknown,
    required TResult Function(String error) error,
    required TResult Function(bool success, String message) subscriptionSuccess,
    required TResult Function(String event, AgentStatusUpdateData data)
        agentStatusUpdate,
    required TResult Function(String event, TxSubmittedData data) txSubmitted,
  }) {
    return txSubmitted(event, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? unknown,
    TResult? Function(String error)? error,
    TResult? Function(bool success, String message)? subscriptionSuccess,
    TResult? Function(String event, AgentStatusUpdateData data)?
        agentStatusUpdate,
    TResult? Function(String event, TxSubmittedData data)? txSubmitted,
  }) {
    return txSubmitted?.call(event, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? unknown,
    TResult Function(String error)? error,
    TResult Function(bool success, String message)? subscriptionSuccess,
    TResult Function(String event, AgentStatusUpdateData data)?
        agentStatusUpdate,
    TResult Function(String event, TxSubmittedData data)? txSubmitted,
    required TResult orElse(),
  }) {
    if (txSubmitted != null) {
      return txSubmitted(event, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownMessage value) unknown,
    required TResult Function(_ErrorMessage value) error,
    required TResult Function(_SubscriptionSuccessMessage value)
        subscriptionSuccess,
    required TResult Function(_AgentStatusUpdateMessage value)
        agentStatusUpdate,
    required TResult Function(_TxSubmittedMessage value) txSubmitted,
  }) {
    return txSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownMessage value)? unknown,
    TResult? Function(_ErrorMessage value)? error,
    TResult? Function(_SubscriptionSuccessMessage value)? subscriptionSuccess,
    TResult? Function(_AgentStatusUpdateMessage value)? agentStatusUpdate,
    TResult? Function(_TxSubmittedMessage value)? txSubmitted,
  }) {
    return txSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownMessage value)? unknown,
    TResult Function(_ErrorMessage value)? error,
    TResult Function(_SubscriptionSuccessMessage value)? subscriptionSuccess,
    TResult Function(_AgentStatusUpdateMessage value)? agentStatusUpdate,
    TResult Function(_TxSubmittedMessage value)? txSubmitted,
    required TResult orElse(),
  }) {
    if (txSubmitted != null) {
      return txSubmitted(this);
    }
    return orElse();
  }
}

abstract class _TxSubmittedMessage implements AgentSocketMessage {
  const factory _TxSubmittedMessage(
      {required final String event,
      required final TxSubmittedData data}) = _$TxSubmittedMessageImpl;

  String get event;
  TxSubmittedData get data;

  /// Create a copy of AgentSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TxSubmittedMessageImplCopyWith<_$TxSubmittedMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AgentStatusUpdateData _$AgentStatusUpdateDataFromJson(
    Map<String, dynamic> json) {
  return _AgentStatusUpdateData.fromJson(json);
}

/// @nodoc
mixin _$AgentStatusUpdateData {
  String get agentId => throw _privateConstructorUsedError;
  AgentDeploymentStatus get status =>
      throw _privateConstructorUsedError; // The 'details' field can have a dynamic structure based on the status.
// Using a Map is flexible enough to handle this.
  Map<String, dynamic>? get details => throw _privateConstructorUsedError;

  /// Serializes this AgentStatusUpdateData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentStatusUpdateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentStatusUpdateDataCopyWith<AgentStatusUpdateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentStatusUpdateDataCopyWith<$Res> {
  factory $AgentStatusUpdateDataCopyWith(AgentStatusUpdateData value,
          $Res Function(AgentStatusUpdateData) then) =
      _$AgentStatusUpdateDataCopyWithImpl<$Res, AgentStatusUpdateData>;
  @useResult
  $Res call(
      {String agentId,
      AgentDeploymentStatus status,
      Map<String, dynamic>? details});
}

/// @nodoc
class _$AgentStatusUpdateDataCopyWithImpl<$Res,
        $Val extends AgentStatusUpdateData>
    implements $AgentStatusUpdateDataCopyWith<$Res> {
  _$AgentStatusUpdateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentStatusUpdateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentId = null,
    Object? status = null,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AgentDeploymentStatus,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgentStatusUpdateDataImplCopyWith<$Res>
    implements $AgentStatusUpdateDataCopyWith<$Res> {
  factory _$$AgentStatusUpdateDataImplCopyWith(
          _$AgentStatusUpdateDataImpl value,
          $Res Function(_$AgentStatusUpdateDataImpl) then) =
      __$$AgentStatusUpdateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String agentId,
      AgentDeploymentStatus status,
      Map<String, dynamic>? details});
}

/// @nodoc
class __$$AgentStatusUpdateDataImplCopyWithImpl<$Res>
    extends _$AgentStatusUpdateDataCopyWithImpl<$Res,
        _$AgentStatusUpdateDataImpl>
    implements _$$AgentStatusUpdateDataImplCopyWith<$Res> {
  __$$AgentStatusUpdateDataImplCopyWithImpl(_$AgentStatusUpdateDataImpl _value,
      $Res Function(_$AgentStatusUpdateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentStatusUpdateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentId = null,
    Object? status = null,
    Object? details = freezed,
  }) {
    return _then(_$AgentStatusUpdateDataImpl(
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AgentDeploymentStatus,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentStatusUpdateDataImpl implements _AgentStatusUpdateData {
  const _$AgentStatusUpdateDataImpl(
      {required this.agentId,
      required this.status,
      final Map<String, dynamic>? details})
      : _details = details;

  factory _$AgentStatusUpdateDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentStatusUpdateDataImplFromJson(json);

  @override
  final String agentId;
  @override
  final AgentDeploymentStatus status;
// The 'details' field can have a dynamic structure based on the status.
// Using a Map is flexible enough to handle this.
  final Map<String, dynamic>? _details;
// The 'details' field can have a dynamic structure based on the status.
// Using a Map is flexible enough to handle this.
  @override
  Map<String, dynamic>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AgentStatusUpdateData(agentId: $agentId, status: $status, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentStatusUpdateDataImpl &&
            (identical(other.agentId, agentId) || other.agentId == agentId) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, agentId, status,
      const DeepCollectionEquality().hash(_details));

  /// Create a copy of AgentStatusUpdateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentStatusUpdateDataImplCopyWith<_$AgentStatusUpdateDataImpl>
      get copyWith => __$$AgentStatusUpdateDataImplCopyWithImpl<
          _$AgentStatusUpdateDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentStatusUpdateDataImplToJson(
      this,
    );
  }
}

abstract class _AgentStatusUpdateData implements AgentStatusUpdateData {
  const factory _AgentStatusUpdateData(
      {required final String agentId,
      required final AgentDeploymentStatus status,
      final Map<String, dynamic>? details}) = _$AgentStatusUpdateDataImpl;

  factory _AgentStatusUpdateData.fromJson(Map<String, dynamic> json) =
      _$AgentStatusUpdateDataImpl.fromJson;

  @override
  String get agentId;
  @override
  AgentDeploymentStatus
      get status; // The 'details' field can have a dynamic structure based on the status.
// Using a Map is flexible enough to handle this.
  @override
  Map<String, dynamic>? get details;

  /// Create a copy of AgentStatusUpdateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentStatusUpdateDataImplCopyWith<_$AgentStatusUpdateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TxSubmittedData _$TxSubmittedDataFromJson(Map<String, dynamic> json) {
  return _TxSubmittedData.fromJson(json);
}

/// @nodoc
mixin _$TxSubmittedData {
  String get agentId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get idempotencyKey => throw _privateConstructorUsedError;

  /// Serializes this TxSubmittedData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TxSubmittedData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TxSubmittedDataCopyWith<TxSubmittedData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TxSubmittedDataCopyWith<$Res> {
  factory $TxSubmittedDataCopyWith(
          TxSubmittedData value, $Res Function(TxSubmittedData) then) =
      _$TxSubmittedDataCopyWithImpl<$Res, TxSubmittedData>;
  @useResult
  $Res call({String agentId, String type, String idempotencyKey});
}

/// @nodoc
class _$TxSubmittedDataCopyWithImpl<$Res, $Val extends TxSubmittedData>
    implements $TxSubmittedDataCopyWith<$Res> {
  _$TxSubmittedDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TxSubmittedData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentId = null,
    Object? type = null,
    Object? idempotencyKey = null,
  }) {
    return _then(_value.copyWith(
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      idempotencyKey: null == idempotencyKey
          ? _value.idempotencyKey
          : idempotencyKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TxSubmittedDataImplCopyWith<$Res>
    implements $TxSubmittedDataCopyWith<$Res> {
  factory _$$TxSubmittedDataImplCopyWith(_$TxSubmittedDataImpl value,
          $Res Function(_$TxSubmittedDataImpl) then) =
      __$$TxSubmittedDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String agentId, String type, String idempotencyKey});
}

/// @nodoc
class __$$TxSubmittedDataImplCopyWithImpl<$Res>
    extends _$TxSubmittedDataCopyWithImpl<$Res, _$TxSubmittedDataImpl>
    implements _$$TxSubmittedDataImplCopyWith<$Res> {
  __$$TxSubmittedDataImplCopyWithImpl(
      _$TxSubmittedDataImpl _value, $Res Function(_$TxSubmittedDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TxSubmittedData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentId = null,
    Object? type = null,
    Object? idempotencyKey = null,
  }) {
    return _then(_$TxSubmittedDataImpl(
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      idempotencyKey: null == idempotencyKey
          ? _value.idempotencyKey
          : idempotencyKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TxSubmittedDataImpl implements _TxSubmittedData {
  const _$TxSubmittedDataImpl(
      {required this.agentId,
      required this.type,
      required this.idempotencyKey});

  factory _$TxSubmittedDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TxSubmittedDataImplFromJson(json);

  @override
  final String agentId;
  @override
  final String type;
  @override
  final String idempotencyKey;

  @override
  String toString() {
    return 'TxSubmittedData(agentId: $agentId, type: $type, idempotencyKey: $idempotencyKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TxSubmittedDataImpl &&
            (identical(other.agentId, agentId) || other.agentId == agentId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.idempotencyKey, idempotencyKey) ||
                other.idempotencyKey == idempotencyKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, agentId, type, idempotencyKey);

  /// Create a copy of TxSubmittedData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TxSubmittedDataImplCopyWith<_$TxSubmittedDataImpl> get copyWith =>
      __$$TxSubmittedDataImplCopyWithImpl<_$TxSubmittedDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TxSubmittedDataImplToJson(
      this,
    );
  }
}

abstract class _TxSubmittedData implements TxSubmittedData {
  const factory _TxSubmittedData(
      {required final String agentId,
      required final String type,
      required final String idempotencyKey}) = _$TxSubmittedDataImpl;

  factory _TxSubmittedData.fromJson(Map<String, dynamic> json) =
      _$TxSubmittedDataImpl.fromJson;

  @override
  String get agentId;
  @override
  String get type;
  @override
  String get idempotencyKey;

  /// Create a copy of TxSubmittedData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TxSubmittedDataImplCopyWith<_$TxSubmittedDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
