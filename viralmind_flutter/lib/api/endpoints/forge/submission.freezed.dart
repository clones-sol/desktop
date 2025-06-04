// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PoolSubmission _$PoolSubmissionFromJson(Map<String, dynamic> json) {
  return _PoolSubmission.fromJson(json);
}

/// @nodoc
mixin _$PoolSubmission {
  String get id => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  Map<String, dynamic> get meta => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get files => throw _privateConstructorUsedError;
  dynamic get gradeResult => throw _privateConstructorUsedError;
  double get reward => throw _privateConstructorUsedError;
  double get maxReward => throw _privateConstructorUsedError;
  double get clampedScore => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PoolSubmission to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoolSubmission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoolSubmissionCopyWith<PoolSubmission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoolSubmissionCopyWith<$Res> {
  factory $PoolSubmissionCopyWith(
    PoolSubmission value,
    $Res Function(PoolSubmission) then,
  ) = _$PoolSubmissionCopyWithImpl<$Res, PoolSubmission>;
  @useResult
  $Res call({
    String id,
    String address,
    Map<String, dynamic> meta,
    String status,
    List<Map<String, dynamic>> files,
    dynamic gradeResult,
    double reward,
    double maxReward,
    double clampedScore,
    String createdAt,
    String updatedAt,
  });
}

/// @nodoc
class _$PoolSubmissionCopyWithImpl<$Res, $Val extends PoolSubmission>
    implements $PoolSubmissionCopyWith<$Res> {
  _$PoolSubmissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoolSubmission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
    Object? meta = null,
    Object? status = null,
    Object? files = null,
    Object? gradeResult = freezed,
    Object? reward = null,
    Object? maxReward = null,
    Object? clampedScore = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            address:
                null == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String,
            meta:
                null == meta
                    ? _value.meta
                    : meta // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            files:
                null == files
                    ? _value.files
                    : files // ignore: cast_nullable_to_non_nullable
                        as List<Map<String, dynamic>>,
            gradeResult:
                freezed == gradeResult
                    ? _value.gradeResult
                    : gradeResult // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            reward:
                null == reward
                    ? _value.reward
                    : reward // ignore: cast_nullable_to_non_nullable
                        as double,
            maxReward:
                null == maxReward
                    ? _value.maxReward
                    : maxReward // ignore: cast_nullable_to_non_nullable
                        as double,
            clampedScore:
                null == clampedScore
                    ? _value.clampedScore
                    : clampedScore // ignore: cast_nullable_to_non_nullable
                        as double,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PoolSubmissionImplCopyWith<$Res>
    implements $PoolSubmissionCopyWith<$Res> {
  factory _$$PoolSubmissionImplCopyWith(
    _$PoolSubmissionImpl value,
    $Res Function(_$PoolSubmissionImpl) then,
  ) = __$$PoolSubmissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String address,
    Map<String, dynamic> meta,
    String status,
    List<Map<String, dynamic>> files,
    dynamic gradeResult,
    double reward,
    double maxReward,
    double clampedScore,
    String createdAt,
    String updatedAt,
  });
}

