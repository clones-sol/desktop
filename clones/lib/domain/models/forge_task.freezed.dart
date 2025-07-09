// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forge_task/forge_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForgeTask _$ForgeTaskFromJson(Map<String, dynamic> json) {
  return _ForgeTask.fromJson(json);
}

/// @nodoc
mixin _$ForgeTask {
  String get id => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;
  int get uploadLimit => throw _privateConstructorUsedError;
  int get rewardLimit => throw _privateConstructorUsedError;
  bool get uploadLimitReached => throw _privateConstructorUsedError;
  int get currentSubmissions => throw _privateConstructorUsedError;
  String get limitReason => throw _privateConstructorUsedError;
  ForgeApp get app => throw _privateConstructorUsedError;

  /// Serializes this ForgeTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForgeTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgeTaskCopyWith<ForgeTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgeTaskCopyWith<$Res> {
  factory $ForgeTaskCopyWith(ForgeTask value, $Res Function(ForgeTask) then) =
      _$ForgeTaskCopyWithImpl<$Res, ForgeTask>;
  @useResult
  $Res call(
      {String id,
      String prompt,
      int uploadLimit,
      int rewardLimit,
      bool uploadLimitReached,
      int currentSubmissions,
      String limitReason,
      ForgeApp app});

  $ForgeAppCopyWith<$Res> get app;
}

