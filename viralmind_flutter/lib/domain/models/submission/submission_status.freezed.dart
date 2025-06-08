// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submission_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubmissionStatus _$SubmissionStatusFromJson(Map<String, dynamic> json) {
  return _SubmissionStatus.fromJson(json);
}

/// @nodoc
mixin _$SubmissionStatus {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  SubmissionMeta get meta => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<SubmissionFile> get files => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  int get clampedScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'grade_result')
  GradeResult get gradeResult => throw _privateConstructorUsedError;
  int get maxReward => throw _privateConstructorUsedError;
  int get reward => throw _privateConstructorUsedError;
  TreasuryTransfer? get treasuryTransfer => throw _privateConstructorUsedError;

  /// Serializes this SubmissionStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubmissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubmissionStatusCopyWith<SubmissionStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmissionStatusCopyWith<$Res> {
  factory $SubmissionStatusCopyWith(
          SubmissionStatus value, $Res Function(SubmissionStatus) then) =
      _$SubmissionStatusCopyWithImpl<$Res, SubmissionStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String address,
      SubmissionMeta meta,
      String status,
      List<SubmissionFile> files,
      String? error,
      String createdAt,
      String updatedAt,
      int clampedScore,
      @JsonKey(name: 'grade_result') GradeResult gradeResult,
      int maxReward,
      int reward,
      TreasuryTransfer? treasuryTransfer});

  $SubmissionMetaCopyWith<$Res> get meta;
  $GradeResultCopyWith<$Res> get gradeResult;
  $TreasuryTransferCopyWith<$Res>? get treasuryTransfer;
}

