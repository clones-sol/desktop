// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recording_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecordingMeta _$RecordingMetaFromJson(Map<String, dynamic> json) {
  return _RecordingMeta.fromJson(json);
}

/// @nodoc
mixin _$RecordingMeta {
  String get id => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_seconds')
  int get durationSeconds => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  String get arch => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  @JsonKey(name: 'quest')
  Demonstration get demonstration => throw _privateConstructorUsedError;
  @JsonKey(name: 'factory_id')
  String get factoryId => throw _privateConstructorUsedError;

  /// Serializes this RecordingMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecordingMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordingMetaCopyWith<RecordingMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordingMetaCopyWith<$Res> {
  factory $RecordingMetaCopyWith(
          RecordingMeta value, $Res Function(RecordingMeta) then) =
      _$RecordingMetaCopyWithImpl<$Res, RecordingMeta>;
  @useResult
  $Res call(
      {String id,
      String timestamp,
      @JsonKey(name: 'duration_seconds') int durationSeconds,
      String status,
      String? reason,
      String title,
      String description,
      String platform,
      String arch,
      String version,
      String locale,
      @JsonKey(name: 'quest') Demonstration demonstration,
      @JsonKey(name: 'factory_id') String factoryId});

  $DemonstrationCopyWith<$Res> get demonstration;
}

