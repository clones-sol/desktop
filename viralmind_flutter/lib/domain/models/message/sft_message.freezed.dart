// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sft_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SftMessage _$SftMessageFromJson(Map<String, dynamic> json) {
  return _SftMessage.fromJson(json);
}

/// @nodoc
mixin _$SftMessage {
  String get role => throw _privateConstructorUsedError;
  dynamic get content => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;

  /// Serializes this SftMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SftMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SftMessageCopyWith<SftMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SftMessageCopyWith<$Res> {
  factory $SftMessageCopyWith(
          SftMessage value, $Res Function(SftMessage) then) =
      _$SftMessageCopyWithImpl<$Res, SftMessage>;
  @useResult
  $Res call({String role, dynamic content, int timestamp});
}

/// @nodoc
class _$SftMessageCopyWithImpl<$Res, $Val extends SftMessage>
    implements $SftMessageCopyWith<$Res> {
  _$SftMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SftMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = freezed,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SftMessageImplCopyWith<$Res>
    implements $SftMessageCopyWith<$Res> {
  factory _$$SftMessageImplCopyWith(
          _$SftMessageImpl value, $Res Function(_$SftMessageImpl) then) =
      __$$SftMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String role, dynamic content, int timestamp});
}

/// @nodoc
class __$$SftMessageImplCopyWithImpl<$Res>
    extends _$SftMessageCopyWithImpl<$Res, _$SftMessageImpl>
    implements _$$SftMessageImplCopyWith<$Res> {
  __$$SftMessageImplCopyWithImpl(
      _$SftMessageImpl _value, $Res Function(_$SftMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of SftMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = freezed,
    Object? timestamp = null,
  }) {
    return _then(_$SftMessageImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SftMessageImpl implements _SftMessage {
  const _$SftMessageImpl(
      {required this.role, required this.content, required this.timestamp});

  factory _$SftMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SftMessageImplFromJson(json);

  @override
  final String role;
  @override
  final dynamic content;
  @override
  final int timestamp;

  @override
  String toString() {
    return 'SftMessage(role: $role, content: $content, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SftMessageImpl &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role,
      const DeepCollectionEquality().hash(content), timestamp);

  /// Create a copy of SftMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SftMessageImplCopyWith<_$SftMessageImpl> get copyWith =>
      __$$SftMessageImplCopyWithImpl<_$SftMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SftMessageImplToJson(
      this,
    );
  }
}

abstract class _SftMessage implements SftMessage {
  const factory _SftMessage(
      {required final String role,
      required final dynamic content,
      required final int timestamp}) = _$SftMessageImpl;

  factory _SftMessage.fromJson(Map<String, dynamic> json) =
      _$SftMessageImpl.fromJson;

  @override
  String get role;
  @override
  dynamic get content;
  @override
  int get timestamp;

  /// Create a copy of SftMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SftMessageImplCopyWith<_$SftMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
