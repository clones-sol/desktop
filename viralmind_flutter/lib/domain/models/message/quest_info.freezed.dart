// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quest_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestInfo _$QuestInfoFromJson(Map<String, dynamic> json) {
  return _QuestInfo.fromJson(json);
}

/// @nodoc
mixin _$QuestInfo {
  String get taskId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get originalInstruction => throw _privateConstructorUsedError;
  String get concreteScenario => throw _privateConstructorUsedError;
  String get objective => throw _privateConstructorUsedError;
  List<String> get relevantApplications => throw _privateConstructorUsedError;
  List<String> get subgoals => throw _privateConstructorUsedError;

  /// Serializes this QuestInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestInfoCopyWith<QuestInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestInfoCopyWith<$Res> {
  factory $QuestInfoCopyWith(QuestInfo value, $Res Function(QuestInfo) then) =
      _$QuestInfoCopyWithImpl<$Res, QuestInfo>;
  @useResult
  $Res call(
      {String taskId,
      String title,
      String originalInstruction,
      String concreteScenario,
      String objective,
      List<String> relevantApplications,
      List<String> subgoals});
}

/// @nodoc
class _$QuestInfoCopyWithImpl<$Res, $Val extends QuestInfo>
    implements $QuestInfoCopyWith<$Res> {
  _$QuestInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? title = null,
    Object? originalInstruction = null,
    Object? concreteScenario = null,
    Object? objective = null,
    Object? relevantApplications = null,
    Object? subgoals = null,
  }) {
    return _then(_value.copyWith(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      originalInstruction: null == originalInstruction
          ? _value.originalInstruction
          : originalInstruction // ignore: cast_nullable_to_non_nullable
              as String,
      concreteScenario: null == concreteScenario
          ? _value.concreteScenario
          : concreteScenario // ignore: cast_nullable_to_non_nullable
              as String,
      objective: null == objective
          ? _value.objective
          : objective // ignore: cast_nullable_to_non_nullable
              as String,
      relevantApplications: null == relevantApplications
          ? _value.relevantApplications
          : relevantApplications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subgoals: null == subgoals
          ? _value.subgoals
          : subgoals // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestInfoImplCopyWith<$Res>
    implements $QuestInfoCopyWith<$Res> {
  factory _$$QuestInfoImplCopyWith(
          _$QuestInfoImpl value, $Res Function(_$QuestInfoImpl) then) =
      __$$QuestInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String taskId,
      String title,
      String originalInstruction,
      String concreteScenario,
      String objective,
      List<String> relevantApplications,
      List<String> subgoals});
}

/// @nodoc
class __$$QuestInfoImplCopyWithImpl<$Res>
    extends _$QuestInfoCopyWithImpl<$Res, _$QuestInfoImpl>
    implements _$$QuestInfoImplCopyWith<$Res> {
  __$$QuestInfoImplCopyWithImpl(
      _$QuestInfoImpl _value, $Res Function(_$QuestInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? title = null,
    Object? originalInstruction = null,
    Object? concreteScenario = null,
    Object? objective = null,
    Object? relevantApplications = null,
    Object? subgoals = null,
  }) {
    return _then(_$QuestInfoImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      originalInstruction: null == originalInstruction
          ? _value.originalInstruction
          : originalInstruction // ignore: cast_nullable_to_non_nullable
              as String,
      concreteScenario: null == concreteScenario
          ? _value.concreteScenario
          : concreteScenario // ignore: cast_nullable_to_non_nullable
              as String,
      objective: null == objective
          ? _value.objective
          : objective // ignore: cast_nullable_to_non_nullable
              as String,
      relevantApplications: null == relevantApplications
          ? _value._relevantApplications
          : relevantApplications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subgoals: null == subgoals
          ? _value._subgoals
          : subgoals // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestInfoImpl implements _QuestInfo {
  const _$QuestInfoImpl(
      {required this.taskId,
      required this.title,
      required this.originalInstruction,
      required this.concreteScenario,
      required this.objective,
      required final List<String> relevantApplications,
      required final List<String> subgoals})
      : _relevantApplications = relevantApplications,
        _subgoals = subgoals;

  factory _$QuestInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestInfoImplFromJson(json);

  @override
  final String taskId;
  @override
  final String title;
  @override
  final String originalInstruction;
  @override
  final String concreteScenario;
  @override
  final String objective;
  final List<String> _relevantApplications;
  @override
  List<String> get relevantApplications {
    if (_relevantApplications is EqualUnmodifiableListView)
      return _relevantApplications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relevantApplications);
  }

  final List<String> _subgoals;
  @override
  List<String> get subgoals {
    if (_subgoals is EqualUnmodifiableListView) return _subgoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subgoals);
  }

  @override
  String toString() {
    return 'QuestInfo(taskId: $taskId, title: $title, originalInstruction: $originalInstruction, concreteScenario: $concreteScenario, objective: $objective, relevantApplications: $relevantApplications, subgoals: $subgoals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestInfoImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.originalInstruction, originalInstruction) ||
                other.originalInstruction == originalInstruction) &&
            (identical(other.concreteScenario, concreteScenario) ||
                other.concreteScenario == concreteScenario) &&
            (identical(other.objective, objective) ||
                other.objective == objective) &&
            const DeepCollectionEquality()
                .equals(other._relevantApplications, _relevantApplications) &&
            const DeepCollectionEquality().equals(other._subgoals, _subgoals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      taskId,
      title,
      originalInstruction,
      concreteScenario,
      objective,
      const DeepCollectionEquality().hash(_relevantApplications),
      const DeepCollectionEquality().hash(_subgoals));

  /// Create a copy of QuestInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestInfoImplCopyWith<_$QuestInfoImpl> get copyWith =>
      __$$QuestInfoImplCopyWithImpl<_$QuestInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestInfoImplToJson(
      this,
    );
  }
}

abstract class _QuestInfo implements QuestInfo {
  const factory _QuestInfo(
      {required final String taskId,
      required final String title,
      required final String originalInstruction,
      required final String concreteScenario,
      required final String objective,
      required final List<String> relevantApplications,
      required final List<String> subgoals}) = _$QuestInfoImpl;

  factory _QuestInfo.fromJson(Map<String, dynamic> json) =
      _$QuestInfoImpl.fromJson;

  @override
  String get taskId;
  @override
  String get title;
  @override
  String get originalInstruction;
  @override
  String get concreteScenario;
  @override
  String get objective;
  @override
  List<String> get relevantApplications;
  @override
  List<String> get subgoals;

  /// Create a copy of QuestInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestInfoImplCopyWith<_$QuestInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