/// @nodoc
class _$RecordingMetaCopyWithImpl<$Res, $Val extends RecordingMeta>
    implements $RecordingMetaCopyWith<$Res> {
  _$RecordingMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordingMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? durationSeconds = null,
    Object? status = null,
    Object? reason = freezed,
    Object? title = null,
    Object? description = null,
    Object? platform = null,
    Object? arch = null,
    Object? version = null,
    Object? locale = null,
    Object? demonstration = null,
    Object? factoryId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      durationSeconds: null == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      arch: null == arch
          ? _value.arch
          : arch // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      demonstration: null == demonstration
          ? _value.demonstration
          : demonstration // ignore: cast_nullable_to_non_nullable
              as Demonstration,
      factoryId: null == factoryId
          ? _value.factoryId
          : factoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of RecordingMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DemonstrationCopyWith<$Res> get demonstration {
    return $DemonstrationCopyWith<$Res>(_value.demonstration, (value) {
      return _then(_value.copyWith(demonstration: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecordingMetaImplCopyWith<$Res>
    implements $RecordingMetaCopyWith<$Res> {
  factory _$$RecordingMetaImplCopyWith(
          _$RecordingMetaImpl value, $Res Function(_$RecordingMetaImpl) then) =
      __$$RecordingMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String timestamp,
      @JsonKey(name: 'duration_seconds') int durationSeconds,
      String status,
      String? reason,
      String title,
      String description,
      String platform,
      String arch,
      String version,
      String locale,
      @JsonKey(name: 'quest') Demonstration demonstration,
      @JsonKey(name: 'factory_id') String factoryId});

  @override
  $DemonstrationCopyWith<$Res> get demonstration;
}

/// @nodoc
class __$$RecordingMetaImplCopyWithImpl<$Res>
    extends _$RecordingMetaCopyWithImpl<$Res, _$RecordingMetaImpl>
    implements _$$RecordingMetaImplCopyWith<$Res> {
  __$$RecordingMetaImplCopyWithImpl(
      _$RecordingMetaImpl _value, $Res Function(_$RecordingMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordingMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? durationSeconds = null,
    Object? status = null,
    Object? reason = freezed,
    Object? title = null,
    Object? description = null,
    Object? platform = null,
    Object? arch = null,
    Object? version = null,
    Object? locale = null,
    Object? demonstration = null,
    Object? factoryId = null,
  }) {
    return _then(_$RecordingMetaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      durationSeconds: null == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      arch: null == arch
          ? _value.arch
          : arch // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      demonstration: null == demonstration
          ? _value.demonstration
          : demonstration // ignore: cast_nullable_to_non_nullable
              as Demonstration,
      factoryId: null == factoryId
          ? _value.factoryId
          : factoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecordingMetaImpl implements _RecordingMeta {
  const _$RecordingMetaImpl(
      {required this.id,
      required this.timestamp,
      @JsonKey(name: 'duration_seconds') required this.durationSeconds,
      required this.status,
      this.reason,
      required this.title,
      required this.description,
      required this.platform,
      required this.arch,
      required this.version,
      required this.locale,
      @JsonKey(name: 'quest') required this.demonstration,
      @JsonKey(name: 'factory_id') required this.factoryId});

  factory _$RecordingMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordingMetaImplFromJson(json);

  @override
  final String id;
  @override
  final String timestamp;
  @override
  @JsonKey(name: 'duration_seconds')
  final int durationSeconds;
  @override
  final String status;
  @override
  final String? reason;
  @override
  final String title;
  @override
  final String description;
  @override
  final String platform;
  @override
  final String arch;
  @override
  final String version;
  @override
  final String locale;
  @override
  @JsonKey(name: 'quest')
  final Demonstration demonstration;
  @override
  @JsonKey(name: 'factory_id')
  final String factoryId;

  @override
  String toString() {
    return 'RecordingMeta(id: $id, timestamp: $timestamp, durationSeconds: $durationSeconds, status: $status, reason: $reason, title: $title, description: $description, platform: $platform, arch: $arch, version: $version, locale: $locale, demonstration: $demonstration, factoryId: $factoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingMetaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.arch, arch) || other.arch == arch) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.demonstration, demonstration) ||
                other.demonstration == demonstration) &&
            (identical(other.factoryId, factoryId) ||
                other.factoryId == factoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      timestamp,
      durationSeconds,
      status,
      reason,
      title,
      description,
      platform,
      arch,
      version,
      locale,
      demonstration,
      factoryId);

  /// Create a copy of RecordingMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordingMetaImplCopyWith<_$RecordingMetaImpl> get copyWith =>
      __$$RecordingMetaImplCopyWithImpl<_$RecordingMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordingMetaImplToJson(
      this,
    );
  }
}

abstract class _RecordingMeta implements RecordingMeta {
  const factory _RecordingMeta(
          {required final String id,
          required final String timestamp,
          @JsonKey(name: 'duration_seconds') required final int durationSeconds,
          required final String status,
          final String? reason,
          required final String title,
          required final String description,
          required final String platform,
          required final String arch,
          required final String version,
          required final String locale,
          @JsonKey(name: 'quest') required final Demonstration demonstration,
          @JsonKey(name: 'factory_id') required final String factoryId}) =
      _$RecordingMetaImpl;

  factory _RecordingMeta.fromJson(Map<String, dynamic> json) =
      _$RecordingMetaImpl.fromJson;

  @override
  String get id;
  @override
  String get timestamp;
  @override
  @JsonKey(name: 'duration_seconds')
  int get durationSeconds;
  @override
  String get status;
  @override
  String? get reason;
  @override
  String get title;
  @override
  String get description;
  @override
  String get platform;
  @override
  String get arch;
  @override
  String get version;
  @override
  String get locale;
  @override
  @JsonKey(name: 'quest')
  Demonstration get demonstration;
  @override
  @JsonKey(name: 'factory_id')
  String get factoryId;

  /// Create a copy of RecordingMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordingMetaImplCopyWith<_$RecordingMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonitorInfo _$MonitorInfoFromJson(Map<String, dynamic> json) {
  return _MonitorInfo.fromJson(json);
}

/// @nodoc
mixin _$MonitorInfo {
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;

  /// Serializes this MonitorInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonitorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonitorInfoCopyWith<MonitorInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitorInfoCopyWith<$Res> {
  factory $MonitorInfoCopyWith(
          MonitorInfo value, $Res Function(MonitorInfo) then) =
      _$MonitorInfoCopyWithImpl<$Res, MonitorInfo>;
  @useResult
  $Res call({int width, int height});
}

/// @nodoc
class _$MonitorInfoCopyWithImpl<$Res, $Val extends MonitorInfo>
    implements $MonitorInfoCopyWith<$Res> {
  _$MonitorInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonitorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_value.copyWith(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonitorInfoImplCopyWith<$Res>
    implements $MonitorInfoCopyWith<$Res> {
  factory _$$MonitorInfoImplCopyWith(
          _$MonitorInfoImpl value, $Res Function(_$MonitorInfoImpl) then) =
      __$$MonitorInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int width, int height});
}

/// @nodoc
class __$$MonitorInfoImplCopyWithImpl<$Res>
    extends _$MonitorInfoCopyWithImpl<$Res, _$MonitorInfoImpl>
    implements _$$MonitorInfoImplCopyWith<$Res> {
  __$$MonitorInfoImplCopyWithImpl(
      _$MonitorInfoImpl _value, $Res Function(_$MonitorInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonitorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_$MonitorInfoImpl(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonitorInfoImpl implements _MonitorInfo {
  const _$MonitorInfoImpl({required this.width, required this.height});

  factory _$MonitorInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonitorInfoImplFromJson(json);

  @override
  final int width;
  @override
  final int height;

  @override
  String toString() {
    return 'MonitorInfo(width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonitorInfoImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, width, height);

  /// Create a copy of MonitorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonitorInfoImplCopyWith<_$MonitorInfoImpl> get copyWith =>
      __$$MonitorInfoImplCopyWithImpl<_$MonitorInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonitorInfoImplToJson(
      this,
    );
  }
}

abstract class _MonitorInfo implements MonitorInfo {
  const factory _MonitorInfo(
      {required final int width,
      required final int height}) = _$MonitorInfoImpl;

  factory _MonitorInfo.fromJson(Map<String, dynamic> json) =
      _$MonitorInfoImpl.fromJson;

  @override
  int get width;
  @override
  int get height;

  /// Create a copy of MonitorInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonitorInfoImplCopyWith<_$MonitorInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
