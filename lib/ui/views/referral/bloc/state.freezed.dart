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
mixin _$ReferralState {
  ReferralInfo? get referralInfo => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String? get referrerCode => throw _privateConstructorUsedError;

  /// Create a copy of ReferralState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferralStateCopyWith<ReferralState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralStateCopyWith<$Res> {
  factory $ReferralStateCopyWith(
          ReferralState value, $Res Function(ReferralState) then) =
      _$ReferralStateCopyWithImpl<$Res, ReferralState>;
  @useResult
  $Res call(
      {ReferralInfo? referralInfo,
      bool isLoading,
      String errorMessage,
      String? referrerCode});

  $ReferralInfoCopyWith<$Res>? get referralInfo;
}

/// @nodoc
class _$ReferralStateCopyWithImpl<$Res, $Val extends ReferralState>
    implements $ReferralStateCopyWith<$Res> {
  _$ReferralStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReferralState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralInfo = freezed,
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? referrerCode = freezed,
  }) {
    return _then(_value.copyWith(
      referralInfo: freezed == referralInfo
          ? _value.referralInfo
          : referralInfo // ignore: cast_nullable_to_non_nullable
              as ReferralInfo?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      referrerCode: freezed == referrerCode
          ? _value.referrerCode
          : referrerCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ReferralState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReferralInfoCopyWith<$Res>? get referralInfo {
    if (_value.referralInfo == null) {
      return null;
    }

    return $ReferralInfoCopyWith<$Res>(_value.referralInfo!, (value) {
      return _then(_value.copyWith(referralInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReferralStateImplCopyWith<$Res>
    implements $ReferralStateCopyWith<$Res> {
  factory _$$ReferralStateImplCopyWith(
          _$ReferralStateImpl value, $Res Function(_$ReferralStateImpl) then) =
      __$$ReferralStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReferralInfo? referralInfo,
      bool isLoading,
      String errorMessage,
      String? referrerCode});

  @override
  $ReferralInfoCopyWith<$Res>? get referralInfo;
}

/// @nodoc
class __$$ReferralStateImplCopyWithImpl<$Res>
    extends _$ReferralStateCopyWithImpl<$Res, _$ReferralStateImpl>
    implements _$$ReferralStateImplCopyWith<$Res> {
  __$$ReferralStateImplCopyWithImpl(
      _$ReferralStateImpl _value, $Res Function(_$ReferralStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReferralState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralInfo = freezed,
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? referrerCode = freezed,
  }) {
    return _then(_$ReferralStateImpl(
      referralInfo: freezed == referralInfo
          ? _value.referralInfo
          : referralInfo // ignore: cast_nullable_to_non_nullable
              as ReferralInfo?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      referrerCode: freezed == referrerCode
          ? _value.referrerCode
          : referrerCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReferralStateImpl extends _ReferralState {
  const _$ReferralStateImpl(
      {this.referralInfo,
      this.isLoading = false,
      this.errorMessage = '',
      this.referrerCode})
      : super._();

  @override
  final ReferralInfo? referralInfo;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final String? referrerCode;

  @override
  String toString() {
    return 'ReferralState(referralInfo: $referralInfo, isLoading: $isLoading, errorMessage: $errorMessage, referrerCode: $referrerCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralStateImpl &&
            (identical(other.referralInfo, referralInfo) ||
                other.referralInfo == referralInfo) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.referrerCode, referrerCode) ||
                other.referrerCode == referrerCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, referralInfo, isLoading, errorMessage, referrerCode);

  /// Create a copy of ReferralState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralStateImplCopyWith<_$ReferralStateImpl> get copyWith =>
      __$$ReferralStateImplCopyWithImpl<_$ReferralStateImpl>(this, _$identity);
}

abstract class _ReferralState extends ReferralState {
  const factory _ReferralState(
      {final ReferralInfo? referralInfo,
      final bool isLoading,
      final String errorMessage,
      final String? referrerCode}) = _$ReferralStateImpl;
  const _ReferralState._() : super._();

  @override
  ReferralInfo? get referralInfo;
  @override
  bool get isLoading;
  @override
  String get errorMessage;
  @override
  String? get referrerCode;

  /// Create a copy of ReferralState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferralStateImplCopyWith<_$ReferralStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
