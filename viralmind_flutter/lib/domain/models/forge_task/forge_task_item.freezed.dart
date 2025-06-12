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
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;
  int? get uploadLimit => throw _privateConstructorUsedError;
  int? get rewardLimit => throw _privateConstructorUsedError;
  bool? get completed => throw _privateConstructorUsedError;
  String? get recordingId => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;
  bool? get uploadLimitReached => throw _privateConstructorUsedError;
  int? get currentSubmissions => throw _privateConstructorUsedError;
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
      {@JsonKey(name: '_id') String? id,
      String prompt,
      int? uploadLimit,
      int? rewardLimit,
      bool? completed,
      String? recordingId,
      double? score,
      bool? uploadLimitReached,
      int? currentSubmissions,
      String? limitReason});
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
              as double?,
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
      {@JsonKey(name: '_id') String? id,
      String prompt,
      int? uploadLimit,
      int? rewardLimit,
      bool? completed,
      String? recordingId,
      double? score,
      bool? uploadLimitReached,
      int? currentSubmissions,
      String? limitReason});
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
              as double?,
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
      {@JsonKey(name: '_id') this.id,
      required this.prompt,
      this.uploadLimit,
      this.rewardLimit,
      this.completed,
      this.recordingId,
      this.score,
      this.uploadLimitReached,
      this.currentSubmissions,
      this.limitReason});

  factory _$ForgeTaskItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgeTaskItemImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String prompt;
  @override
  final int? uploadLimit;
  @override
  final int? rewardLimit;
  @override
  final bool? completed;
  @override
  final String? recordingId;
  @override
  final double? score;
  @override
  final bool? uploadLimitReached;
  @override
  final int? currentSubmissions;
  @override
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
      {@JsonKey(name: '_id') final String? id,
      required final String prompt,
      final int? uploadLimit,
      final int? rewardLimit,
      final bool? completed,
      final String? recordingId,
      final double? score,
      final bool? uploadLimitReached,
      final int? currentSubmissions,
      final String? limitReason}) = _$ForgeTaskItemImpl;

  factory _ForgeTaskItem.fromJson(Map<String, dynamic> json) =
      _$ForgeTaskItemImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String get prompt;
  @override
  int? get uploadLimit;
  @override
  int? get rewardLimit;
  @override
  bool? get completed;
  @override
  String? get recordingId;
  @override
  double? get score;
  @override
  bool? get uploadLimitReached;
  @override
  int? get currentSubmissions;
  @override
  String? get limitReason;

  /// Create a copy of ForgeTaskItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgeTaskItemImplCopyWith<_$ForgeTaskItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
