// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forge_task_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForgeTaskItem _$ForgeTaskItemFromJson(Map<String, dynamic> json) {
  return _ForgeTaskItem.fromJson(json);
}

/// @nodoc
mixin _$ForgeTaskItem {
  @JsonKey(name: '_id', includeIfNull: false)
  String? get id => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int? get uploadLimit => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int? get rewardLimit => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  bool? get completed => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get recordingId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int? get score => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  bool? get uploadLimitReached => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int? get currentSubmissions => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get limitReason => throw _privateConstructorUsedError;

  /// Serializes this ForgeTaskItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForgeTaskItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgeTaskItemCopyWith<ForgeTaskItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgeTaskItemCopyWith<$Res> {
  factory $ForgeTaskItemCopyWith(
          ForgeTaskItem value, $Res Function(ForgeTaskItem) then) =
      _$ForgeTaskItemCopyWithImpl<$Res, ForgeTaskItem>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id', includeIfNull: false) String? id,
      String prompt,
      @JsonKey(includeIfNull: false) int? uploadLimit,
      @JsonKey(includeIfNull: false) int? rewardLimit,
      @JsonKey(includeIfNull: false) bool? completed,
      @JsonKey(includeIfNull: false) String? recordingId,
      @JsonKey(includeIfNull: false) int? score,
      @JsonKey(includeIfNull: false) bool? uploadLimitReached,
      @JsonKey(includeIfNull: false) int? currentSubmissions,
      @JsonKey(includeIfNull: false) String? limitReason});
}

/// @nodoc
class _$ForgeTaskItemCopyWithImpl<$Res, $Val extends ForgeTaskItem>
    implements $ForgeTaskItemCopyWith<$Res> {
  _$ForgeTaskItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgeTaskItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prompt = null,
    Object? uploadLimit = freezed,
    Object? rewardLimit = freezed,
    Object? completed = freezed,
    Object? recordingId = freezed,
    Object? score = freezed,
    Object? uploadLimitReached = freezed,
    Object? currentSubmissions = freezed,
    Object? limitReason = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      uploadLimit: freezed == uploadLimit
          ? _value.uploadLimit
          : uploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      rewardLimit: freezed == rewardLimit
          ? _value.rewardLimit
          : rewardLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
      recordingId: freezed == recordingId
          ? _value.recordingId
          : recordingId // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      uploadLimitReached: freezed == uploadLimitReached
          ? _value.uploadLimitReached
          : uploadLimitReached // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentSubmissions: freezed == currentSubmissions
          ? _value.currentSubmissions
          : currentSubmissions // ignore: cast_nullable_to_non_nullable
              as int?,
      limitReason: freezed == limitReason
          ? _value.limitReason
          : limitReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgeTaskItemImplCopyWith<$Res>
    implements $ForgeTaskItemCopyWith<$Res> {
  factory _$$ForgeTaskItemImplCopyWith(
          _$ForgeTaskItemImpl value, $Res Function(_$ForgeTaskItemImpl) then) =
      __$$ForgeTaskItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id', includeIfNull: false) String? id,
      String prompt,
      @JsonKey(includeIfNull: false) int? uploadLimit,
      @JsonKey(includeIfNull: false) int? rewardLimit,
      @JsonKey(includeIfNull: false) bool? completed,
      @JsonKey(includeIfNull: false) String? recordingId,
      @JsonKey(includeIfNull: false) int? score,
      @JsonKey(includeIfNull: false) bool? uploadLimitReached,
      @JsonKey(includeIfNull: false) int? currentSubmissions,
      @JsonKey(includeIfNull: false) String? limitReason});
}

