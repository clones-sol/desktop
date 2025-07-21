// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_invocation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgentInvocation _$AgentInvocationFromJson(Map<String, dynamic> json) {
  return _AgentInvocation.fromJson(json);
}

/// @nodoc
mixin _$AgentInvocation {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'agentId')
  String get agentId => throw _privateConstructorUsedError;
  String get versionTag => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  int get durationMs => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  int? get httpStatus => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AgentInvocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentInvocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentInvocationCopyWith<AgentInvocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentInvocationCopyWith<$Res> {
  factory $AgentInvocationCopyWith(
          AgentInvocation value, $Res Function(AgentInvocation) then) =
      _$AgentInvocationCopyWithImpl<$Res, AgentInvocation>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'agentId') String agentId,
      String versionTag,
      DateTime timestamp,
      int durationMs,
      bool isSuccess,
      int? httpStatus,
      DateTime? createdAt});
}

/// @nodoc
class _$AgentInvocationCopyWithImpl<$Res, $Val extends AgentInvocation>
    implements $AgentInvocationCopyWith<$Res> {
  _$AgentInvocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentInvocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? agentId = null,
    Object? versionTag = null,
    Object? timestamp = null,
    Object? durationMs = null,
    Object? isSuccess = null,
    Object? httpStatus = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      versionTag: null == versionTag
          ? _value.versionTag
          : versionTag // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMs: null == durationMs
          ? _value.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgentInvocationImplCopyWith<$Res>
    implements $AgentInvocationCopyWith<$Res> {
  factory _$$AgentInvocationImplCopyWith(_$AgentInvocationImpl value,
          $Res Function(_$AgentInvocationImpl) then) =
      __$$AgentInvocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'agentId') String agentId,
      String versionTag,
      DateTime timestamp,
      int durationMs,
      bool isSuccess,
      int? httpStatus,
      DateTime? createdAt});
}

/// @nodoc
class __$$AgentInvocationImplCopyWithImpl<$Res>
    extends _$AgentInvocationCopyWithImpl<$Res, _$AgentInvocationImpl>
    implements _$$AgentInvocationImplCopyWith<$Res> {
  __$$AgentInvocationImplCopyWithImpl(
      _$AgentInvocationImpl _value, $Res Function(_$AgentInvocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentInvocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? agentId = null,
    Object? versionTag = null,
    Object? timestamp = null,
    Object? durationMs = null,
    Object? isSuccess = null,
    Object? httpStatus = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$AgentInvocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      versionTag: null == versionTag
          ? _value.versionTag
          : versionTag // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMs: null == durationMs
          ? _value.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentInvocationImpl implements _AgentInvocation {
  const _$AgentInvocationImpl(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'agentId') required this.agentId,
      required this.versionTag,
      required this.timestamp,
      required this.durationMs,
      required this.isSuccess,
      this.httpStatus,
      this.createdAt});

  factory _$AgentInvocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentInvocationImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'agentId')
  final String agentId;
  @override
  final String versionTag;
  @override
  final DateTime timestamp;
  @override
  final int durationMs;
  @override
  final bool isSuccess;
  @override
  final int? httpStatus;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'AgentInvocation(id: $id, agentId: $agentId, versionTag: $versionTag, timestamp: $timestamp, durationMs: $durationMs, isSuccess: $isSuccess, httpStatus: $httpStatus, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentInvocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.agentId, agentId) || other.agentId == agentId) &&
            (identical(other.versionTag, versionTag) ||
                other.versionTag == versionTag) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.durationMs, durationMs) ||
                other.durationMs == durationMs) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.httpStatus, httpStatus) ||
                other.httpStatus == httpStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, agentId, versionTag,
      timestamp, durationMs, isSuccess, httpStatus, createdAt);

  /// Create a copy of AgentInvocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentInvocationImplCopyWith<_$AgentInvocationImpl> get copyWith =>
      __$$AgentInvocationImplCopyWithImpl<_$AgentInvocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentInvocationImplToJson(
      this,
    );
  }
}

abstract class _AgentInvocation implements AgentInvocation {
  const factory _AgentInvocation(
      {@JsonKey(name: '_id') required final String id,
      @JsonKey(name: 'agentId') required final String agentId,
      required final String versionTag,
      required final DateTime timestamp,
      required final int durationMs,
      required final bool isSuccess,
      final int? httpStatus,
      final DateTime? createdAt}) = _$AgentInvocationImpl;

  factory _AgentInvocation.fromJson(Map<String, dynamic> json) =
      _$AgentInvocationImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'agentId')
  String get agentId;
  @override
  String get versionTag;
  @override
  DateTime get timestamp;
  @override
  int get durationMs;
  @override
  bool get isSuccess;
  @override
  int? get httpStatus;
  @override
  DateTime? get createdAt;

  /// Create a copy of AgentInvocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentInvocationImplCopyWith<_$AgentInvocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
