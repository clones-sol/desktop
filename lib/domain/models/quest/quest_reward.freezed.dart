// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quest_reward.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestReward _$QuestRewardFromJson(Map<String, dynamic> json) {
  return _QuestReward.fromJson(json);
}

/// @nodoc
mixin _$QuestReward {
  int get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_reward')
  int get maxReward => throw _privateConstructorUsedError;

  /// Serializes this QuestReward to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestReward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestRewardCopyWith<QuestReward> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestRewardCopyWith<$Res> {
  factory $QuestRewardCopyWith(
          QuestReward value, $Res Function(QuestReward) then) =
      _$QuestRewardCopyWithImpl<$Res, QuestReward>;
  @useResult
  $Res call({int time, @JsonKey(name: 'max_reward') int maxReward});
}

/// @nodoc
class _$QuestRewardCopyWithImpl<$Res, $Val extends QuestReward>
    implements $QuestRewardCopyWith<$Res> {
  _$QuestRewardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestReward
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
abstract class _$$QuestRewardImplCopyWith<$Res>
    implements $QuestRewardCopyWith<$Res> {
  factory _$$QuestRewardImplCopyWith(
          _$QuestRewardImpl value, $Res Function(_$QuestRewardImpl) then) =
      __$$QuestRewardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int time, @JsonKey(name: 'max_reward') int maxReward});
}

/// @nodoc
class __$$QuestRewardImplCopyWithImpl<$Res>
    extends _$QuestRewardCopyWithImpl<$Res, _$QuestRewardImpl>
    implements _$$QuestRewardImplCopyWith<$Res> {
  __$$QuestRewardImplCopyWithImpl(
      _$QuestRewardImpl _value, $Res Function(_$QuestRewardImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestReward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? maxReward = null,
  }) {
    return _then(_$QuestRewardImpl(
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
class _$QuestRewardImpl implements _QuestReward {
  const _$QuestRewardImpl(
      {required this.time,
      @JsonKey(name: 'max_reward') required this.maxReward});

  factory _$QuestRewardImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestRewardImplFromJson(json);

  @override
  final int time;
  @override
  @JsonKey(name: 'max_reward')
  final int maxReward;

  @override
  String toString() {
    return 'QuestReward(time: $time, maxReward: $maxReward)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestRewardImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.maxReward, maxReward) ||
                other.maxReward == maxReward));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, maxReward);

  /// Create a copy of QuestReward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestRewardImplCopyWith<_$QuestRewardImpl> get copyWith =>
      __$$QuestRewardImplCopyWithImpl<_$QuestRewardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestRewardImplToJson(
      this,
    );
  }
}

abstract class _QuestReward implements QuestReward {
  const factory _QuestReward(
          {required final int time,
          @JsonKey(name: 'max_reward') required final int maxReward}) =
      _$QuestRewardImpl;

  factory _QuestReward.fromJson(Map<String, dynamic> json) =
      _$QuestRewardImpl.fromJson;

  @override
  int get time;
  @override
  @JsonKey(name: 'max_reward')
  int get maxReward;

  /// Create a copy of QuestReward
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestRewardImplCopyWith<_$QuestRewardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