/// @nodoc
class __$$ForgeTaskItemImplCopyWithImpl<$Res>
    extends _$ForgeTaskItemCopyWithImpl<$Res, _$ForgeTaskItemImpl>
    implements _$$ForgeTaskItemImplCopyWith<$Res> {
  __$$ForgeTaskItemImplCopyWithImpl(
      _$ForgeTaskItemImpl _value, $Res Function(_$ForgeTaskItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgeTaskItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prompt = null,
    Object? uploadLimit = freezed,
    Object? rewardLimit = freezed,
    Object? completed = freezed,
    Object? recordingId = freezed,
    Object? score = freezed,
    Object? uploadLimitReached = freezed,
    Object? currentSubmissions = freezed,
    Object? limitReason = freezed,
  }) {
    return _then(_$ForgeTaskItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      uploadLimit: freezed == uploadLimit
          ? _value.uploadLimit
          : uploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      rewardLimit: freezed == rewardLimit
          ? _value.rewardLimit
          : rewardLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
      recordingId: freezed == recordingId
          ? _value.recordingId
          : recordingId // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      uploadLimitReached: freezed == uploadLimitReached
          ? _value.uploadLimitReached
          : uploadLimitReached // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentSubmissions: freezed == currentSubmissions
          ? _value.currentSubmissions
          : currentSubmissions // ignore: cast_nullable_to_non_nullable
              as int?,
      limitReason: freezed == limitReason
          ? _value.limitReason
          : limitReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgeTaskItemImpl implements _ForgeTaskItem {
  const _$ForgeTaskItemImpl(
      {@JsonKey(name: '_id', includeIfNull: false) this.id,
      required this.prompt,
      @JsonKey(includeIfNull: false) this.uploadLimit,
      @JsonKey(includeIfNull: false) this.rewardLimit,
      @JsonKey(includeIfNull: false) this.completed,
      @JsonKey(includeIfNull: false) this.recordingId,
      @JsonKey(includeIfNull: false) this.score,
      @JsonKey(includeIfNull: false) this.uploadLimitReached,
      @JsonKey(includeIfNull: false) this.currentSubmissions,
      @JsonKey(includeIfNull: false) this.limitReason});

  factory _$ForgeTaskItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgeTaskItemImplFromJson(json);

  @override
  @JsonKey(name: '_id', includeIfNull: false)
  final String? id;
  @override
  final String prompt;
  @override
  @JsonKey(includeIfNull: false)
  final int? uploadLimit;
  @override
  @JsonKey(includeIfNull: false)
  final int? rewardLimit;
  @override
  @JsonKey(includeIfNull: false)
  final bool? completed;
  @override
  @JsonKey(includeIfNull: false)
  final String? recordingId;
  @override
  @JsonKey(includeIfNull: false)
  final int? score;
  @override
  @JsonKey(includeIfNull: false)
  final bool? uploadLimitReached;
  @override
  @JsonKey(includeIfNull: false)
  final int? currentSubmissions;
  @override
  @JsonKey(includeIfNull: false)
  final String? limitReason;

  @override
  String toString() {
    return 'ForgeTaskItem(id: $id, prompt: $prompt, uploadLimit: $uploadLimit, rewardLimit: $rewardLimit, completed: $completed, recordingId: $recordingId, score: $score, uploadLimitReached: $uploadLimitReached, currentSubmissions: $currentSubmissions, limitReason: $limitReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgeTaskItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.uploadLimit, uploadLimit) ||
                other.uploadLimit == uploadLimit) &&
            (identical(other.rewardLimit, rewardLimit) ||
                other.rewardLimit == rewardLimit) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.recordingId, recordingId) ||
                other.recordingId == recordingId) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.uploadLimitReached, uploadLimitReached) ||
                other.uploadLimitReached == uploadLimitReached) &&
            (identical(other.currentSubmissions, currentSubmissions) ||
                other.currentSubmissions == currentSubmissions) &&
            (identical(other.limitReason, limitReason) ||
                other.limitReason == limitReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      prompt,
      uploadLimit,
      rewardLimit,
      completed,
      recordingId,
      score,
      uploadLimitReached,
      currentSubmissions,
      limitReason);

  /// Create a copy of ForgeTaskItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgeTaskItemImplCopyWith<_$ForgeTaskItemImpl> get copyWith =>
      __$$ForgeTaskItemImplCopyWithImpl<_$ForgeTaskItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgeTaskItemImplToJson(
      this,
    );
  }
}

abstract class _ForgeTaskItem implements ForgeTaskItem {
  const factory _ForgeTaskItem(
          {@JsonKey(name: '_id', includeIfNull: false) final String? id,
          required final String prompt,
          @JsonKey(includeIfNull: false) final int? uploadLimit,
          @JsonKey(includeIfNull: false) final int? rewardLimit,
          @JsonKey(includeIfNull: false) final bool? completed,
          @JsonKey(includeIfNull: false) final String? recordingId,
          @JsonKey(includeIfNull: false) final int? score,
          @JsonKey(includeIfNull: false) final bool? uploadLimitReached,
          @JsonKey(includeIfNull: false) final int? currentSubmissions,
          @JsonKey(includeIfNull: false) final String? limitReason}) =
      _$ForgeTaskItemImpl;

  factory _ForgeTaskItem.fromJson(Map<String, dynamic> json) =
      _$ForgeTaskItemImpl.fromJson;

  @override
  @JsonKey(name: '_id', includeIfNull: false)
  String? get id;
  @override
  String get prompt;
  @override
  @JsonKey(includeIfNull: false)
  int? get uploadLimit;
  @override
  @JsonKey(includeIfNull: false)
  int? get rewardLimit;
  @override
  @JsonKey(includeIfNull: false)
  bool? get completed;
  @override
  @JsonKey(includeIfNull: false)
  String? get recordingId;
  @override
  @JsonKey(includeIfNull: false)
  int? get score;
  @override
  @JsonKey(includeIfNull: false)
  bool? get uploadLimitReached;
  @override
  @JsonKey(includeIfNull: false)
  int? get currentSubmissions;
  @override
  @JsonKey(includeIfNull: false)
  String? get limitReason;

  /// Create a copy of ForgeTaskItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgeTaskItemImplCopyWith<_$ForgeTaskItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
