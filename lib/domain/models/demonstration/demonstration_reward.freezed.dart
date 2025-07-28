// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'demonstration_reward.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DemonstrationReward _$DemonstrationRewardFromJson(Map<String, dynamic> json) {
  return _DemonstrationReward.fromJson(json);
}

/// @nodoc
mixin _$DemonstrationReward {
  int get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_reward')
  int get maxReward => throw _privateConstructorUsedError;

  /// Serializes this DemonstrationReward to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DemonstrationReward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DemonstrationRewardCopyWith<DemonstrationReward> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemonstrationRewardCopyWith<$Res> {
  factory $DemonstrationRewardCopyWith(
          DemonstrationReward value, $Res Function(DemonstrationReward) then) =
      _$DemonstrationRewardCopyWithImpl<$Res, DemonstrationReward>;
  @useResult
  $Res call({int time, @JsonKey(name: 'max_reward') int maxReward});
}

/// @nodoc
class _$DemonstrationRewardCopyWithImpl<$Res, $Val extends DemonstrationReward>
    implements $DemonstrationRewardCopyWith<$Res> {
  _$DemonstrationRewardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DemonstrationReward
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
abstract class _$$DemonstrationRewardImplCopyWith<$Res>
    implements $DemonstrationRewardCopyWith<$Res> {
  factory _$$DemonstrationRewardImplCopyWith(_$DemonstrationRewardImpl value,
          $Res Function(_$DemonstrationRewardImpl) then) =
      __$$DemonstrationRewardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int time, @JsonKey(name: 'max_reward') int maxReward});
}

/// @nodoc
class __$$DemonstrationRewardImplCopyWithImpl<$Res>
    extends _$DemonstrationRewardCopyWithImpl<$Res, _$DemonstrationRewardImpl>
    implements _$$DemonstrationRewardImplCopyWith<$Res> {
  __$$DemonstrationRewardImplCopyWithImpl(_$DemonstrationRewardImpl _value,
      $Res Function(_$DemonstrationRewardImpl) _then)
      : super(_value, _then);

  /// Create a copy of DemonstrationReward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? maxReward = null,
  }) {
    return _then(_$DemonstrationRewardImpl(
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
class _$DemonstrationRewardImpl implements _DemonstrationReward {
  const _$DemonstrationRewardImpl(
      {required this.time,
      @JsonKey(name: 'max_reward') required this.maxReward});

  factory _$DemonstrationRewardImpl.fromJson(Map<String, dynamic> json) =>
      _$$DemonstrationRewardImplFromJson(json);

  @override
  final int time;
  @override
  @JsonKey(name: 'max_reward')
  final int maxReward;

  @override
  String toString() {
    return 'DemonstrationReward(time: $time, maxReward: $maxReward)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DemonstrationRewardImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.maxReward, maxReward) ||
                other.maxReward == maxReward));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, maxReward);

  /// Create a copy of DemonstrationReward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DemonstrationRewardImplCopyWith<_$DemonstrationRewardImpl> get copyWith =>
      __$$DemonstrationRewardImplCopyWithImpl<_$DemonstrationRewardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DemonstrationRewardImplToJson(
      this,
    );
  }
}

abstract class _DemonstrationReward implements DemonstrationReward {
  const factory _DemonstrationReward(
          {required final int time,
          @JsonKey(name: 'max_reward') required final int maxReward}) =
      _$DemonstrationRewardImpl;

  factory _DemonstrationReward.fromJson(Map<String, dynamic> json) =
      _$DemonstrationRewardImpl.fromJson;

  @override
  int get time;
  @override
  @JsonKey(name: 'max_reward')
  int get maxReward;

  /// Create a copy of DemonstrationReward
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DemonstrationRewardImplCopyWith<_$DemonstrationRewardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
