// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_part.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessagePart _$MessagePartFromJson(Map<String, dynamic> json) {
  return _MessagePart.fromJson(json);
}

/// @nodoc
mixin _$MessagePart {
  QuestInfo? get quest => throw _privateConstructorUsedError;
  List<MessageAction>? get actions => throw _privateConstructorUsedError;
  MessagePartType get type => throw _privateConstructorUsedError;
  dynamic get content => throw _privateConstructorUsedError;

  /// Serializes this MessagePart to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessagePart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessagePartCopyWith<MessagePart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagePartCopyWith<$Res> {
  factory $MessagePartCopyWith(
          MessagePart value, $Res Function(MessagePart) then) =
      _$MessagePartCopyWithImpl<$Res, MessagePart>;
  @useResult
  $Res call(
      {QuestInfo? quest,
      List<MessageAction>? actions,
      MessagePartType type,
      dynamic content});

  $QuestInfoCopyWith<$Res>? get quest;
}

/// @nodoc
class _$MessagePartCopyWithImpl<$Res, $Val extends MessagePart>
    implements $MessagePartCopyWith<$Res> {
  _$MessagePartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessagePart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quest = freezed,
    Object? actions = freezed,
    Object? type = null,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      quest: freezed == quest
          ? _value.quest
          : quest // ignore: cast_nullable_to_non_nullable
              as QuestInfo?,
      actions: freezed == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<MessageAction>?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessagePartType,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of MessagePart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestInfoCopyWith<$Res>? get quest {
    if (_value.quest == null) {
      return null;
    }

    return $QuestInfoCopyWith<$Res>(_value.quest!, (value) {
      return _then(_value.copyWith(quest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessagePartImplCopyWith<$Res>
    implements $MessagePartCopyWith<$Res> {
  factory _$$MessagePartImplCopyWith(
          _$MessagePartImpl value, $Res Function(_$MessagePartImpl) then) =
      __$$MessagePartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {QuestInfo? quest,
      List<MessageAction>? actions,
      MessagePartType type,
      dynamic content});

  @override
  $QuestInfoCopyWith<$Res>? get quest;
}

/// @nodoc
class __$$MessagePartImplCopyWithImpl<$Res>
    extends _$MessagePartCopyWithImpl<$Res, _$MessagePartImpl>
    implements _$$MessagePartImplCopyWith<$Res> {
  __$$MessagePartImplCopyWithImpl(
      _$MessagePartImpl _value, $Res Function(_$MessagePartImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessagePart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quest = freezed,
    Object? actions = freezed,
    Object? type = null,
    Object? content = freezed,
  }) {
    return _then(_$MessagePartImpl(
      quest: freezed == quest
          ? _value.quest
          : quest // ignore: cast_nullable_to_non_nullable
              as QuestInfo?,
      actions: freezed == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<MessageAction>?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessagePartType,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessagePartImpl implements _MessagePart {
  const _$MessagePartImpl(
      {this.quest,
      final List<MessageAction>? actions,
      required this.type,
      required this.content})
      : _actions = actions;

  factory _$MessagePartImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessagePartImplFromJson(json);

  @override
  final QuestInfo? quest;
  final List<MessageAction>? _actions;
  @override
  List<MessageAction>? get actions {
    final value = _actions;
    if (value == null) return null;
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final MessagePartType type;
  @override
  final dynamic content;

  @override
  String toString() {
    return 'MessagePart(quest: $quest, actions: $actions, type: $type, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagePartImpl &&
            (identical(other.quest, quest) || other.quest == quest) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      quest,
      const DeepCollectionEquality().hash(_actions),
      type,
      const DeepCollectionEquality().hash(content));

  /// Create a copy of MessagePart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagePartImplCopyWith<_$MessagePartImpl> get copyWith =>
      __$$MessagePartImplCopyWithImpl<_$MessagePartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessagePartImplToJson(
      this,
    );
  }
}

abstract class _MessagePart implements MessagePart {
  const factory _MessagePart(
      {final QuestInfo? quest,
      final List<MessageAction>? actions,
      required final MessagePartType type,
      required final dynamic content}) = _$MessagePartImpl;

  factory _MessagePart.fromJson(Map<String, dynamic> json) =
      _$MessagePartImpl.fromJson;

  @override
  QuestInfo? get quest;
  @override
  List<MessageAction>? get actions;
  @override
  MessagePartType get type;
  @override
  dynamic get content;

  /// Create a copy of MessagePart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessagePartImplCopyWith<_$MessagePartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
