// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submission_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubmissionFile _$SubmissionFileFromJson(Map<String, dynamic> json) {
  return _SubmissionFile.fromJson(json);
}

/// @nodoc
mixin _$SubmissionFile {
  String get file => throw _privateConstructorUsedError;
  String get s3Key => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;

  /// Serializes this SubmissionFile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubmissionFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubmissionFileCopyWith<SubmissionFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmissionFileCopyWith<$Res> {
  factory $SubmissionFileCopyWith(
          SubmissionFile value, $Res Function(SubmissionFile) then) =
      _$SubmissionFileCopyWithImpl<$Res, SubmissionFile>;
  @useResult
  $Res call({String file, String s3Key, @JsonKey(name: '_id') String id});
}

/// @nodoc
class _$SubmissionFileCopyWithImpl<$Res, $Val extends SubmissionFile>
    implements $SubmissionFileCopyWith<$Res> {
  _$SubmissionFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubmissionFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? s3Key = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      s3Key: null == s3Key
          ? _value.s3Key
          : s3Key // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmissionFileImplCopyWith<$Res>
    implements $SubmissionFileCopyWith<$Res> {
  factory _$$SubmissionFileImplCopyWith(_$SubmissionFileImpl value,
          $Res Function(_$SubmissionFileImpl) then) =
      __$$SubmissionFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String file, String s3Key, @JsonKey(name: '_id') String id});
}

/// @nodoc
class __$$SubmissionFileImplCopyWithImpl<$Res>
    extends _$SubmissionFileCopyWithImpl<$Res, _$SubmissionFileImpl>
    implements _$$SubmissionFileImplCopyWith<$Res> {
  __$$SubmissionFileImplCopyWithImpl(
      _$SubmissionFileImpl _value, $Res Function(_$SubmissionFileImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubmissionFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? s3Key = null,
    Object? id = null,
  }) {
    return _then(_$SubmissionFileImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      s3Key: null == s3Key
          ? _value.s3Key
          : s3Key // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmissionFileImpl implements _SubmissionFile {
  const _$SubmissionFileImpl(
      {required this.file,
      required this.s3Key,
      @JsonKey(name: '_id') required this.id});

  factory _$SubmissionFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmissionFileImplFromJson(json);

  @override
  final String file;
  @override
  final String s3Key;
  @override
  @JsonKey(name: '_id')
  final String id;

  @override
  String toString() {
    return 'SubmissionFile(file: $file, s3Key: $s3Key, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmissionFileImpl &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.s3Key, s3Key) || other.s3Key == s3Key) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, file, s3Key, id);

  /// Create a copy of SubmissionFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmissionFileImplCopyWith<_$SubmissionFileImpl> get copyWith =>
      __$$SubmissionFileImplCopyWithImpl<_$SubmissionFileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmissionFileImplToJson(
      this,
    );
  }
}

abstract class _SubmissionFile implements SubmissionFile {
  const factory _SubmissionFile(
      {required final String file,
      required final String s3Key,
      @JsonKey(name: '_id') required final String id}) = _$SubmissionFileImpl;

  factory _SubmissionFile.fromJson(Map<String, dynamic> json) =
      _$SubmissionFileImpl.fromJson;

  @override
  String get file;
  @override
  String get s3Key;
  @override
  @JsonKey(name: '_id')
  String get id;

  /// Create a copy of SubmissionFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmissionFileImplCopyWith<_$SubmissionFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
