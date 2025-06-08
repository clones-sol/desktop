// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_leader_board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkerLeaderboard _$WorkerLeaderboardFromJson(Map<String, dynamic> json) {
  return _WorkerLeaderboard.fromJson(json);
}

/// @nodoc
mixin _$WorkerLeaderboard {
  int get rank => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  int get tasks => throw _privateConstructorUsedError;
  double get rewards => throw _privateConstructorUsedError;
  double get avgScore => throw _privateConstructorUsedError;

  /// Serializes this WorkerLeaderboard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkerLeaderboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkerLeaderboardCopyWith<WorkerLeaderboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkerLeaderboardCopyWith<$Res> {
  factory $WorkerLeaderboardCopyWith(
          WorkerLeaderboard value, $Res Function(WorkerLeaderboard) then) =
      _$WorkerLeaderboardCopyWithImpl<$Res, WorkerLeaderboard>;
  @useResult
  $Res call(
      {int rank,
      String address,
      String? nickname,
      int tasks,
      double rewards,
      double avgScore});
}

/// @nodoc
class _$WorkerLeaderboardCopyWithImpl<$Res, $Val extends WorkerLeaderboard>
    implements $WorkerLeaderboardCopyWith<$Res> {
  _$WorkerLeaderboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkerLeaderboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? address = null,
    Object? nickname = freezed,
    Object? tasks = null,
    Object? rewards = null,
    Object? avgScore = null,
  }) {
    return _then(_value.copyWith(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as int,
      rewards: null == rewards
          ? _value.rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as double,
      avgScore: null == avgScore
          ? _value.avgScore
          : avgScore // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkerLeaderboardImplCopyWith<$Res>
    implements $WorkerLeaderboardCopyWith<$Res> {
  factory _$$WorkerLeaderboardImplCopyWith(_$WorkerLeaderboardImpl value,
          $Res Function(_$WorkerLeaderboardImpl) then) =
      __$$WorkerLeaderboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int rank,
      String address,
      String? nickname,
      int tasks,
      double rewards,
      double avgScore});
}

/// @nodoc
class __$$WorkerLeaderboardImplCopyWithImpl<$Res>
    extends _$WorkerLeaderboardCopyWithImpl<$Res, _$WorkerLeaderboardImpl>
    implements _$$WorkerLeaderboardImplCopyWith<$Res> {
  __$$WorkerLeaderboardImplCopyWithImpl(_$WorkerLeaderboardImpl _value,
      $Res Function(_$WorkerLeaderboardImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkerLeaderboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? address = null,
    Object? nickname = freezed,
    Object? tasks = null,
    Object? rewards = null,
    Object? avgScore = null,
  }) {
    return _then(_$WorkerLeaderboardImpl(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as int,
      rewards: null == rewards
          ? _value.rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as double,
      avgScore: null == avgScore
          ? _value.avgScore
          : avgScore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkerLeaderboardImpl implements _WorkerLeaderboard {
  const _$WorkerLeaderboardImpl(
      {required this.rank,
      required this.address,
      this.nickname,
      required this.tasks,
      required this.rewards,
      required this.avgScore});

  factory _$WorkerLeaderboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkerLeaderboardImplFromJson(json);

  @override
  final int rank;
  @override
  final String address;
  @override
  final String? nickname;
  @override
  final int tasks;
  @override
  final double rewards;
  @override
  final double avgScore;

  @override
  String toString() {
    return 'WorkerLeaderboard(rank: $rank, address: $address, nickname: $nickname, tasks: $tasks, rewards: $rewards, avgScore: $avgScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkerLeaderboardImpl &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.tasks, tasks) || other.tasks == tasks) &&
            (identical(other.rewards, rewards) || other.rewards == rewards) &&
            (identical(other.avgScore, avgScore) ||
                other.avgScore == avgScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, rank, address, nickname, tasks, rewards, avgScore);

  /// Create a copy of WorkerLeaderboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkerLeaderboardImplCopyWith<_$WorkerLeaderboardImpl> get copyWith =>
      __$$WorkerLeaderboardImplCopyWithImpl<_$WorkerLeaderboardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkerLeaderboardImplToJson(
      this,
    );
  }
}

abstract class _WorkerLeaderboard implements WorkerLeaderboard {
  const factory _WorkerLeaderboard(
      {required final int rank,
      required final String address,
      final String? nickname,
      required final int tasks,
      required final double rewards,
      required final double avgScore}) = _$WorkerLeaderboardImpl;

  factory _WorkerLeaderboard.fromJson(Map<String, dynamic> json) =
      _$WorkerLeaderboardImpl.fromJson;

  @override
  int get rank;
  @override
  String get address;
  @override
  String? get nickname;
  @override
  int get tasks;
  @override
  double get rewards;
  @override
  double get avgScore;

  /// Create a copy of WorkerLeaderboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkerLeaderboardImplCopyWith<_$WorkerLeaderboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