/// @nodoc
class _$ForgeTaskCopyWithImpl<$Res, $Val extends ForgeTask>
    implements $ForgeTaskCopyWith<$Res> {
  _$ForgeTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgeTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prompt = null,
    Object? uploadLimit = null,
    Object? rewardLimit = null,
    Object? uploadLimitReached = null,
    Object? currentSubmissions = null,
    Object? limitReason = null,
    Object? app = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      uploadLimit: null == uploadLimit
          ? _value.uploadLimit
          : uploadLimit // ignore: cast_nullable_to_non_nullable
              as int,
      rewardLimit: null == rewardLimit
          ? _value.rewardLimit
          : rewardLimit // ignore: cast_nullable_to_non_nullable
              as int,
      uploadLimitReached: null == uploadLimitReached
          ? _value.uploadLimitReached
          : uploadLimitReached // ignore: cast_nullable_to_non_nullable
              as bool,
      currentSubmissions: null == currentSubmissions
          ? _value.currentSubmissions
          : currentSubmissions // ignore: cast_nullable_to_non_nullable
              as int,
      limitReason: null == limitReason
          ? _value.limitReason
          : limitReason // ignore: cast_nullable_to_non_nullable
              as String,
      app: null == app
          ? _value.app
          : app // ignore: cast_nullable_to_non_nullable
              as ForgeApp,
    ) as $Val);
  }

  /// Create a copy of ForgeTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ForgeAppCopyWith<$Res> get app {
    return $ForgeAppCopyWith<$Res>(_value.app, (value) {
      return _then(_value.copyWith(app: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForgeTaskImplCopyWith<$Res>
    implements $ForgeTaskCopyWith<$Res> {
  factory _$$ForgeTaskImplCopyWith(
          _$ForgeTaskImpl value, $Res Function(_$ForgeTaskImpl) then) =
      __$$ForgeTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String prompt,
      int uploadLimit,
      int rewardLimit,
      bool uploadLimitReached,
      int currentSubmissions,
      String limitReason,
      ForgeApp app});

  @override
  $ForgeAppCopyWith<$Res> get app;
}

/// @nodoc
class __$$ForgeTaskImplCopyWithImpl<$Res>
    extends _$ForgeTaskCopyWithImpl<$Res, _$ForgeTaskImpl>
    implements _$$ForgeTaskImplCopyWith<$Res> {
  __$$ForgeTaskImplCopyWithImpl(
      _$ForgeTaskImpl _value, $Res Function(_$ForgeTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgeTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prompt = null,
    Object? uploadLimit = null,
    Object? rewardLimit = null,
    Object? uploadLimitReached = null,
    Object? currentSubmissions = null,
    Object? limitReason = null,
    Object? app = null,
  }) {
    return _then(_$ForgeTaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      uploadLimit: null == uploadLimit
          ? _value.uploadLimit
          : uploadLimit // ignore: cast_nullable_to_non_nullable
              as int,
      rewardLimit: null == rewardLimit
          ? _value.rewardLimit
          : rewardLimit // ignore: cast_nullable_to_non_nullable
              as int,
      uploadLimitReached: null == uploadLimitReached
          ? _value.uploadLimitReached
          : uploadLimitReached // ignore: cast_nullable_to_non_nullable
              as bool,
      currentSubmissions: null == currentSubmissions
          ? _value.currentSubmissions
          : currentSubmissions // ignore: cast_nullable_to_non_nullable
              as int,
      limitReason: null == limitReason
          ? _value.limitReason
          : limitReason // ignore: cast_nullable_to_non_nullable
              as String,
      app: null == app
          ? _value.app
          : app // ignore: cast_nullable_to_non_nullable
              as ForgeApp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgeTaskImpl implements _ForgeTask {
  const _$ForgeTaskImpl(
      {required this.id,
      required this.prompt,
      required this.uploadLimit,
      required this.rewardLimit,
      required this.uploadLimitReached,
      required this.currentSubmissions,
      required this.limitReason,
      required this.app});

  factory _$ForgeTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgeTaskImplFromJson(json);

  @override
  final String id;
  @override
  final String prompt;
  @override
  final int uploadLimit;
  @override
  final int rewardLimit;
  @override
  final bool uploadLimitReached;
  @override
  final int currentSubmissions;
  @override
  final String limitReason;
  @override
  final ForgeApp app;

  @override
  String toString() {
    return 'ForgeTask(id: $id, prompt: $prompt, uploadLimit: $uploadLimit, rewardLimit: $rewardLimit, uploadLimitReached: $uploadLimitReached, currentSubmissions: $currentSubmissions, limitReason: $limitReason, app: $app)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgeTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.uploadLimit, uploadLimit) ||
                other.uploadLimit == uploadLimit) &&
            (identical(other.rewardLimit, rewardLimit) ||
                other.rewardLimit == rewardLimit) &&
            (identical(other.uploadLimitReached, uploadLimitReached) ||
                other.uploadLimitReached == uploadLimitReached) &&
            (identical(other.currentSubmissions, currentSubmissions) ||
                other.currentSubmissions == currentSubmissions) &&
            (identical(other.limitReason, limitReason) ||
                other.limitReason == limitReason) &&
            (identical(other.app, app) || other.app == app));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, prompt, uploadLimit,
      rewardLimit, uploadLimitReached, currentSubmissions, limitReason, app);

  /// Create a copy of ForgeTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgeTaskImplCopyWith<_$ForgeTaskImpl> get copyWith =>
      __$$ForgeTaskImplCopyWithImpl<_$ForgeTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgeTaskImplToJson(
      this,
    );
  }
}

abstract class _ForgeTask implements ForgeTask {
  const factory _ForgeTask(
      {required final String id,
      required final String prompt,
      required final int uploadLimit,
      required final int rewardLimit,
      required final bool uploadLimitReached,
      required final int currentSubmissions,
      required final String limitReason,
      required final ForgeApp app}) = _$ForgeTaskImpl;

  factory _ForgeTask.fromJson(Map<String, dynamic> json) =
      _$ForgeTaskImpl.fromJson;

  @override
  String get id;
  @override
  String get prompt;
  @override
  int get uploadLimit;
  @override
  int get rewardLimit;
  @override
  bool get uploadLimitReached;
  @override
  int get currentSubmissions;
  @override
  String get limitReason;
  @override
  ForgeApp get app;

  /// Create a copy of ForgeTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgeTaskImplCopyWith<_$ForgeTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
