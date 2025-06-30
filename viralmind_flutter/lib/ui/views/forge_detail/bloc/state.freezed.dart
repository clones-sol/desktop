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
mixin _$ForgeDetailState {
  String get gymName => throw _privateConstructorUsedError;
  double get pricePerDemo => throw _privateConstructorUsedError;
  int get uploadLimitValue => throw _privateConstructorUsedError;
  String get uploadLimitType => throw _privateConstructorUsedError;
  String get alertEmail => throw _privateConstructorUsedError;
  TrainingPoolStatus? get gymStatus => throw _privateConstructorUsedError;
  TrainingPool? get pool => throw _privateConstructorUsedError;
  ViewModeTasks get viewModeTasks => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isUpdateGymStatusSuccess => throw _privateConstructorUsedError;
  bool get isUpdatePoolSuccess => throw _privateConstructorUsedError;
  bool get isRefreshBalanceSuccess => throw _privateConstructorUsedError;
  bool get hasUnsavedChanges => throw _privateConstructorUsedError;

  /// Create a copy of ForgeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgeDetailStateCopyWith<ForgeDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgeDetailStateCopyWith<$Res> {
  factory $ForgeDetailStateCopyWith(
          ForgeDetailState value, $Res Function(ForgeDetailState) then) =
      _$ForgeDetailStateCopyWithImpl<$Res, ForgeDetailState>;
  @useResult
  $Res call(
      {String gymName,
      double pricePerDemo,
      int uploadLimitValue,
      String uploadLimitType,
      String alertEmail,
      TrainingPoolStatus? gymStatus,
      TrainingPool? pool,
      ViewModeTasks viewModeTasks,
      String? error,
      bool isUpdateGymStatusSuccess,
      bool isUpdatePoolSuccess,
      bool isRefreshBalanceSuccess,
      bool hasUnsavedChanges});

  $TrainingPoolCopyWith<$Res>? get pool;
}

