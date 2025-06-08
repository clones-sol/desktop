// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageAction _$MessageActionFromJson(Map<String, dynamic> json) {
  return _MessageAction.fromJson(json);
}

/// @nodoc
mixin _$MessageAction {
  String get type =>
      throw _privateConstructorUsedError; // e.g. primary, warning, destroy, component
  String get text => throw _privateConstructorUsedError;
  Map<String, dynamic>? get props => throw _privateConstructorUsedError;

  /// Serializes this MessageAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageActionCopyWith<MessageAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageActionCopyWith<$Res> {
  factory $MessageActionCopyWith(
          MessageAction value, $Res Function(MessageAction) then) =
      _$MessageActionCopyWithImpl<$Res, MessageAction>;
  @useResult
  $Res call({String type, String text, Map<String, dynamic>? props});
}

/// @nodoc
class _$MessageActionCopyWithImpl<$Res, $Val extends MessageAction>
    implements $MessageActionCopyWith<$Res> {
  _$MessageActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = null,
    Object? props = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      props: freezed == props
          ? _value.props
          : props // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageActionImplCopyWith<$Res>
    implements $MessageActionCopyWith<$Res> {
  factory _$$MessageActionImplCopyWith(
          _$MessageActionImpl value, $Res Function(_$MessageActionImpl) then) =
      __$$MessageActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String text, Map<String, dynamic>? props});
}

/// @nodoc
class __$$MessageActionImplCopyWithImpl<$Res>
    extends _$MessageActionCopyWithImpl<$Res, _$MessageActionImpl>
    implements _$$MessageActionImplCopyWith<$Res> {
  __$$MessageActionImplCopyWithImpl(
      _$MessageActionImpl _value, $Res Function(_$MessageActionImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = null,
    Object? props = freezed,
  }) {
    return _then(_$MessageActionImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      props: freezed == props
          ? _value._props
          : props // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageActionImpl implements _MessageAction {
  const _$MessageActionImpl(
      {required this.type,
      required this.text,
      final Map<String, dynamic>? props})
      : _props = props;

  factory _$MessageActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageActionImplFromJson(json);

  @override
  final String type;
// e.g. primary, warning, destroy, component
  @override
  final String text;
  final Map<String, dynamic>? _props;
  @override
  Map<String, dynamic>? get props {
    final value = _props;
    if (value == null) return null;
    if (_props is EqualUnmodifiableMapView) return _props;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'MessageAction(type: $type, text: $text, props: $props)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageActionImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._props, _props));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, text, const DeepCollectionEquality().hash(_props));

  /// Create a copy of MessageAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageActionImplCopyWith<_$MessageActionImpl> get copyWith =>
      __$$MessageActionImplCopyWithImpl<_$MessageActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageActionImplToJson(
      this,
    );
  }
}

abstract class _MessageAction implements MessageAction {
  const factory _MessageAction(
      {required final String type,
      required final String text,
      final Map<String, dynamic>? props}) = _$MessageActionImpl;

  factory _MessageAction.fromJson(Map<String, dynamic> json) =
      _$MessageActionImpl.fromJson;

  @override
  String get type; // e.g. primary, warning, destroy, component
  @override
  String get text;
  @override
  Map<String, dynamic>? get props;

  /// Create a copy of MessageAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageActionImplCopyWith<_$MessageActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
