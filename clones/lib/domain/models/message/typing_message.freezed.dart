// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'typing_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TypingMessage _$TypingMessageFromJson(Map<String, dynamic> json) {
  return _TypingMessage.fromJson(json);
}

/// @nodoc
mixin _$TypingMessage {
  String get content => throw _privateConstructorUsedError;
  String get target => throw _privateConstructorUsedError;
  int get messageIndex => throw _privateConstructorUsedError;

  /// Serializes this TypingMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypingMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypingMessageCopyWith<TypingMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypingMessageCopyWith<$Res> {
  factory $TypingMessageCopyWith(
          TypingMessage value, $Res Function(TypingMessage) then) =
      _$TypingMessageCopyWithImpl<$Res, TypingMessage>;
  @useResult
  $Res call({String content, String target, int messageIndex});
}

/// @nodoc
class _$TypingMessageCopyWithImpl<$Res, $Val extends TypingMessage>
    implements $TypingMessageCopyWith<$Res> {
  _$TypingMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypingMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? target = null,
    Object? messageIndex = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      messageIndex: null == messageIndex
          ? _value.messageIndex
          : messageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypingMessageImplCopyWith<$Res>
    implements $TypingMessageCopyWith<$Res> {
  factory _$$TypingMessageImplCopyWith(
          _$TypingMessageImpl value, $Res Function(_$TypingMessageImpl) then) =
      __$$TypingMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, String target, int messageIndex});
}

/// @nodoc
class __$$TypingMessageImplCopyWithImpl<$Res>
    extends _$TypingMessageCopyWithImpl<$Res, _$TypingMessageImpl>
    implements _$$TypingMessageImplCopyWith<$Res> {
  __$$TypingMessageImplCopyWithImpl(
      _$TypingMessageImpl _value, $Res Function(_$TypingMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypingMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? target = null,
    Object? messageIndex = null,
  }) {
    return _then(_$TypingMessageImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      messageIndex: null == messageIndex
          ? _value.messageIndex
          : messageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypingMessageImpl implements _TypingMessage {
  const _$TypingMessageImpl(
      {required this.content,
      required this.target,
      required this.messageIndex});

  factory _$TypingMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypingMessageImplFromJson(json);

  @override
  final String content;
  @override
  final String target;
  @override
  final int messageIndex;

  @override
  String toString() {
    return 'TypingMessage(content: $content, target: $target, messageIndex: $messageIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypingMessageImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.messageIndex, messageIndex) ||
                other.messageIndex == messageIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content, target, messageIndex);

  /// Create a copy of TypingMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypingMessageImplCopyWith<_$TypingMessageImpl> get copyWith =>
      __$$TypingMessageImplCopyWithImpl<_$TypingMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypingMessageImplToJson(
      this,
    );
  }
}

abstract class _TypingMessage implements TypingMessage {
  const factory _TypingMessage(
      {required final String content,
      required final String target,
      required final int messageIndex}) = _$TypingMessageImpl;

  factory _TypingMessage.fromJson(Map<String, dynamic> json) =
      _$TypingMessageImpl.fromJson;

  @override
  String get content;
  @override
  String get target;
  @override
  int get messageIndex;

  /// Create a copy of TypingMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypingMessageImplCopyWith<_$TypingMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
