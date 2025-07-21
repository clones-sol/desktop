// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_deployment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgentDeployment _$AgentDeploymentFromJson(Map<String, dynamic> json) {
  return _AgentDeployment.fromJson(json);
}

/// @nodoc
mixin _$AgentDeployment {
  AgentDeploymentStatus get status => throw _privateConstructorUsedError;
  String? get lastError => throw _privateConstructorUsedError;
  int get consecutiveFailures => throw _privateConstructorUsedError;
  String? get activeVersionTag => throw _privateConstructorUsedError;
  List<DeploymentVersion> get versions => throw _privateConstructorUsedError;

  /// Serializes this AgentDeployment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentDeployment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentDeploymentCopyWith<AgentDeployment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentDeploymentCopyWith<$Res> {
  factory $AgentDeploymentCopyWith(
          AgentDeployment value, $Res Function(AgentDeployment) then) =
      _$AgentDeploymentCopyWithImpl<$Res, AgentDeployment>;
  @useResult
  $Res call(
      {AgentDeploymentStatus status,
      String? lastError,
      int consecutiveFailures,
      String? activeVersionTag,
      List<DeploymentVersion> versions});
}

/// @nodoc
class _$AgentDeploymentCopyWithImpl<$Res, $Val extends AgentDeployment>
    implements $AgentDeploymentCopyWith<$Res> {
  _$AgentDeploymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentDeployment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? lastError = freezed,
    Object? consecutiveFailures = null,
    Object? activeVersionTag = freezed,
    Object? versions = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AgentDeploymentStatus,
      lastError: freezed == lastError
          ? _value.lastError
          : lastError // ignore: cast_nullable_to_non_nullable
              as String?,
      consecutiveFailures: null == consecutiveFailures
          ? _value.consecutiveFailures
          : consecutiveFailures // ignore: cast_nullable_to_non_nullable
              as int,
      activeVersionTag: freezed == activeVersionTag
          ? _value.activeVersionTag
          : activeVersionTag // ignore: cast_nullable_to_non_nullable
              as String?,
      versions: null == versions
          ? _value.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<DeploymentVersion>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgentDeploymentImplCopyWith<$Res>
    implements $AgentDeploymentCopyWith<$Res> {
  factory _$$AgentDeploymentImplCopyWith(_$AgentDeploymentImpl value,
          $Res Function(_$AgentDeploymentImpl) then) =
      __$$AgentDeploymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AgentDeploymentStatus status,
      String? lastError,
      int consecutiveFailures,
      String? activeVersionTag,
      List<DeploymentVersion> versions});
}

/// @nodoc
class __$$AgentDeploymentImplCopyWithImpl<$Res>
    extends _$AgentDeploymentCopyWithImpl<$Res, _$AgentDeploymentImpl>
    implements _$$AgentDeploymentImplCopyWith<$Res> {
  __$$AgentDeploymentImplCopyWithImpl(
      _$AgentDeploymentImpl _value, $Res Function(_$AgentDeploymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentDeployment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? lastError = freezed,
    Object? consecutiveFailures = null,
    Object? activeVersionTag = freezed,
    Object? versions = null,
  }) {
    return _then(_$AgentDeploymentImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AgentDeploymentStatus,
      lastError: freezed == lastError
          ? _value.lastError
          : lastError // ignore: cast_nullable_to_non_nullable
              as String?,
      consecutiveFailures: null == consecutiveFailures
          ? _value.consecutiveFailures
          : consecutiveFailures // ignore: cast_nullable_to_non_nullable
              as int,
      activeVersionTag: freezed == activeVersionTag
          ? _value.activeVersionTag
          : activeVersionTag // ignore: cast_nullable_to_non_nullable
              as String?,
      versions: null == versions
          ? _value._versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<DeploymentVersion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentDeploymentImpl implements _AgentDeployment {
  const _$AgentDeploymentImpl(
      {required this.status,
      this.lastError,
      this.consecutiveFailures = 0,
      this.activeVersionTag,
      final List<DeploymentVersion> versions = const []})
      : _versions = versions;

  factory _$AgentDeploymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentDeploymentImplFromJson(json);

  @override
  final AgentDeploymentStatus status;
  @override
  final String? lastError;
  @override
  @JsonKey()
  final int consecutiveFailures;
  @override
  final String? activeVersionTag;
  final List<DeploymentVersion> _versions;
  @override
  @JsonKey()
  List<DeploymentVersion> get versions {
    if (_versions is EqualUnmodifiableListView) return _versions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_versions);
  }

  @override
  String toString() {
    return 'AgentDeployment(status: $status, lastError: $lastError, consecutiveFailures: $consecutiveFailures, activeVersionTag: $activeVersionTag, versions: $versions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentDeploymentImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastError, lastError) ||
                other.lastError == lastError) &&
            (identical(other.consecutiveFailures, consecutiveFailures) ||
                other.consecutiveFailures == consecutiveFailures) &&
            (identical(other.activeVersionTag, activeVersionTag) ||
                other.activeVersionTag == activeVersionTag) &&
            const DeepCollectionEquality().equals(other._versions, _versions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      lastError,
      consecutiveFailures,
      activeVersionTag,
      const DeepCollectionEquality().hash(_versions));

  /// Create a copy of AgentDeployment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentDeploymentImplCopyWith<_$AgentDeploymentImpl> get copyWith =>
      __$$AgentDeploymentImplCopyWithImpl<_$AgentDeploymentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentDeploymentImplToJson(
      this,
    );
  }
}

abstract class _AgentDeployment implements AgentDeployment {
  const factory _AgentDeployment(
      {required final AgentDeploymentStatus status,
      final String? lastError,
      final int consecutiveFailures,
      final String? activeVersionTag,
      final List<DeploymentVersion> versions}) = _$AgentDeploymentImpl;

  factory _AgentDeployment.fromJson(Map<String, dynamic> json) =
      _$AgentDeploymentImpl.fromJson;

  @override
  AgentDeploymentStatus get status;
  @override
  String? get lastError;
  @override
  int get consecutiveFailures;
  @override
  String? get activeVersionTag;
  @override
  List<DeploymentVersion> get versions;

  /// Create a copy of AgentDeployment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentDeploymentImplCopyWith<_$AgentDeploymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
