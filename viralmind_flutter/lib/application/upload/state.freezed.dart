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
mixin _$UploadTaskState {
  String get recordingId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  UploadStatus get uploadStatus => throw _privateConstructorUsedError;
  int get totalBytes => throw _privateConstructorUsedError;
  int get uploadedBytes => throw _privateConstructorUsedError;
  String? get uploadId => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of UploadTaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadTaskStateCopyWith<UploadTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadTaskStateCopyWith<$Res> {
  factory $UploadTaskStateCopyWith(
          UploadTaskState value, $Res Function(UploadTaskState) then) =
      _$UploadTaskStateCopyWithImpl<$Res, UploadTaskState>;
  @useResult
  $Res call(
      {String recordingId,
      String? name,
      UploadStatus uploadStatus,
      int totalBytes,
      int uploadedBytes,
      String? uploadId,
      String? error});
}

/// @nodoc
class _$UploadTaskStateCopyWithImpl<$Res, $Val extends UploadTaskState>
    implements $UploadTaskStateCopyWith<$Res> {
  _$UploadTaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadTaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordingId = null,
    Object? name = freezed,
    Object? uploadStatus = null,
    Object? totalBytes = null,
    Object? uploadedBytes = null,
    Object? uploadId = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      recordingId: null == recordingId
          ? _value.recordingId
          : recordingId // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadStatus: null == uploadStatus
          ? _value.uploadStatus
          : uploadStatus // ignore: cast_nullable_to_non_nullable
              as UploadStatus,
      totalBytes: null == totalBytes
          ? _value.totalBytes
          : totalBytes // ignore: cast_nullable_to_non_nullable
              as int,
      uploadedBytes: null == uploadedBytes
          ? _value.uploadedBytes
          : uploadedBytes // ignore: cast_nullable_to_non_nullable
              as int,
      uploadId: freezed == uploadId
          ? _value.uploadId
          : uploadId // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadTaskStateImplCopyWith<$Res>
    implements $UploadTaskStateCopyWith<$Res> {
  factory _$$UploadTaskStateImplCopyWith(_$UploadTaskStateImpl value,
          $Res Function(_$UploadTaskStateImpl) then) =
      __$$UploadTaskStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String recordingId,
      String? name,
      UploadStatus uploadStatus,
      int totalBytes,
      int uploadedBytes,
      String? uploadId,
      String? error});
}

/// @nodoc
class __$$UploadTaskStateImplCopyWithImpl<$Res>
    extends _$UploadTaskStateCopyWithImpl<$Res, _$UploadTaskStateImpl>
    implements _$$UploadTaskStateImplCopyWith<$Res> {
  __$$UploadTaskStateImplCopyWithImpl(
      _$UploadTaskStateImpl _value, $Res Function(_$UploadTaskStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadTaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordingId = null,
    Object? name = freezed,
    Object? uploadStatus = null,
    Object? totalBytes = null,
    Object? uploadedBytes = null,
    Object? uploadId = freezed,
    Object? error = freezed,
  }) {
    return _then(_$UploadTaskStateImpl(
      recordingId: null == recordingId
          ? _value.recordingId
          : recordingId // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadStatus: null == uploadStatus
          ? _value.uploadStatus
          : uploadStatus // ignore: cast_nullable_to_non_nullable
              as UploadStatus,
      totalBytes: null == totalBytes
          ? _value.totalBytes
          : totalBytes // ignore: cast_nullable_to_non_nullable
              as int,
      uploadedBytes: null == uploadedBytes
          ? _value.uploadedBytes
          : uploadedBytes // ignore: cast_nullable_to_non_nullable
              as int,
      uploadId: freezed == uploadId
          ? _value.uploadId
          : uploadId // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UploadTaskStateImpl extends _UploadTaskState {
  const _$UploadTaskStateImpl(
      {required this.recordingId,
      this.name,
      required this.uploadStatus,
      this.totalBytes = 0,
      this.uploadedBytes = 0,
      this.uploadId,
      this.error})
      : super._();

  @override
  final String recordingId;
  @override
  final String? name;
  @override
  final UploadStatus uploadStatus;
  @override
  @JsonKey()
  final int totalBytes;
  @override
  @JsonKey()
  final int uploadedBytes;
  @override
  final String? uploadId;
  @override
  final String? error;

  @override
  String toString() {
    return 'UploadTaskState(recordingId: $recordingId, name: $name, uploadStatus: $uploadStatus, totalBytes: $totalBytes, uploadedBytes: $uploadedBytes, uploadId: $uploadId, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadTaskStateImpl &&
            (identical(other.recordingId, recordingId) ||
                other.recordingId == recordingId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uploadStatus, uploadStatus) ||
                other.uploadStatus == uploadStatus) &&
            (identical(other.totalBytes, totalBytes) ||
                other.totalBytes == totalBytes) &&
            (identical(other.uploadedBytes, uploadedBytes) ||
                other.uploadedBytes == uploadedBytes) &&
            (identical(other.uploadId, uploadId) ||
                other.uploadId == uploadId) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recordingId, name, uploadStatus,
      totalBytes, uploadedBytes, uploadId, error);

  /// Create a copy of UploadTaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadTaskStateImplCopyWith<_$UploadTaskStateImpl> get copyWith =>
      __$$UploadTaskStateImplCopyWithImpl<_$UploadTaskStateImpl>(
          this, _$identity);
}

abstract class _UploadTaskState extends UploadTaskState {
  const factory _UploadTaskState(
      {required final String recordingId,
      final String? name,
      required final UploadStatus uploadStatus,
      final int totalBytes,
      final int uploadedBytes,
      final String? uploadId,
      final String? error}) = _$UploadTaskStateImpl;
  const _UploadTaskState._() : super._();

  @override
  String get recordingId;
  @override
  String? get name;
  @override
  UploadStatus get uploadStatus;
  @override
  int get totalBytes;
  @override
  int get uploadedBytes;
  @override
  String? get uploadId;
  @override
  String? get error;

  /// Create a copy of UploadTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadTaskStateImplCopyWith<_$UploadTaskStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