/// @nodoc
class __$$PoolSubmissionImplCopyWithImpl<$Res>
    extends _$PoolSubmissionCopyWithImpl<$Res, _$PoolSubmissionImpl>
    implements _$$PoolSubmissionImplCopyWith<$Res> {
  __$$PoolSubmissionImplCopyWithImpl(
    _$PoolSubmissionImpl _value,
    $Res Function(_$PoolSubmissionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PoolSubmission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
    Object? meta = null,
    Object? status = null,
    Object? files = null,
    Object? gradeResult = freezed,
    Object? reward = null,
    Object? maxReward = null,
    Object? clampedScore = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$PoolSubmissionImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        address:
            null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String,
        meta:
            null == meta
                ? _value._meta
                : meta // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        files:
            null == files
                ? _value._files
                : files // ignore: cast_nullable_to_non_nullable
                    as List<Map<String, dynamic>>,
        gradeResult:
            freezed == gradeResult
                ? _value.gradeResult
                : gradeResult // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        reward:
            null == reward
                ? _value.reward
                : reward // ignore: cast_nullable_to_non_nullable
                    as double,
        maxReward:
            null == maxReward
                ? _value.maxReward
                : maxReward // ignore: cast_nullable_to_non_nullable
                    as double,
        clampedScore:
            null == clampedScore
                ? _value.clampedScore
                : clampedScore // ignore: cast_nullable_to_non_nullable
                    as double,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PoolSubmissionImpl implements _PoolSubmission {
  const _$PoolSubmissionImpl({
    required this.id,
    required this.address,
    required final Map<String, dynamic> meta,
    required this.status,
    required final List<Map<String, dynamic>> files,
    this.gradeResult,
    required this.reward,
    required this.maxReward,
    required this.clampedScore,
    required this.createdAt,
    required this.updatedAt,
  }) : _meta = meta,
       _files = files;

  factory _$PoolSubmissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoolSubmissionImplFromJson(json);

  @override
  final String id;
  @override
  final String address;
  final Map<String, dynamic> _meta;
  @override
  Map<String, dynamic> get meta {
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_meta);
  }

  @override
  final String status;
  final List<Map<String, dynamic>> _files;
  @override
  List<Map<String, dynamic>> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  final dynamic gradeResult;
  @override
  final double reward;
  @override
  final double maxReward;
  @override
  final double clampedScore;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'PoolSubmission(id: $id, address: $address, meta: $meta, status: $status, files: $files, gradeResult: $gradeResult, reward: $reward, maxReward: $maxReward, clampedScore: $clampedScore, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoolSubmissionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._meta, _meta) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            const DeepCollectionEquality().equals(
              other.gradeResult,
              gradeResult,
            ) &&
            (identical(other.reward, reward) || other.reward == reward) &&
            (identical(other.maxReward, maxReward) ||
                other.maxReward == maxReward) &&
            (identical(other.clampedScore, clampedScore) ||
                other.clampedScore == clampedScore) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    address,
    const DeepCollectionEquality().hash(_meta),
    status,
    const DeepCollectionEquality().hash(_files),
    const DeepCollectionEquality().hash(gradeResult),
    reward,
    maxReward,
    clampedScore,
    createdAt,
    updatedAt,
  );

  /// Create a copy of PoolSubmission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoolSubmissionImplCopyWith<_$PoolSubmissionImpl> get copyWith =>
      __$$PoolSubmissionImplCopyWithImpl<_$PoolSubmissionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PoolSubmissionImplToJson(this);
  }
}

abstract class _PoolSubmission implements PoolSubmission {
  const factory _PoolSubmission({
    required final String id,
    required final String address,
    required final Map<String, dynamic> meta,
    required final String status,
    required final List<Map<String, dynamic>> files,
    final dynamic gradeResult,
    required final double reward,
    required final double maxReward,
    required final double clampedScore,
    required final String createdAt,
    required final String updatedAt,
  }) = _$PoolSubmissionImpl;

  factory _PoolSubmission.fromJson(Map<String, dynamic> json) =
      _$PoolSubmissionImpl.fromJson;