/// @nodoc
class _$SubmissionStatusCopyWithImpl<$Res, $Val extends SubmissionStatus>
    implements $SubmissionStatusCopyWith<$Res> {
  _$SubmissionStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubmissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
    Object? meta = null,
    Object? status = null,
    Object? files = null,
    Object? error = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? clampedScore = null,
    Object? gradeResult = null,
    Object? maxReward = null,
    Object? reward = null,
    Object? treasuryTransfer = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as SubmissionMeta,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<SubmissionFile>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      clampedScore: null == clampedScore
          ? _value.clampedScore
          : clampedScore // ignore: cast_nullable_to_non_nullable
              as int,
      gradeResult: null == gradeResult
          ? _value.gradeResult
          : gradeResult // ignore: cast_nullable_to_non_nullable
              as GradeResult,
      maxReward: null == maxReward
          ? _value.maxReward
          : maxReward // ignore: cast_nullable_to_non_nullable
              as int,
      reward: null == reward
          ? _value.reward
          : reward // ignore: cast_nullable_to_non_nullable
              as int,
      treasuryTransfer: freezed == treasuryTransfer
          ? _value.treasuryTransfer
          : treasuryTransfer // ignore: cast_nullable_to_non_nullable
              as TreasuryTransfer?,
    ) as $Val);
  }

  /// Create a copy of SubmissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubmissionMetaCopyWith<$Res> get meta {
    return $SubmissionMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of SubmissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GradeResultCopyWith<$Res> get gradeResult {
    return $GradeResultCopyWith<$Res>(_value.gradeResult, (value) {
      return _then(_value.copyWith(gradeResult: value) as $Val);
    });
  }

  /// Create a copy of SubmissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TreasuryTransferCopyWith<$Res>? get treasuryTransfer {
    if (_value.treasuryTransfer == null) {
      return null;
    }

    return $TreasuryTransferCopyWith<$Res>(_value.treasuryTransfer!, (value) {
      return _then(_value.copyWith(treasuryTransfer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubmissionStatusImplCopyWith<$Res>
    implements $SubmissionStatusCopyWith<$Res> {
  factory _$$SubmissionStatusImplCopyWith(_$SubmissionStatusImpl value,
          $Res Function(_$SubmissionStatusImpl) then) =
      __$$SubmissionStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String address,
      SubmissionMeta meta,
      String status,
      List<SubmissionFile> files,
      String? error,
      String createdAt,
      String updatedAt,
      int clampedScore,
      @JsonKey(name: 'grade_result') GradeResult gradeResult,
      int maxReward,
      int reward,
      TreasuryTransfer? treasuryTransfer});

  @override
  $SubmissionMetaCopyWith<$Res> get meta;
  @override
  $GradeResultCopyWith<$Res> get gradeResult;
  @override
  $TreasuryTransferCopyWith<$Res>? get treasuryTransfer;
}

/// @nodoc
class __$$SubmissionStatusImplCopyWithImpl<$Res>
    extends _$SubmissionStatusCopyWithImpl<$Res, _$SubmissionStatusImpl>
    implements _$$SubmissionStatusImplCopyWith<$Res> {
  __$$SubmissionStatusImplCopyWithImpl(_$SubmissionStatusImpl _value,
      $Res Function(_$SubmissionStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubmissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
    Object? meta = null,
    Object? status = null,
    Object? files = null,
    Object? error = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? clampedScore = null,
    Object? gradeResult = null,
    Object? maxReward = null,
    Object? reward = null,
    Object? treasuryTransfer = freezed,
  }) {
    return _then(_$SubmissionStatusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as SubmissionMeta,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<SubmissionFile>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      clampedScore: null == clampedScore
          ? _value.clampedScore
          : clampedScore // ignore: cast_nullable_to_non_nullable
              as int,
      gradeResult: null == gradeResult
          ? _value.gradeResult
          : gradeResult // ignore: cast_nullable_to_non_nullable
              as GradeResult,
      maxReward: null == maxReward
          ? _value.maxReward
          : maxReward // ignore: cast_nullable_to_non_nullable
              as int,
      reward: null == reward
          ? _value.reward
          : reward // ignore: cast_nullable_to_non_nullable
              as int,
      treasuryTransfer: freezed == treasuryTransfer
          ? _value.treasuryTransfer
          : treasuryTransfer // ignore: cast_nullable_to_non_nullable
              as TreasuryTransfer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmissionStatusImpl implements _SubmissionStatus {
  const _$SubmissionStatusImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.address,
      required this.meta,
      required this.status,
      required final List<SubmissionFile> files,
      this.error,
      required this.createdAt,
      required this.updatedAt,
      required this.clampedScore,
      @JsonKey(name: 'grade_result') required this.gradeResult,
      required this.maxReward,
      required this.reward,
      this.treasuryTransfer})
      : _files = files;

  factory _$SubmissionStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmissionStatusImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String address;
  @override
  final SubmissionMeta meta;
  @override
  final String status;
  final List<SubmissionFile> _files;
  @override
  List<SubmissionFile> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  final String? error;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final int clampedScore;
  @override
  @JsonKey(name: 'grade_result')
  final GradeResult gradeResult;
  @override
  final int maxReward;
  @override
  final int reward;
  @override
  final TreasuryTransfer? treasuryTransfer;

  @override
  String toString() {
    return 'SubmissionStatus(id: $id, address: $address, meta: $meta, status: $status, files: $files, error: $error, createdAt: $createdAt, updatedAt: $updatedAt, clampedScore: $clampedScore, gradeResult: $gradeResult, maxReward: $maxReward, reward: $reward, treasuryTransfer: $treasuryTransfer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmissionStatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.clampedScore, clampedScore) ||
                other.clampedScore == clampedScore) &&
            (identical(other.gradeResult, gradeResult) ||
                other.gradeResult == gradeResult) &&
            (identical(other.maxReward, maxReward) ||
                other.maxReward == maxReward) &&
            (identical(other.reward, reward) || other.reward == reward) &&
            (identical(other.treasuryTransfer, treasuryTransfer) ||
                other.treasuryTransfer == treasuryTransfer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      address,
      meta,
      status,
      const DeepCollectionEquality().hash(_files),
      error,
      createdAt,
      updatedAt,
      clampedScore,
      gradeResult,
      maxReward,
      reward,
      treasuryTransfer);

  /// Create a copy of SubmissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmissionStatusImplCopyWith<_$SubmissionStatusImpl> get copyWith =>
      __$$SubmissionStatusImplCopyWithImpl<_$SubmissionStatusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmissionStatusImplToJson(
      this,
    );
  }
}

abstract class _SubmissionStatus implements SubmissionStatus {
  const factory _SubmissionStatus(
      {@JsonKey(name: '_id') required final String id,
      required final String address,
      required final SubmissionMeta meta,
      required final String status,
      required final List<SubmissionFile> files,
      final String? error,
      required final String createdAt,
      required final String updatedAt,
      required final int clampedScore,
      @JsonKey(name: 'grade_result') required final GradeResult gradeResult,
      required final int maxReward,
      required final int reward,
      final TreasuryTransfer? treasuryTransfer}) = _$SubmissionStatusImpl;

  factory _SubmissionStatus.fromJson(Map<String, dynamic> json) =
      _$SubmissionStatusImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get address;
  @override
  SubmissionMeta get meta;
  @override
  String get status;
  @override
  List<SubmissionFile> get files;
  @override
  String? get error;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  int get clampedScore;
  @override
  @JsonKey(name: 'grade_result')
  GradeResult get gradeResult;
  @override
  int get maxReward;
  @override
  int get reward;
  @override
  TreasuryTransfer? get treasuryTransfer;

  /// Create a copy of SubmissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmissionStatusImplCopyWith<_$SubmissionStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
