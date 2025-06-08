// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  Quest get quest => throw _privateConstructorUsedError;
  String get poolId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get generatedTime => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extra => throw _privateConstructorUsedError;

  /// Serializes this Meta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call(
      {Quest quest,
      String poolId,
      String id,
      int generatedTime,
      Map<String, dynamic>? extra});

  $QuestCopyWith<$Res> get quest;
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quest = null,
    Object? poolId = null,
    Object? id = null,
    Object? generatedTime = null,
    Object? extra = freezed,
  }) {
    return _then(_value.copyWith(
      quest: null == quest
          ? _value.quest
          : quest // ignore: cast_nullable_to_non_nullable
              as Quest,
      poolId: null == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      generatedTime: null == generatedTime
          ? _value.generatedTime
          : generatedTime // ignore: cast_nullable_to_non_nullable
              as int,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestCopyWith<$Res> get quest {
    return $QuestCopyWith<$Res>(_value.quest, (value) {
      return _then(_value.copyWith(quest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Quest quest,
      String poolId,
      String id,
      int generatedTime,
      Map<String, dynamic>? extra});

  @override
  $QuestCopyWith<$Res> get quest;
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quest = null,
    Object? poolId = null,
    Object? id = null,
    Object? generatedTime = null,
    Object? extra = freezed,
  }) {
    return _then(_$MetaImpl(
      quest: null == quest
          ? _value.quest
          : quest // ignore: cast_nullable_to_non_nullable
              as Quest,
      poolId: null == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      generatedTime: null == generatedTime
          ? _value.generatedTime
          : generatedTime // ignore: cast_nullable_to_non_nullable
              as int,
      extra: freezed == extra
          ? _value._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl implements _Meta {
  const _$MetaImpl(
      {required this.quest,
      required this.poolId,
      required this.id,
      required this.generatedTime,
      final Map<String, dynamic>? extra})
      : _extra = extra;

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  final Quest quest;
  @override
  final String poolId;
  @override
  final String id;
  @override
  final int generatedTime;
  final Map<String, dynamic>? _extra;
  @override
  Map<String, dynamic>? get extra {
    final value = _extra;
    if (value == null) return null;
    if (_extra is EqualUnmodifiableMapView) return _extra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Meta(quest: $quest, poolId: $poolId, id: $id, generatedTime: $generatedTime, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.quest, quest) || other.quest == quest) &&
            (identical(other.poolId, poolId) || other.poolId == poolId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.generatedTime, generatedTime) ||
                other.generatedTime == generatedTime) &&
            const DeepCollectionEquality().equals(other._extra, _extra));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, quest, poolId, id, generatedTime,
      const DeepCollectionEquality().hash(_extra));

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  const factory _Meta(
      {required final Quest quest,
      required final String poolId,
      required final String id,
      required final int generatedTime,
      final Map<String, dynamic>? extra}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  Quest get quest;
  @override
  String get poolId;
  @override
  String get id;
  @override
  int get generatedTime;
  @override
  Map<String, dynamic>? get extra;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