  @override
  String get id;
  @override
  String get address;
  @override
  Map<String, dynamic> get meta;
  @override
  String get status;
  @override
  List<Map<String, dynamic>> get files;
  @override
  dynamic get gradeResult;
  @override
  double get reward;
  @override
  double get maxReward;
  @override
  double get clampedScore;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of PoolSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoolSubmissionImplCopyWith<_$PoolSubmissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubmissionStatus _$SubmissionStatusFromJson(Map<String, dynamic> json) {
  return _SubmissionStatus.fromJson(json);
}

/// @nodoc
mixin _$SubmissionStatus {
  String get id => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  Map<String, dynamic> get meta => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get files => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  double get clampedScore => throw _privateConstructorUsedError;
  dynamic get gradeResult => throw _privateConstructorUsedError;
  double get maxReward => throw _privateConstructorUsedError;
  double get reward => throw _privateConstructorUsedError;
  Map<String, dynamic>? get treasuryTransfer =>
      throw _privateConstructorUsedError;

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
    SubmissionStatus value,
    $Res Function(SubmissionStatus) then,
  ) = _$SubmissionStatusCopyWithImpl<$Res, SubmissionStatus>;
  @useResult
  $Res call({
    String id,
    String address,
    Map<String, dynamic> meta,
    String status,
    List<Map<String, dynamic>> files,
    String? error,
    String createdAt,
    String updatedAt,
    double clampedScore,
    dynamic gradeResult,
    double maxReward,
    double reward,
    Map<String, dynamic>? treasuryTransfer,
  });
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
    Object? gradeResult = freezed,
    Object? maxReward = null,
    Object? reward = null,
    Object? treasuryTransfer = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            address:
                null == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String,
            meta:
                null == meta
                    ? _value.meta
                    : meta // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            files:
                null == files
                    ? _value.files
                    : files // ignore: cast_nullable_to_non_nullable
                        as List<Map<String, dynamic>>,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as String,
            clampedScore:
                null == clampedScore
                    ? _value.clampedScore
                    : clampedScore // ignore: cast_nullable_to_non_nullable
                        as double,
            gradeResult:
                freezed == gradeResult
                    ? _value.gradeResult
                    : gradeResult // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            maxReward:
                null == maxReward
                    ? _value.maxReward
                    : maxReward // ignore: cast_nullable_to_non_nullable
                        as double,
            reward:
                null == reward
                    ? _value.reward
                    : reward // ignore: cast_nullable_to_non_nullable
                        as double,
            treasuryTransfer:
                freezed == treasuryTransfer
                    ? _value.treasuryTransfer
                    : treasuryTransfer // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubmissionStatusImplCopyWith<$Res>
    implements $SubmissionStatusCopyWith<$Res> {
  factory _$$SubmissionStatusImplCopyWith(
    _$SubmissionStatusImpl value,
    $Res Function(_$SubmissionStatusImpl) then,
  ) = __$$SubmissionStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String address,
    Map<String, dynamic> meta,
    String status,
    List<Map<String, dynamic>> files,
    String? error,
    String createdAt,
    String updatedAt,
    double clampedScore,
    dynamic gradeResult,
    double maxReward,
    double reward,
    Map<String, dynamic>? treasuryTransfer,
  });
}

