// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Quest _$QuestFromJson(Map<String, dynamic> json) {
  return _Quest.fromJson(json);
}

/// @nodoc
mixin _$Quest {
  String get title => throw _privateConstructorUsedError;
  String get app => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;
  List<String> get objectives => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get poolId => throw _privateConstructorUsedError;
  RewardInfo? get reward => throw _privateConstructorUsedError;
  String? get taskId => throw _privateConstructorUsedError;

  /// Serializes this Quest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestCopyWith<Quest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestCopyWith<$Res> {
  factory $QuestCopyWith(Quest value, $Res Function(Quest) then) =
      _$QuestCopyWithImpl<$Res, Quest>;
  @useResult
  $Res call({
    String title,
    String app,
    String iconUrl,
    List<String> objectives,
    String content,
    String? poolId,
    RewardInfo? reward,
    String? taskId,
  });

  $RewardInfoCopyWith<$Res>? get reward;
}

/// @nodoc
class _$QuestCopyWithImpl<$Res, $Val extends Quest>
    implements $QuestCopyWith<$Res> {
  _$QuestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? app = null,
    Object? iconUrl = null,
    Object? objectives = null,
    Object? content = null,
    Object? poolId = freezed,
    Object? reward = freezed,
    Object? taskId = freezed,
  }) {
    return _then(
      _value.copyWith(
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            app:
                null == app
                    ? _value.app
                    : app // ignore: cast_nullable_to_non_nullable
                        as String,
            iconUrl:
                null == iconUrl
                    ? _value.iconUrl
                    : iconUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            objectives:
                null == objectives
                    ? _value.objectives
                    : objectives // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            content:
                null == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as String,
            poolId:
                freezed == poolId
                    ? _value.poolId
                    : poolId // ignore: cast_nullable_to_non_nullable
                        as String?,
            reward:
                freezed == reward
                    ? _value.reward
                    : reward // ignore: cast_nullable_to_non_nullable
                        as RewardInfo?,
            taskId:
                freezed == taskId
                    ? _value.taskId
                    : taskId // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RewardInfoCopyWith<$Res>? get reward {
    if (_value.reward == null) {
      return null;
    }

    return $RewardInfoCopyWith<$Res>(_value.reward!, (value) {
      return _then(_value.copyWith(reward: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuestImplCopyWith<$Res> implements $QuestCopyWith<$Res> {
  factory _$$QuestImplCopyWith(
    _$QuestImpl value,
    $Res Function(_$QuestImpl) then,
  ) = __$$QuestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String app,
    String iconUrl,
    List<String> objectives,
    String content,
    String? poolId,
    RewardInfo? reward,
    String? taskId,
  });

  @override
  $RewardInfoCopyWith<$Res>? get reward;
}

/// @nodoc
class __$$QuestImplCopyWithImpl<$Res>
    extends _$QuestCopyWithImpl<$Res, _$QuestImpl>
    implements _$$QuestImplCopyWith<$Res> {
  __$$QuestImplCopyWithImpl(
    _$QuestImpl _value,
    $Res Function(_$QuestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? app = null,
    Object? iconUrl = null,
    Object? objectives = null,
    Object? content = null,
    Object? poolId = freezed,
    Object? reward = freezed,
    Object? taskId = freezed,
  }) {
    return _then(
      _$QuestImpl(
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        app:
            null == app
                ? _value.app
                : app // ignore: cast_nullable_to_non_nullable
                    as String,
        iconUrl:
            null == iconUrl
                ? _value.iconUrl
                : iconUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        objectives:
            null == objectives
                ? _value._objectives
                : objectives // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        content:
            null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                    as String,
        poolId:
            freezed == poolId
                ? _value.poolId
                : poolId // ignore: cast_nullable_to_non_nullable
                    as String?,
        reward:
            freezed == reward
                ? _value.reward
                : reward // ignore: cast_nullable_to_non_nullable
                    as RewardInfo?,
        taskId:
            freezed == taskId
                ? _value.taskId
                : taskId // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestImpl implements _Quest {
  const _$QuestImpl({
    required this.title,
    required this.app,
    required this.iconUrl,
    required final List<String> objectives,
    required this.content,
    this.poolId,
    this.reward,
    this.taskId,
  }) : _objectives = objectives;

  factory _$QuestImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestImplFromJson(json);

  @override
  final String title;
  @override
  final String app;
  @override
  final String iconUrl;
  final List<String> _objectives;
  @override
  List<String> get objectives {
    if (_objectives is EqualUnmodifiableListView) return _objectives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_objectives);
  }

  @override
  final String content;
  @override
  final String? poolId;
  @override
  final RewardInfo? reward;
  @override
  final String? taskId;

  @override
  String toString() {
    return 'Quest(title: $title, app: $app, iconUrl: $iconUrl, objectives: $objectives, content: $content, poolId: $poolId, reward: $reward, taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.app, app) || other.app == app) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            const DeepCollectionEquality().equals(
              other._objectives,
              _objectives,
            ) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.poolId, poolId) || other.poolId == poolId) &&
            (identical(other.reward, reward) || other.reward == reward) &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    app,
    iconUrl,
    const DeepCollectionEquality().hash(_objectives),
    content,
    poolId,
    reward,
    taskId,
  );

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestImplCopyWith<_$QuestImpl> get copyWith =>
      __$$QuestImplCopyWithImpl<_$QuestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestImplToJson(this);
  }
}

abstract class _Quest implements Quest {
  const factory _Quest({
    required final String title,
    required final String app,
    required final String iconUrl,
    required final List<String> objectives,
    required final String content,
    final String? poolId,
    final RewardInfo? reward,
    final String? taskId,
  }) = _$QuestImpl;

  factory _Quest.fromJson(Map<String, dynamic> json) = _$QuestImpl.fromJson;

  @override
  String get title;
  @override
  String get app;
  @override
  String get iconUrl;
  @override
  List<String> get objectives;
  @override
  String get content;
  @override
  String? get poolId;
  @override
  RewardInfo? get reward;
  @override
  String? get taskId;

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestImplCopyWith<_$QuestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
    RewardInfo value,
    $Res Function(RewardInfo) then,
  ) = _$RewardInfoCopyWithImpl<$Res, RewardInfo>;
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
  $Res call({Object? time = null, Object? maxReward = null}) {
    return _then(
      _value.copyWith(
            time:
                null == time
                    ? _value.time
                    : time // ignore: cast_nullable_to_non_nullable
                        as int,
            maxReward:
                null == maxReward
                    ? _value.maxReward
                    : maxReward // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RewardInfoImplCopyWith<$Res>
    implements $RewardInfoCopyWith<$Res> {
  factory _$$RewardInfoImplCopyWith(
    _$RewardInfoImpl value,
    $Res Function(_$RewardInfoImpl) then,
  ) = __$$RewardInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int time, int maxReward});
}

/// @nodoc
class __$$RewardInfoImplCopyWithImpl<$Res>
    extends _$RewardInfoCopyWithImpl<$Res, _$RewardInfoImpl>
    implements _$$RewardInfoImplCopyWith<$Res> {
  __$$RewardInfoImplCopyWithImpl(
    _$RewardInfoImpl _value,
    $Res Function(_$RewardInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RewardInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? time = null, Object? maxReward = null}) {
    return _then(
      _$RewardInfoImpl(
        time:
            null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                    as int,
        maxReward:
            null == maxReward
                ? _value.maxReward
                : maxReward // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
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
    return _$$RewardInfoImplToJson(this);
  }
}

abstract class _RewardInfo implements RewardInfo {
  const factory _RewardInfo({
    required final int time,
    required final int maxReward,
  }) = _$RewardInfoImpl;

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
