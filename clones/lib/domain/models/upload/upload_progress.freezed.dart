// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadProgress _$UploadProgressFromJson(Map<String, dynamic> json) {
  return _UploadProgress.fromJson(json);
}

/// @nodoc
mixin _$UploadProgress {
  String get uploadId => throw _privateConstructorUsedError;
  int get chunkIndex => throw _privateConstructorUsedError;
  int get received => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;

  /// Serializes this UploadProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadProgressCopyWith<UploadProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadProgressCopyWith<$Res> {
  factory $UploadProgressCopyWith(
          UploadProgress value, $Res Function(UploadProgress) then) =
      _$UploadProgressCopyWithImpl<$Res, UploadProgress>;
  @useResult
  $Res call(
      {String uploadId,
      int chunkIndex,
      int received,
      int total,
      double progress});
}

/// @nodoc
class _$UploadProgressCopyWithImpl<$Res, $Val extends UploadProgress>
    implements $UploadProgressCopyWith<$Res> {
  _$UploadProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uploadId = null,
    Object? chunkIndex = null,
    Object? received = null,
    Object? total = null,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      uploadId: null == uploadId
          ? _value.uploadId
          : uploadId // ignore: cast_nullable_to_non_nullable
              as String,
      chunkIndex: null == chunkIndex
          ? _value.chunkIndex
          : chunkIndex // ignore: cast_nullable_to_non_nullable
              as int,
      received: null == received
          ? _value.received
          : received // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadProgressImplCopyWith<$Res>
    implements $UploadProgressCopyWith<$Res> {
  factory _$$UploadProgressImplCopyWith(_$UploadProgressImpl value,
          $Res Function(_$UploadProgressImpl) then) =
      __$$UploadProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uploadId,
      int chunkIndex,
      int received,
      int total,
      double progress});
}

/// @nodoc
class __$$UploadProgressImplCopyWithImpl<$Res>
    extends _$UploadProgressCopyWithImpl<$Res, _$UploadProgressImpl>
    implements _$$UploadProgressImplCopyWith<$Res> {
  __$$UploadProgressImplCopyWithImpl(
      _$UploadProgressImpl _value, $Res Function(_$UploadProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uploadId = null,
    Object? chunkIndex = null,
    Object? received = null,
    Object? total = null,
    Object? progress = null,
  }) {
    return _then(_$UploadProgressImpl(
      uploadId: null == uploadId
          ? _value.uploadId
          : uploadId // ignore: cast_nullable_to_non_nullable
              as String,
      chunkIndex: null == chunkIndex
          ? _value.chunkIndex
          : chunkIndex // ignore: cast_nullable_to_non_nullable
              as int,
      received: null == received
          ? _value.received
          : received // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadProgressImpl implements _UploadProgress {
  const _$UploadProgressImpl(
      {required this.uploadId,
      required this.chunkIndex,
      required this.received,
      required this.total,
      required this.progress});

  factory _$UploadProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadProgressImplFromJson(json);

  @override
  final String uploadId;
  @override
  final int chunkIndex;
  @override
  final int received;
  @override
  final int total;
  @override
  final double progress;

  @override
  String toString() {
    return 'UploadProgress(uploadId: $uploadId, chunkIndex: $chunkIndex, received: $received, total: $total, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadProgressImpl &&
            (identical(other.uploadId, uploadId) ||
                other.uploadId == uploadId) &&
            (identical(other.chunkIndex, chunkIndex) ||
                other.chunkIndex == chunkIndex) &&
            (identical(other.received, received) ||
                other.received == received) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uploadId, chunkIndex, received, total, progress);

  /// Create a copy of UploadProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadProgressImplCopyWith<_$UploadProgressImpl> get copyWith =>
      __$$UploadProgressImplCopyWithImpl<_$UploadProgressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadProgressImplToJson(
      this,
    );
  }
}

abstract class _UploadProgress implements UploadProgress {
  const factory _UploadProgress(
      {required final String uploadId,
      required final int chunkIndex,
      required final int received,
      required final int total,
      required final double progress}) = _$UploadProgressImpl;

  factory _UploadProgress.fromJson(Map<String, dynamic> json) =
      _$UploadProgressImpl.fromJson;

  @override
  String get uploadId;
  @override
  int get chunkIndex;
  @override
  int get received;
  @override
  int get total;
  @override
  double get progress;

  /// Create a copy of UploadProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadProgressImplCopyWith<_$UploadProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