/// @nodoc
class __$$SubmissionStatusImplCopyWithImpl<$Res>
    extends _$SubmissionStatusCopyWithImpl<$Res, _$SubmissionStatusImpl>
    implements _$$SubmissionStatusImplCopyWith<$Res> {
  __$$SubmissionStatusImplCopyWithImpl(
    _$SubmissionStatusImpl _value,
    $Res Function(_$SubmissionStatusImpl) _then,
  ) : super(_value, _then);

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
    Object? gradeResult = freezed,
    Object? maxReward = null,
    Object? reward = null,
    Object? treasuryTransfer = freezed,
  }) {
    return _then(
      _$SubmissionStatusImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        address:
            null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String,
        meta:
            null == meta
                ? _value._meta
                : meta // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        files:
            null == files
                ? _value._files
                : files // ignore: cast_nullable_to_non_nullable
                    as List<Map<String, dynamic>>,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as String,
        clampedScore:
            null == clampedScore
                ? _value.clampedScore
                : clampedScore // ignore: cast_nullable_to_non_nullable
                    as double,
        gradeResult:
            freezed == gradeResult
                ? _value.gradeResult
                : gradeResult // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        maxReward:
            null == maxReward
                ? _value.maxReward
                : maxReward // ignore: cast_nullable_to_non_nullable
                    as double,
        reward:
            null == reward
                ? _value.reward
                : reward // ignore: cast_nullable_to_non_nullable
                    as double,
        treasuryTransfer:
            freezed == treasuryTransfer
                ? _value._treasuryTransfer
                : treasuryTransfer // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmissionStatusImpl implements _SubmissionStatus {
  const _$SubmissionStatusImpl({
    required this.id,
    required this.address,
    required final Map<String, dynamic> meta,
    required this.status,
    required final List<Map<String, dynamic>> files,
    this.error,
    required this.createdAt,
    required this.updatedAt,
    required this.clampedScore,
    this.gradeResult,
    required this.maxReward,
    required this.reward,
    final Map<String, dynamic>? treasuryTransfer,
  }) : _meta = meta,
       _files = files,
       _treasuryTransfer = treasuryTransfer;

  factory _$SubmissionStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmissionStatusImplFromJson(json);

  @override
  final String id;
  @override
  final String address;
  final Map<String, dynamic> _meta;
  @override
  Map<String, dynamic> get meta {
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_meta);
  }

  @override
  final String status;
  final List<Map<String, dynamic>> _files;
  @override
  List<Map<String, dynamic>> get files {
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
  final double clampedScore;
  @override
  final dynamic gradeResult;
  @override
  final double maxReward;
  @override
  final double reward;
  final Map<String, dynamic>? _treasuryTransfer;
  @override
  Map<String, dynamic>? get treasuryTransfer {
    final value = _treasuryTransfer;
    if (value == null) return null;
    if (_treasuryTransfer is EqualUnmodifiableMapView) return _treasuryTransfer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

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
            const DeepCollectionEquality().equals(other._meta, _meta) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.clampedScore, clampedScore) ||
                other.clampedScore == clampedScore) &&
            const DeepCollectionEquality().equals(
              other.gradeResult,
              gradeResult,
            ) &&
            (identical(other.maxReward, maxReward) ||
                other.maxReward == maxReward) &&
            (identical(other.reward, reward) || other.reward == reward) &&
            const DeepCollectionEquality().equals(
              other._treasuryTransfer,
              _treasuryTransfer,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    address,
    const DeepCollectionEquality().hash(_meta),
    status,
    const DeepCollectionEquality().hash(_files),
    error,
    createdAt,
    updatedAt,
    clampedScore,
    const DeepCollectionEquality().hash(gradeResult),
    maxReward,
    reward,
    const DeepCollectionEquality().hash(_treasuryTransfer),
  );

  /// Create a copy of SubmissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmissionStatusImplCopyWith<_$SubmissionStatusImpl> get copyWith =>
      __$$SubmissionStatusImplCopyWithImpl<_$SubmissionStatusImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmissionStatusImplToJson(this);
  }
}

abstract class _SubmissionStatus implements SubmissionStatus {
  const factory _SubmissionStatus({
    required final String id,
    required final String address,
    required final Map<String, dynamic> meta,
    required final String status,
    required final List<Map<String, dynamic>> files,
    final String? error,
    required final String createdAt,
    required final String updatedAt,
    required final double clampedScore,
    final dynamic gradeResult,
    required final double maxReward,
    required final double reward,
    final Map<String, dynamic>? treasuryTransfer,
  }) = _$SubmissionStatusImpl;

  factory _SubmissionStatus.fromJson(Map<String, dynamic> json) =
      _$SubmissionStatusImpl.fromJson;

  @override
  String get id;
  @override
  String get address;
  @override
  Map<String, dynamic> get meta;
  @override
  String get status;
  @override
  List<Map<String, dynamic>> get files;
  @override
  String? get error;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  double get clampedScore;
  @override
  dynamic get gradeResult;
  @override
  double get maxReward;
  @override
  double get reward;
  @override
  Map<String, dynamic>? get treasuryTransfer;

  /// Create a copy of SubmissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmissionStatusImplCopyWith<_$SubmissionStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
