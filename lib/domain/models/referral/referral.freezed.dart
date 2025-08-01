// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Referral _$ReferralFromJson(Map<String, dynamic> json) {
  return _Referral.fromJson(json);
}

/// @nodoc
mixin _$Referral {
  String get referrerAddress => throw _privateConstructorUsedError;
  String get referreeAddress => throw _privateConstructorUsedError;
  String get referralCode => throw _privateConstructorUsedError;
  String get referralLink => throw _privateConstructorUsedError;
  String get firstActionType => throw _privateConstructorUsedError;
  Map<String, dynamic>? get firstActionData =>
      throw _privateConstructorUsedError;
  String? get onChainTxHash => throw _privateConstructorUsedError;
  int? get onChainSlot => throw _privateConstructorUsedError;
  double get rewardAmount => throw _privateConstructorUsedError;
  bool get rewardProcessed => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Referral to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Referral
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferralCopyWith<Referral> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralCopyWith<$Res> {
  factory $ReferralCopyWith(Referral value, $Res Function(Referral) then) =
      _$ReferralCopyWithImpl<$Res, Referral>;
  @useResult
  $Res call(
      {String referrerAddress,
      String referreeAddress,
      String referralCode,
      String referralLink,
      String firstActionType,
      Map<String, dynamic>? firstActionData,
      String? onChainTxHash,
      int? onChainSlot,
      double rewardAmount,
      bool rewardProcessed,
      String status,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ReferralCopyWithImpl<$Res, $Val extends Referral>
    implements $ReferralCopyWith<$Res> {
  _$ReferralCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Referral
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referrerAddress = null,
    Object? referreeAddress = null,
    Object? referralCode = null,
    Object? referralLink = null,
    Object? firstActionType = null,
    Object? firstActionData = freezed,
    Object? onChainTxHash = freezed,
    Object? onChainSlot = freezed,
    Object? rewardAmount = null,
    Object? rewardProcessed = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      referrerAddress: null == referrerAddress
          ? _value.referrerAddress
          : referrerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      referreeAddress: null == referreeAddress
          ? _value.referreeAddress
          : referreeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      referralLink: null == referralLink
          ? _value.referralLink
          : referralLink // ignore: cast_nullable_to_non_nullable
              as String,
      firstActionType: null == firstActionType
          ? _value.firstActionType
          : firstActionType // ignore: cast_nullable_to_non_nullable
              as String,
      firstActionData: freezed == firstActionData
          ? _value.firstActionData
          : firstActionData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      onChainTxHash: freezed == onChainTxHash
          ? _value.onChainTxHash
          : onChainTxHash // ignore: cast_nullable_to_non_nullable
              as String?,
      onChainSlot: freezed == onChainSlot
          ? _value.onChainSlot
          : onChainSlot // ignore: cast_nullable_to_non_nullable
              as int?,
      rewardAmount: null == rewardAmount
          ? _value.rewardAmount
          : rewardAmount // ignore: cast_nullable_to_non_nullable
              as double,
      rewardProcessed: null == rewardProcessed
          ? _value.rewardProcessed
          : rewardProcessed // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralImplCopyWith<$Res>
    implements $ReferralCopyWith<$Res> {
  factory _$$ReferralImplCopyWith(
          _$ReferralImpl value, $Res Function(_$ReferralImpl) then) =
      __$$ReferralImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String referrerAddress,
      String referreeAddress,
      String referralCode,
      String referralLink,
      String firstActionType,
      Map<String, dynamic>? firstActionData,
      String? onChainTxHash,
      int? onChainSlot,
      double rewardAmount,
      bool rewardProcessed,
      String status,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$ReferralImplCopyWithImpl<$Res>
    extends _$ReferralCopyWithImpl<$Res, _$ReferralImpl>
    implements _$$ReferralImplCopyWith<$Res> {
  __$$ReferralImplCopyWithImpl(
      _$ReferralImpl _value, $Res Function(_$ReferralImpl) _then)
      : super(_value, _then);

  /// Create a copy of Referral
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referrerAddress = null,
    Object? referreeAddress = null,
    Object? referralCode = null,
    Object? referralLink = null,
    Object? firstActionType = null,
    Object? firstActionData = freezed,
    Object? onChainTxHash = freezed,
    Object? onChainSlot = freezed,
    Object? rewardAmount = null,
    Object? rewardProcessed = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ReferralImpl(
      referrerAddress: null == referrerAddress
          ? _value.referrerAddress
          : referrerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      referreeAddress: null == referreeAddress
          ? _value.referreeAddress
          : referreeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      referralLink: null == referralLink
          ? _value.referralLink
          : referralLink // ignore: cast_nullable_to_non_nullable
              as String,
      firstActionType: null == firstActionType
          ? _value.firstActionType
          : firstActionType // ignore: cast_nullable_to_non_nullable
              as String,
      firstActionData: freezed == firstActionData
          ? _value._firstActionData
          : firstActionData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      onChainTxHash: freezed == onChainTxHash
          ? _value.onChainTxHash
          : onChainTxHash // ignore: cast_nullable_to_non_nullable
              as String?,
      onChainSlot: freezed == onChainSlot
          ? _value.onChainSlot
          : onChainSlot // ignore: cast_nullable_to_non_nullable
              as int?,
      rewardAmount: null == rewardAmount
          ? _value.rewardAmount
          : rewardAmount // ignore: cast_nullable_to_non_nullable
              as double,
      rewardProcessed: null == rewardProcessed
          ? _value.rewardProcessed
          : rewardProcessed // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralImpl implements _Referral {
  const _$ReferralImpl(
      {required this.referrerAddress,
      required this.referreeAddress,
      required this.referralCode,
      required this.referralLink,
      required this.firstActionType,
      final Map<String, dynamic>? firstActionData,
      this.onChainTxHash,
      this.onChainSlot,
      this.rewardAmount = 0,
      this.rewardProcessed = false,
      this.status = 'pending',
      this.createdAt,
      this.updatedAt})
      : _firstActionData = firstActionData;

  factory _$ReferralImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralImplFromJson(json);

  @override
  final String referrerAddress;
  @override
  final String referreeAddress;
  @override
  final String referralCode;
  @override
  final String referralLink;
  @override
  final String firstActionType;
  final Map<String, dynamic>? _firstActionData;
  @override
  Map<String, dynamic>? get firstActionData {
    final value = _firstActionData;
    if (value == null) return null;
    if (_firstActionData is EqualUnmodifiableMapView) return _firstActionData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? onChainTxHash;
  @override
  final int? onChainSlot;
  @override
  @JsonKey()
  final double rewardAmount;
  @override
  @JsonKey()
  final bool rewardProcessed;
  @override
  @JsonKey()
  final String status;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Referral(referrerAddress: $referrerAddress, referreeAddress: $referreeAddress, referralCode: $referralCode, referralLink: $referralLink, firstActionType: $firstActionType, firstActionData: $firstActionData, onChainTxHash: $onChainTxHash, onChainSlot: $onChainSlot, rewardAmount: $rewardAmount, rewardProcessed: $rewardProcessed, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralImpl &&
            (identical(other.referrerAddress, referrerAddress) ||
                other.referrerAddress == referrerAddress) &&
            (identical(other.referreeAddress, referreeAddress) ||
                other.referreeAddress == referreeAddress) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.referralLink, referralLink) ||
                other.referralLink == referralLink) &&
            (identical(other.firstActionType, firstActionType) ||
                other.firstActionType == firstActionType) &&
            const DeepCollectionEquality()
                .equals(other._firstActionData, _firstActionData) &&
            (identical(other.onChainTxHash, onChainTxHash) ||
                other.onChainTxHash == onChainTxHash) &&
            (identical(other.onChainSlot, onChainSlot) ||
                other.onChainSlot == onChainSlot) &&
            (identical(other.rewardAmount, rewardAmount) ||
                other.rewardAmount == rewardAmount) &&
            (identical(other.rewardProcessed, rewardProcessed) ||
                other.rewardProcessed == rewardProcessed) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      referrerAddress,
      referreeAddress,
      referralCode,
      referralLink,
      firstActionType,
      const DeepCollectionEquality().hash(_firstActionData),
      onChainTxHash,
      onChainSlot,
      rewardAmount,
      rewardProcessed,
      status,
      createdAt,
      updatedAt);

  /// Create a copy of Referral
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralImplCopyWith<_$ReferralImpl> get copyWith =>
      __$$ReferralImplCopyWithImpl<_$ReferralImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralImplToJson(
      this,
    );
  }
}

abstract class _Referral implements Referral {
  const factory _Referral(
      {required final String referrerAddress,
      required final String referreeAddress,
      required final String referralCode,
      required final String referralLink,
      required final String firstActionType,
      final Map<String, dynamic>? firstActionData,
      final String? onChainTxHash,
      final int? onChainSlot,
      final double rewardAmount,
      final bool rewardProcessed,
      final String status,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$ReferralImpl;

  factory _Referral.fromJson(Map<String, dynamic> json) =
      _$ReferralImpl.fromJson;

  @override
  String get referrerAddress;
  @override
  String get referreeAddress;
  @override
  String get referralCode;
  @override
  String get referralLink;
  @override
  String get firstActionType;
  @override
  Map<String, dynamic>? get firstActionData;
  @override
  String? get onChainTxHash;
  @override
  int? get onChainSlot;
  @override
  double get rewardAmount;
  @override
  bool get rewardProcessed;
  @override
  String get status;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Referral
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferralImplCopyWith<_$ReferralImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
