// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quest/reward_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RewardInfo _$RewardInfoFromJson(Map<String, dynamic> json) {
  return _RewardInfo.fromJson(json);
}

/// @nodoc
mixin _$RewardInfo {
  int get time => throw _privateConstructorUsedError;
  int get maxReward => throw _privateConstructorUsedError;

  /// Serializes this RewardInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RewardInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardInfoCopyWith<RewardInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardInfoCopyWith<$Res> {
  factory $RewardInfoCopyWith(
          RewardInfo value, $Res Function(RewardInfo) then) =
      _$RewardInfoCopyWithImpl<$Res, RewardInfo>;
  @useResult
  $Res call({int time, int maxReward});
}

/// @nodoc
class _$RewardInfoCopyWithImpl<$Res, $Val extends RewardInfo>
    implements $RewardInfoCopyWith<$Res> {
  _$RewardInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? maxReward = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      maxReward: null == maxReward
          ? _value.maxReward
          : maxReward // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RewardInfoImplCopyWith<$Res>
    implements $RewardInfoCopyWith<$Res> {
  factory _$$RewardInfoImplCopyWith(
          _$RewardInfoImpl value, $Res Function(_$RewardInfoImpl) then) =
      __$$RewardInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int time, int maxReward});
}

/// @nodoc
class __$$RewardInfoImplCopyWithImpl<$Res>
    extends _$RewardInfoCopyWithImpl<$Res, _$RewardInfoImpl>
    implements _$$RewardInfoImplCopyWith<$Res> {
  __$$RewardInfoImplCopyWithImpl(
      _$RewardInfoImpl _value, $Res Function(_$RewardInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RewardInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? maxReward = null,
  }) {
    return _then(_$RewardInfoImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      maxReward: null == maxReward
          ? _value.maxReward
          : maxReward // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RewardInfoImpl implements _RewardInfo {
  const _$RewardInfoImpl({required this.time, required this.maxReward});

  factory _$RewardInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardInfoImplFromJson(json);

  @override
  final int time;
  @override
  final int maxReward;

  @override
  String toString() {
    return 'RewardInfo(time: $time, maxReward: $maxReward)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardInfoImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.maxReward, maxReward) ||
                other.maxReward == maxReward));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, maxReward);

  /// Create a copy of RewardInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardInfoImplCopyWith<_$RewardInfoImpl> get copyWith =>
      __$$RewardInfoImplCopyWithImpl<_$RewardInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardInfoImplToJson(
      this,
    );
  }
}

abstract class _RewardInfo implements RewardInfo {
  const factory _RewardInfo(
      {required final int time,
      required final int maxReward}) = _$RewardInfoImpl;

  factory _RewardInfo.fromJson(Map<String, dynamic> json) =
      _$RewardInfoImpl.fromJson;

  @override
  int get time;
  @override
  int get maxReward;

  /// Create a copy of RewardInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardInfoImplCopyWith<_$RewardInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
