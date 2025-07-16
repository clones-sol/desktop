// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_audit_log_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgentAuditLogEntry _$AgentAuditLogEntryFromJson(Map<String, dynamic> json) {
  return _AgentAuditLogEntry.fromJson(json);
}

/// @nodoc
mixin _$AgentAuditLogEntry {
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  Map<String, dynamic>? get details => throw _privateConstructorUsedError;

  /// Serializes this AgentAuditLogEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentAuditLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentAuditLogEntryCopyWith<AgentAuditLogEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentAuditLogEntryCopyWith<$Res> {
  factory $AgentAuditLogEntryCopyWith(
          AgentAuditLogEntry value, $Res Function(AgentAuditLogEntry) then) =
      _$AgentAuditLogEntryCopyWithImpl<$Res, AgentAuditLogEntry>;
  @useResult
  $Res call(
      {DateTime timestamp,
      String user,
      String action,
      Map<String, dynamic>? details});
}

/// @nodoc
class _$AgentAuditLogEntryCopyWithImpl<$Res, $Val extends AgentAuditLogEntry>
    implements $AgentAuditLogEntryCopyWith<$Res> {
  _$AgentAuditLogEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentAuditLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? user = null,
    Object? action = null,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgentAuditLogEntryImplCopyWith<$Res>
    implements $AgentAuditLogEntryCopyWith<$Res> {
  factory _$$AgentAuditLogEntryImplCopyWith(_$AgentAuditLogEntryImpl value,
          $Res Function(_$AgentAuditLogEntryImpl) then) =
      __$$AgentAuditLogEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime timestamp,
      String user,
      String action,
      Map<String, dynamic>? details});
}

/// @nodoc
class __$$AgentAuditLogEntryImplCopyWithImpl<$Res>
    extends _$AgentAuditLogEntryCopyWithImpl<$Res, _$AgentAuditLogEntryImpl>
    implements _$$AgentAuditLogEntryImplCopyWith<$Res> {
  __$$AgentAuditLogEntryImplCopyWithImpl(_$AgentAuditLogEntryImpl _value,
      $Res Function(_$AgentAuditLogEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentAuditLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? user = null,
    Object? action = null,
    Object? details = freezed,
  }) {
    return _then(_$AgentAuditLogEntryImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentAuditLogEntryImpl implements _AgentAuditLogEntry {
  const _$AgentAuditLogEntryImpl(
      {required this.timestamp,
      required this.user,
      required this.action,
      final Map<String, dynamic>? details})
      : _details = details;

  factory _$AgentAuditLogEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentAuditLogEntryImplFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final String user;
  @override
  final String action;
  final Map<String, dynamic>? _details;
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
    return 'AgentAuditLogEntry(timestamp: $timestamp, user: $user, action: $action, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentAuditLogEntryImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, user, action,
      const DeepCollectionEquality().hash(_details));

  /// Create a copy of AgentAuditLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentAuditLogEntryImplCopyWith<_$AgentAuditLogEntryImpl> get copyWith =>
      __$$AgentAuditLogEntryImplCopyWithImpl<_$AgentAuditLogEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentAuditLogEntryImplToJson(
      this,
    );
  }
}

abstract class _AgentAuditLogEntry implements AgentAuditLogEntry {
  const factory _AgentAuditLogEntry(
      {required final DateTime timestamp,
      required final String user,
      required final String action,
      final Map<String, dynamic>? details}) = _$AgentAuditLogEntryImpl;

  factory _AgentAuditLogEntry.fromJson(Map<String, dynamic> json) =
      _$AgentAuditLogEntryImpl.fromJson;

  @override
  DateTime get timestamp;
  @override
  String get user;
  @override
  String get action;
  @override
  Map<String, dynamic>? get details;

  /// Create a copy of AgentAuditLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentAuditLogEntryImplCopyWith<_$AgentAuditLogEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
