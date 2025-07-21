// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forge_leader_board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForgeLeaderboard _$ForgeLeaderboardFromJson(Map<String, dynamic> json) {
  return _ForgeLeaderboard.fromJson(json);
}

/// @nodoc
mixin _$ForgeLeaderboard {
  int get rank => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get tasks => throw _privateConstructorUsedError;
  double get payout => throw _privateConstructorUsedError;

  /// Serializes this ForgeLeaderboard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForgeLeaderboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgeLeaderboardCopyWith<ForgeLeaderboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgeLeaderboardCopyWith<$Res> {
  factory $ForgeLeaderboardCopyWith(
          ForgeLeaderboard value, $Res Function(ForgeLeaderboard) then) =
      _$ForgeLeaderboardCopyWithImpl<$Res, ForgeLeaderboard>;
  @useResult
  $Res call({int rank, String name, int tasks, double payout});
}

/// @nodoc
class _$ForgeLeaderboardCopyWithImpl<$Res, $Val extends ForgeLeaderboard>
    implements $ForgeLeaderboardCopyWith<$Res> {
  _$ForgeLeaderboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgeLeaderboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? name = null,
    Object? tasks = null,
    Object? payout = null,
  }) {
    return _then(_value.copyWith(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as int,
      payout: null == payout
          ? _value.payout
          : payout // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgeLeaderboardImplCopyWith<$Res>
    implements $ForgeLeaderboardCopyWith<$Res> {
  factory _$$ForgeLeaderboardImplCopyWith(_$ForgeLeaderboardImpl value,
          $Res Function(_$ForgeLeaderboardImpl) then) =
      __$$ForgeLeaderboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int rank, String name, int tasks, double payout});
}

/// @nodoc
class __$$ForgeLeaderboardImplCopyWithImpl<$Res>
    extends _$ForgeLeaderboardCopyWithImpl<$Res, _$ForgeLeaderboardImpl>
    implements _$$ForgeLeaderboardImplCopyWith<$Res> {
  __$$ForgeLeaderboardImplCopyWithImpl(_$ForgeLeaderboardImpl _value,
      $Res Function(_$ForgeLeaderboardImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgeLeaderboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? name = null,
    Object? tasks = null,
    Object? payout = null,
  }) {
    return _then(_$ForgeLeaderboardImpl(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as int,
      payout: null == payout
          ? _value.payout
          : payout // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgeLeaderboardImpl implements _ForgeLeaderboard {
  const _$ForgeLeaderboardImpl(
      {required this.rank,
      required this.name,
      required this.tasks,
      required this.payout});

  factory _$ForgeLeaderboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgeLeaderboardImplFromJson(json);

  @override
  final int rank;
  @override
  final String name;
  @override
  final int tasks;
  @override
  final double payout;

  @override
  String toString() {
    return 'ForgeLeaderboard(rank: $rank, name: $name, tasks: $tasks, payout: $payout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgeLeaderboardImpl &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tasks, tasks) || other.tasks == tasks) &&
            (identical(other.payout, payout) || other.payout == payout));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rank, name, tasks, payout);

  /// Create a copy of ForgeLeaderboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgeLeaderboardImplCopyWith<_$ForgeLeaderboardImpl> get copyWith =>
      __$$ForgeLeaderboardImplCopyWithImpl<_$ForgeLeaderboardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgeLeaderboardImplToJson(
      this,
    );
  }
}

abstract class _ForgeLeaderboard implements ForgeLeaderboard {
  const factory _ForgeLeaderboard(
      {required final int rank,
      required final String name,
      required final int tasks,
      required final double payout}) = _$ForgeLeaderboardImpl;

  factory _ForgeLeaderboard.fromJson(Map<String, dynamic> json) =
      _$ForgeLeaderboardImpl.fromJson;

  @override
  int get rank;
  @override
  String get name;
  @override
  int get tasks;
  @override
  double get payout;

  /// Create a copy of ForgeLeaderboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgeLeaderboardImplCopyWith<_$ForgeLeaderboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
