// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deployment_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeploymentVersion _$DeploymentVersionFromJson(Map<String, dynamic> json) {
  return _DeploymentVersion.fromJson(json);
}

/// @nodoc
mixin _$DeploymentVersion {
  String get versionTag => throw _privateConstructorUsedError;
  String? get customUrl => throw _privateConstructorUsedError;
  String? get encryptedApiKey => throw _privateConstructorUsedError;
  DeploymentVersionStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DeploymentVersion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeploymentVersion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeploymentVersionCopyWith<DeploymentVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeploymentVersionCopyWith<$Res> {
  factory $DeploymentVersionCopyWith(
          DeploymentVersion value, $Res Function(DeploymentVersion) then) =
      _$DeploymentVersionCopyWithImpl<$Res, DeploymentVersion>;
  @useResult
  $Res call(
      {String versionTag,
      String? customUrl,
      String? encryptedApiKey,
      DeploymentVersionStatus status,
      DateTime createdAt});
}

/// @nodoc
class _$DeploymentVersionCopyWithImpl<$Res, $Val extends DeploymentVersion>
    implements $DeploymentVersionCopyWith<$Res> {
  _$DeploymentVersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeploymentVersion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionTag = null,
    Object? customUrl = freezed,
    Object? encryptedApiKey = freezed,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      versionTag: null == versionTag
          ? _value.versionTag
          : versionTag // ignore: cast_nullable_to_non_nullable
              as String,
      customUrl: freezed == customUrl
          ? _value.customUrl
          : customUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      encryptedApiKey: freezed == encryptedApiKey
          ? _value.encryptedApiKey
          : encryptedApiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeploymentVersionStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeploymentVersionImplCopyWith<$Res>
    implements $DeploymentVersionCopyWith<$Res> {
  factory _$$DeploymentVersionImplCopyWith(_$DeploymentVersionImpl value,
          $Res Function(_$DeploymentVersionImpl) then) =
      __$$DeploymentVersionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String versionTag,
      String? customUrl,
      String? encryptedApiKey,
      DeploymentVersionStatus status,
      DateTime createdAt});
}

/// @nodoc
class __$$DeploymentVersionImplCopyWithImpl<$Res>
    extends _$DeploymentVersionCopyWithImpl<$Res, _$DeploymentVersionImpl>
    implements _$$DeploymentVersionImplCopyWith<$Res> {
  __$$DeploymentVersionImplCopyWithImpl(_$DeploymentVersionImpl _value,
      $Res Function(_$DeploymentVersionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeploymentVersion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionTag = null,
    Object? customUrl = freezed,
    Object? encryptedApiKey = freezed,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_$DeploymentVersionImpl(
      versionTag: null == versionTag
          ? _value.versionTag
          : versionTag // ignore: cast_nullable_to_non_nullable
              as String,
      customUrl: freezed == customUrl
          ? _value.customUrl
          : customUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      encryptedApiKey: freezed == encryptedApiKey
          ? _value.encryptedApiKey
          : encryptedApiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeploymentVersionStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeploymentVersionImpl implements _DeploymentVersion {
  const _$DeploymentVersionImpl(
      {required this.versionTag,
      this.customUrl,
      this.encryptedApiKey,
      required this.status,
      required this.createdAt});

  factory _$DeploymentVersionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeploymentVersionImplFromJson(json);

  @override
  final String versionTag;
  @override
  final String? customUrl;
  @override
  final String? encryptedApiKey;
  @override
  final DeploymentVersionStatus status;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'DeploymentVersion(versionTag: $versionTag, customUrl: $customUrl, encryptedApiKey: $encryptedApiKey, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeploymentVersionImpl &&
            (identical(other.versionTag, versionTag) ||
                other.versionTag == versionTag) &&
            (identical(other.customUrl, customUrl) ||
                other.customUrl == customUrl) &&
            (identical(other.encryptedApiKey, encryptedApiKey) ||
                other.encryptedApiKey == encryptedApiKey) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, versionTag, customUrl, encryptedApiKey, status, createdAt);

  /// Create a copy of DeploymentVersion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeploymentVersionImplCopyWith<_$DeploymentVersionImpl> get copyWith =>
      __$$DeploymentVersionImplCopyWithImpl<_$DeploymentVersionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeploymentVersionImplToJson(
      this,
    );
  }
}

abstract class _DeploymentVersion implements DeploymentVersion {
  const factory _DeploymentVersion(
      {required final String versionTag,
      final String? customUrl,
      final String? encryptedApiKey,
      required final DeploymentVersionStatus status,
      required final DateTime createdAt}) = _$DeploymentVersionImpl;

  factory _DeploymentVersion.fromJson(Map<String, dynamic> json) =
      _$DeploymentVersionImpl.fromJson;

  @override
  String get versionTag;
  @override
  String? get customUrl;
  @override
  String? get encryptedApiKey;
  @override
  DeploymentVersionStatus get status;
  @override
  DateTime get createdAt;

  /// Create a copy of DeploymentVersion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeploymentVersionImplCopyWith<_$DeploymentVersionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
