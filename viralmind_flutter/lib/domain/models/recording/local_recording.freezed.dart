// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_recording.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocalRecording _$LocalRecordingFromJson(Map<String, dynamic> json) {
  return _LocalRecording.fromJson(json);
}

/// @nodoc
mixin _$LocalRecording {
  String get id => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  int get durationSeconds => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  String get arch => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  MonitorInfo get primaryMonitor => throw _privateConstructorUsedError;
  Quest? get quest => throw _privateConstructorUsedError;
  SubmissionStatus? get submission => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  /// Serializes this LocalRecording to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalRecording
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalRecordingCopyWith<LocalRecording> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalRecordingCopyWith<$Res> {
  factory $LocalRecordingCopyWith(
          LocalRecording value, $Res Function(LocalRecording) then) =
      _$LocalRecordingCopyWithImpl<$Res, LocalRecording>;
  @useResult
  $Res call(
      {String id,
      String timestamp,
      int durationSeconds,
      String status,
      String title,
      String description,
      String platform,
      String arch,
      String version,
      String locale,
      MonitorInfo primaryMonitor,
      Quest? quest,
      SubmissionStatus? submission,
      String? location});

  $MonitorInfoCopyWith<$Res> get primaryMonitor;
  $QuestCopyWith<$Res>? get quest;
  $SubmissionStatusCopyWith<$Res>? get submission;
}

/// @nodoc
class _$LocalRecordingCopyWithImpl<$Res, $Val extends LocalRecording>
    implements $LocalRecordingCopyWith<$Res> {
  _$LocalRecordingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalRecording
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? durationSeconds = null,
    Object? status = null,
    Object? title = null,
    Object? description = null,
    Object? platform = null,
    Object? arch = null,
    Object? version = null,
    Object? locale = null,
    Object? primaryMonitor = null,
    Object? quest = freezed,
    Object? submission = freezed,
    Object? location = freezed,
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
      primaryMonitor: null == primaryMonitor
          ? _value.primaryMonitor
          : primaryMonitor // ignore: cast_nullable_to_non_nullable
              as MonitorInfo,
      quest: freezed == quest
          ? _value.quest
          : quest // ignore: cast_nullable_to_non_nullable
              as Quest?,
      submission: freezed == submission
          ? _value.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as SubmissionStatus?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of LocalRecording
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MonitorInfoCopyWith<$Res> get primaryMonitor {
    return $MonitorInfoCopyWith<$Res>(_value.primaryMonitor, (value) {
      return _then(_value.copyWith(primaryMonitor: value) as $Val);
    });
  }

  /// Create a copy of LocalRecording
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestCopyWith<$Res>? get quest {
    if (_value.quest == null) {
      return null;
    }

    return $QuestCopyWith<$Res>(_value.quest!, (value) {
      return _then(_value.copyWith(quest: value) as $Val);
    });
  }

  /// Create a copy of LocalRecording
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubmissionStatusCopyWith<$Res>? get submission {
    if (_value.submission == null) {
      return null;
    }

    return $SubmissionStatusCopyWith<$Res>(_value.submission!, (value) {
      return _then(_value.copyWith(submission: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocalRecordingImplCopyWith<$Res>
    implements $LocalRecordingCopyWith<$Res> {
  factory _$$LocalRecordingImplCopyWith(_$LocalRecordingImpl value,
          $Res Function(_$LocalRecordingImpl) then) =
      __$$LocalRecordingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String timestamp,
      int durationSeconds,
      String status,
      String title,
      String description,
      String platform,
      String arch,
      String version,
      String locale,
      MonitorInfo primaryMonitor,
      Quest? quest,
      SubmissionStatus? submission,
      String? location});

  @override
  $MonitorInfoCopyWith<$Res> get primaryMonitor;
  @override
  $QuestCopyWith<$Res>? get quest;
  @override
  $SubmissionStatusCopyWith<$Res>? get submission;
}

/// @nodoc
class __$$LocalRecordingImplCopyWithImpl<$Res>
    extends _$LocalRecordingCopyWithImpl<$Res, _$LocalRecordingImpl>
    implements _$$LocalRecordingImplCopyWith<$Res> {
  __$$LocalRecordingImplCopyWithImpl(
      _$LocalRecordingImpl _value, $Res Function(_$LocalRecordingImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalRecording
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? durationSeconds = null,
    Object? status = null,
    Object? title = null,
    Object? description = null,
    Object? platform = null,
    Object? arch = null,
    Object? version = null,
    Object? locale = null,
    Object? primaryMonitor = null,
    Object? quest = freezed,
    Object? submission = freezed,
    Object? location = freezed,
  }) {
    return _then(_$LocalRecordingImpl(
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
      primaryMonitor: null == primaryMonitor
          ? _value.primaryMonitor
          : primaryMonitor // ignore: cast_nullable_to_non_nullable
              as MonitorInfo,
      quest: freezed == quest
          ? _value.quest
          : quest // ignore: cast_nullable_to_non_nullable
              as Quest?,
      submission: freezed == submission
          ? _value.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as SubmissionStatus?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalRecordingImpl implements _LocalRecording {
  const _$LocalRecordingImpl(
      {required this.id,
      required this.timestamp,
      required this.durationSeconds,
      required this.status,
      required this.title,
      required this.description,
      required this.platform,
      required this.arch,
      required this.version,
      required this.locale,
      required this.primaryMonitor,
      this.quest,
      this.submission,
      this.location});

  factory _$LocalRecordingImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalRecordingImplFromJson(json);

  @override
  final String id;
  @override
  final String timestamp;
  @override
  final int durationSeconds;
  @override
  final String status;
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
  final MonitorInfo primaryMonitor;
  @override
  final Quest? quest;
  @override
  final SubmissionStatus? submission;
  @override
  final String? location;

  @override
  String toString() {
    return 'LocalRecording(id: $id, timestamp: $timestamp, durationSeconds: $durationSeconds, status: $status, title: $title, description: $description, platform: $platform, arch: $arch, version: $version, locale: $locale, primaryMonitor: $primaryMonitor, quest: $quest, submission: $submission, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalRecordingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.arch, arch) || other.arch == arch) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.primaryMonitor, primaryMonitor) ||
                other.primaryMonitor == primaryMonitor) &&
            (identical(other.quest, quest) || other.quest == quest) &&
            (identical(other.submission, submission) ||
                other.submission == submission) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      timestamp,
      durationSeconds,
      status,
      title,
      description,
      platform,
      arch,
      version,
      locale,
      primaryMonitor,
      quest,
      submission,
      location);

  /// Create a copy of LocalRecording
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalRecordingImplCopyWith<_$LocalRecordingImpl> get copyWith =>
      __$$LocalRecordingImplCopyWithImpl<_$LocalRecordingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalRecordingImplToJson(
      this,
    );
  }
}

abstract class _LocalRecording implements LocalRecording {
  const factory _LocalRecording(
      {required final String id,
      required final String timestamp,
      required final int durationSeconds,
      required final String status,
      required final String title,
      required final String description,
      required final String platform,
      required final String arch,
      required final String version,
      required final String locale,
      required final MonitorInfo primaryMonitor,
      final Quest? quest,
      final SubmissionStatus? submission,
      final String? location}) = _$LocalRecordingImpl;

  factory _LocalRecording.fromJson(Map<String, dynamic> json) =
      _$LocalRecordingImpl.fromJson;

  @override
  String get id;
  @override
  String get timestamp;
  @override
  int get durationSeconds;
  @override
  String get status;
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
  MonitorInfo get primaryMonitor;
  @override
  Quest? get quest;
  @override
  SubmissionStatus? get submission;
  @override
  String? get location;

  /// Create a copy of LocalRecording
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalRecordingImplCopyWith<_$LocalRecordingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
