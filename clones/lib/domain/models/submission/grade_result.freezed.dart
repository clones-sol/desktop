// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grade_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GradeResult _$GradeResultFromJson(Map<String, dynamic> json) {
  return _GradeResult.fromJson(json);
}

/// @nodoc
mixin _$GradeResult {
  String get summary => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  String get reasoning => throw _privateConstructorUsedError;
  String? get scratchpad => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;

  /// Serializes this GradeResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GradeResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GradeResultCopyWith<GradeResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GradeResultCopyWith<$Res> {
  factory $GradeResultCopyWith(
          GradeResult value, $Res Function(GradeResult) then) =
      _$GradeResultCopyWithImpl<$Res, GradeResult>;
  @useResult
  $Res call(
      {String summary,
      int score,
      String reasoning,
      String? scratchpad,
      @JsonKey(name: '_id') String id});
}

/// @nodoc
class _$GradeResultCopyWithImpl<$Res, $Val extends GradeResult>
    implements $GradeResultCopyWith<$Res> {
  _$GradeResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GradeResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? score = null,
    Object? reasoning = null,
    Object? scratchpad = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      reasoning: null == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String,
      scratchpad: freezed == scratchpad
          ? _value.scratchpad
          : scratchpad // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GradeResultImplCopyWith<$Res>
    implements $GradeResultCopyWith<$Res> {
  factory _$$GradeResultImplCopyWith(
          _$GradeResultImpl value, $Res Function(_$GradeResultImpl) then) =
      __$$GradeResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String summary,
      int score,
      String reasoning,
      String? scratchpad,
      @JsonKey(name: '_id') String id});
}

/// @nodoc
class __$$GradeResultImplCopyWithImpl<$Res>
    extends _$GradeResultCopyWithImpl<$Res, _$GradeResultImpl>
    implements _$$GradeResultImplCopyWith<$Res> {
  __$$GradeResultImplCopyWithImpl(
      _$GradeResultImpl _value, $Res Function(_$GradeResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of GradeResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? score = null,
    Object? reasoning = null,
    Object? scratchpad = freezed,
    Object? id = null,
  }) {
    return _then(_$GradeResultImpl(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      reasoning: null == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String,
      scratchpad: freezed == scratchpad
          ? _value.scratchpad
          : scratchpad // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GradeResultImpl implements _GradeResult {
  const _$GradeResultImpl(
      {required this.summary,
      required this.score,
      required this.reasoning,
      this.scratchpad,
      @JsonKey(name: '_id') required this.id});

  factory _$GradeResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$GradeResultImplFromJson(json);

  @override
  final String summary;
  @override
  final int score;
  @override
  final String reasoning;
  @override
  final String? scratchpad;
  @override
  @JsonKey(name: '_id')
  final String id;

  @override
  String toString() {
    return 'GradeResult(summary: $summary, score: $score, reasoning: $reasoning, scratchpad: $scratchpad, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GradeResultImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            (identical(other.scratchpad, scratchpad) ||
                other.scratchpad == scratchpad) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, summary, score, reasoning, scratchpad, id);

  /// Create a copy of GradeResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GradeResultImplCopyWith<_$GradeResultImpl> get copyWith =>
      __$$GradeResultImplCopyWithImpl<_$GradeResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GradeResultImplToJson(
      this,
    );
  }
}

abstract class _GradeResult implements GradeResult {
  const factory _GradeResult(
      {required final String summary,
      required final int score,
      required final String reasoning,
      final String? scratchpad,
      @JsonKey(name: '_id') required final String id}) = _$GradeResultImpl;

  factory _GradeResult.fromJson(Map<String, dynamic> json) =
      _$GradeResultImpl.fromJson;

  @override
  String get summary;
  @override
  int get score;
  @override
  String get reasoning;
  @override
  String? get scratchpad;
  @override
  @JsonKey(name: '_id')
  String get id;

  /// Create a copy of GradeResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GradeResultImplCopyWith<_$GradeResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
