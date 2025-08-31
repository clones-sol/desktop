// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skill_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SkillCount _$SkillCountFromJson(Map<String, dynamic> json) {
  return _SkillCount.fromJson(json);
}

/// @nodoc
mixin _$SkillCount {
  String get skill => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this SkillCount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SkillCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillCountCopyWith<SkillCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillCountCopyWith<$Res> {
  factory $SkillCountCopyWith(
          SkillCount value, $Res Function(SkillCount) then) =
      _$SkillCountCopyWithImpl<$Res, SkillCount>;
  @useResult
  $Res call({String skill, int count});
}

/// @nodoc
class _$SkillCountCopyWithImpl<$Res, $Val extends SkillCount>
    implements $SkillCountCopyWith<$Res> {
  _$SkillCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skill = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      skill: null == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkillCountImplCopyWith<$Res>
    implements $SkillCountCopyWith<$Res> {
  factory _$$SkillCountImplCopyWith(
          _$SkillCountImpl value, $Res Function(_$SkillCountImpl) then) =
      __$$SkillCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String skill, int count});
}

/// @nodoc
class __$$SkillCountImplCopyWithImpl<$Res>
    extends _$SkillCountCopyWithImpl<$Res, _$SkillCountImpl>
    implements _$$SkillCountImplCopyWith<$Res> {
  __$$SkillCountImplCopyWithImpl(
      _$SkillCountImpl _value, $Res Function(_$SkillCountImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkillCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skill = null,
    Object? count = null,
  }) {
    return _then(_$SkillCountImpl(
      skill: null == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SkillCountImpl implements _SkillCount {
  const _$SkillCountImpl({required this.skill, required this.count});

  factory _$SkillCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkillCountImplFromJson(json);

  @override
  final String skill;
  @override
  final int count;

  @override
  String toString() {
    return 'SkillCount(skill: $skill, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillCountImpl &&
            (identical(other.skill, skill) || other.skill == skill) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, skill, count);

  /// Create a copy of SkillCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillCountImplCopyWith<_$SkillCountImpl> get copyWith =>
      __$$SkillCountImplCopyWithImpl<_$SkillCountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkillCountImplToJson(
      this,
    );
  }
}

abstract class _SkillCount implements SkillCount {
  const factory _SkillCount(
      {required final String skill,
      required final int count}) = _$SkillCountImpl;

  factory _SkillCount.fromJson(Map<String, dynamic> json) =
      _$SkillCountImpl.fromJson;

  @override
  String get skill;
  @override
  int get count;

  /// Create a copy of SkillCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillCountImplCopyWith<_$SkillCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