/// @nodoc
class _$ForgeDetailStateCopyWithImpl<$Res, $Val extends ForgeDetailState>
    implements $ForgeDetailStateCopyWith<$Res> {
  _$ForgeDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymName = null,
    Object? pricePerDemo = null,
    Object? uploadLimitValue = null,
    Object? uploadLimitType = null,
    Object? alertEmail = null,
    Object? gymStatus = freezed,
    Object? pool = freezed,
    Object? viewModeTasks = null,
    Object? error = freezed,
    Object? isUpdateGymStatusSuccess = null,
    Object? isUpdatePoolSuccess = null,
    Object? isRefreshBalanceSuccess = null,
    Object? hasUnsavedChanges = null,
  }) {
    return _then(_value.copyWith(
      gymName: null == gymName
          ? _value.gymName
          : gymName // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerDemo: null == pricePerDemo
          ? _value.pricePerDemo
          : pricePerDemo // ignore: cast_nullable_to_non_nullable
              as double,
      uploadLimitValue: null == uploadLimitValue
          ? _value.uploadLimitValue
          : uploadLimitValue // ignore: cast_nullable_to_non_nullable
              as int,
      uploadLimitType: null == uploadLimitType
          ? _value.uploadLimitType
          : uploadLimitType // ignore: cast_nullable_to_non_nullable
              as String,
      alertEmail: null == alertEmail
          ? _value.alertEmail
          : alertEmail // ignore: cast_nullable_to_non_nullable
              as String,
      gymStatus: freezed == gymStatus
          ? _value.gymStatus
          : gymStatus // ignore: cast_nullable_to_non_nullable
              as TrainingPoolStatus?,
      pool: freezed == pool
          ? _value.pool
          : pool // ignore: cast_nullable_to_non_nullable
              as TrainingPool?,
      viewModeTasks: null == viewModeTasks
          ? _value.viewModeTasks
          : viewModeTasks // ignore: cast_nullable_to_non_nullable
              as ViewModeTasks,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpdateGymStatusSuccess: null == isUpdateGymStatusSuccess
          ? _value.isUpdateGymStatusSuccess
          : isUpdateGymStatusSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatePoolSuccess: null == isUpdatePoolSuccess
          ? _value.isUpdatePoolSuccess
          : isUpdatePoolSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshBalanceSuccess: null == isRefreshBalanceSuccess
          ? _value.isRefreshBalanceSuccess
          : isRefreshBalanceSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      hasUnsavedChanges: null == hasUnsavedChanges
          ? _value.hasUnsavedChanges
          : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ForgeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrainingPoolCopyWith<$Res>? get pool {
    if (_value.pool == null) {
      return null;
    }

    return $TrainingPoolCopyWith<$Res>(_value.pool!, (value) {
      return _then(_value.copyWith(pool: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForgeDetailStateImplCopyWith<$Res>
    implements $ForgeDetailStateCopyWith<$Res> {
  factory _$$ForgeDetailStateImplCopyWith(_$ForgeDetailStateImpl value,
          $Res Function(_$ForgeDetailStateImpl) then) =
      __$$ForgeDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gymName,
      double pricePerDemo,
      int uploadLimitValue,
      String uploadLimitType,
      String alertEmail,
      TrainingPoolStatus? gymStatus,
      TrainingPool? pool,
      ViewModeTasks viewModeTasks,
      String? error,
      bool isUpdateGymStatusSuccess,
      bool isUpdatePoolSuccess,
      bool isRefreshBalanceSuccess,
      bool hasUnsavedChanges});

  @override
  $TrainingPoolCopyWith<$Res>? get pool;
}

/// @nodoc
class __$$ForgeDetailStateImplCopyWithImpl<$Res>
    extends _$ForgeDetailStateCopyWithImpl<$Res, _$ForgeDetailStateImpl>
    implements _$$ForgeDetailStateImplCopyWith<$Res> {
  __$$ForgeDetailStateImplCopyWithImpl(_$ForgeDetailStateImpl _value,
      $Res Function(_$ForgeDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymName = null,
    Object? pricePerDemo = null,
    Object? uploadLimitValue = null,
    Object? uploadLimitType = null,
    Object? alertEmail = null,
    Object? gymStatus = freezed,
    Object? pool = freezed,
    Object? viewModeTasks = null,
    Object? error = freezed,
    Object? isUpdateGymStatusSuccess = null,
    Object? isUpdatePoolSuccess = null,
    Object? isRefreshBalanceSuccess = null,
    Object? hasUnsavedChanges = null,
  }) {
    return _then(_$ForgeDetailStateImpl(
      gymName: null == gymName
          ? _value.gymName
          : gymName // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerDemo: null == pricePerDemo
          ? _value.pricePerDemo
          : pricePerDemo // ignore: cast_nullable_to_non_nullable
              as double,
      uploadLimitValue: null == uploadLimitValue
          ? _value.uploadLimitValue
          : uploadLimitValue // ignore: cast_nullable_to_non_nullable
              as int,
      uploadLimitType: null == uploadLimitType
          ? _value.uploadLimitType
          : uploadLimitType // ignore: cast_nullable_to_non_nullable
              as String,
      alertEmail: null == alertEmail
          ? _value.alertEmail
          : alertEmail // ignore: cast_nullable_to_non_nullable
              as String,
      gymStatus: freezed == gymStatus
          ? _value.gymStatus
          : gymStatus // ignore: cast_nullable_to_non_nullable
              as TrainingPoolStatus?,
      pool: freezed == pool
          ? _value.pool
          : pool // ignore: cast_nullable_to_non_nullable
              as TrainingPool?,
      viewModeTasks: null == viewModeTasks
          ? _value.viewModeTasks
          : viewModeTasks // ignore: cast_nullable_to_non_nullable
              as ViewModeTasks,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpdateGymStatusSuccess: null == isUpdateGymStatusSuccess
          ? _value.isUpdateGymStatusSuccess
          : isUpdateGymStatusSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatePoolSuccess: null == isUpdatePoolSuccess
          ? _value.isUpdatePoolSuccess
          : isUpdatePoolSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshBalanceSuccess: null == isRefreshBalanceSuccess
          ? _value.isRefreshBalanceSuccess
          : isRefreshBalanceSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      hasUnsavedChanges: null == hasUnsavedChanges
          ? _value.hasUnsavedChanges
          : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ForgeDetailStateImpl extends _ForgeDetailState {
  const _$ForgeDetailStateImpl(
      {this.gymName = '',
      this.pricePerDemo = 1,
      this.uploadLimitValue = 10,
      this.uploadLimitType = 'none',
      this.alertEmail = '',
      this.gymStatus = TrainingPoolStatus.noFunds,
      this.pool,
      this.viewModeTasks = ViewModeTasks.edit,
      this.error,
      this.isUpdateGymStatusSuccess = false,
      this.isUpdatePoolSuccess = false,
      this.isRefreshBalanceSuccess = false,
      this.hasUnsavedChanges = false})
      : super._();

  @override
  @JsonKey()
  final String gymName;
  @override
  @JsonKey()
  final double pricePerDemo;
  @override
  @JsonKey()
  final int uploadLimitValue;
  @override
  @JsonKey()
  final String uploadLimitType;
  @override
  @JsonKey()
  final String alertEmail;
  @override
  @JsonKey()
  final TrainingPoolStatus? gymStatus;
  @override
  final TrainingPool? pool;
  @override
  @JsonKey()
  final ViewModeTasks viewModeTasks;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool isUpdateGymStatusSuccess;
  @override
  @JsonKey()
  final bool isUpdatePoolSuccess;
  @override
  @JsonKey()
  final bool isRefreshBalanceSuccess;
  @override
  @JsonKey()
  final bool hasUnsavedChanges;

  @override
  String toString() {
    return 'ForgeDetailState(gymName: $gymName, pricePerDemo: $pricePerDemo, uploadLimitValue: $uploadLimitValue, uploadLimitType: $uploadLimitType, alertEmail: $alertEmail, gymStatus: $gymStatus, pool: $pool, viewModeTasks: $viewModeTasks, error: $error, isUpdateGymStatusSuccess: $isUpdateGymStatusSuccess, isUpdatePoolSuccess: $isUpdatePoolSuccess, isRefreshBalanceSuccess: $isRefreshBalanceSuccess, hasUnsavedChanges: $hasUnsavedChanges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgeDetailStateImpl &&
            (identical(other.gymName, gymName) || other.gymName == gymName) &&
            (identical(other.pricePerDemo, pricePerDemo) ||
                other.pricePerDemo == pricePerDemo) &&
            (identical(other.uploadLimitValue, uploadLimitValue) ||
                other.uploadLimitValue == uploadLimitValue) &&
            (identical(other.uploadLimitType, uploadLimitType) ||
                other.uploadLimitType == uploadLimitType) &&
            (identical(other.alertEmail, alertEmail) ||
                other.alertEmail == alertEmail) &&
            (identical(other.gymStatus, gymStatus) ||
                other.gymStatus == gymStatus) &&
            (identical(other.pool, pool) || other.pool == pool) &&
            (identical(other.viewModeTasks, viewModeTasks) ||
                other.viewModeTasks == viewModeTasks) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(
                    other.isUpdateGymStatusSuccess, isUpdateGymStatusSuccess) ||
                other.isUpdateGymStatusSuccess == isUpdateGymStatusSuccess) &&
            (identical(other.isUpdatePoolSuccess, isUpdatePoolSuccess) ||
                other.isUpdatePoolSuccess == isUpdatePoolSuccess) &&
            (identical(
                    other.isRefreshBalanceSuccess, isRefreshBalanceSuccess) ||
                other.isRefreshBalanceSuccess == isRefreshBalanceSuccess) &&
            (identical(other.hasUnsavedChanges, hasUnsavedChanges) ||
                other.hasUnsavedChanges == hasUnsavedChanges));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      gymName,
      pricePerDemo,
      uploadLimitValue,
      uploadLimitType,
      alertEmail,
      gymStatus,
      pool,
      viewModeTasks,
      error,
      isUpdateGymStatusSuccess,
      isUpdatePoolSuccess,
      isRefreshBalanceSuccess,
      hasUnsavedChanges);

  /// Create a copy of ForgeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgeDetailStateImplCopyWith<_$ForgeDetailStateImpl> get copyWith =>
      __$$ForgeDetailStateImplCopyWithImpl<_$ForgeDetailStateImpl>(
          this, _$identity);
}

abstract class _ForgeDetailState extends ForgeDetailState {
  const factory _ForgeDetailState(
      {final String gymName,
      final double pricePerDemo,
      final int uploadLimitValue,
      final String uploadLimitType,
      final String alertEmail,
      final TrainingPoolStatus? gymStatus,
      final TrainingPool? pool,
      final ViewModeTasks viewModeTasks,
      final String? error,
      final bool isUpdateGymStatusSuccess,
      final bool isUpdatePoolSuccess,
      final bool isRefreshBalanceSuccess,
      final bool hasUnsavedChanges}) = _$ForgeDetailStateImpl;
  const _ForgeDetailState._() : super._();

  @override
  String get gymName;
  @override
  double get pricePerDemo;
  @override
  int get uploadLimitValue;
  @override
  String get uploadLimitType;
  @override
  String get alertEmail;
  @override
  TrainingPoolStatus? get gymStatus;
  @override
  TrainingPool? get pool;
  @override
  ViewModeTasks get viewModeTasks;
  @override
  String? get error;
  @override
  bool get isUpdateGymStatusSuccess;
  @override
  bool get isUpdatePoolSuccess;
  @override
  bool get isRefreshBalanceSuccess;
  @override
  bool get hasUnsavedChanges;

  /// Create a copy of ForgeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgeDetailStateImplCopyWith<_$ForgeDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
