// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deleted_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeletedRange _$DeletedRangeFromJson(Map<String, dynamic> json) {
  return _DeletedRange.fromJson(json);
}

/// @nodoc
mixin _$DeletedRange {
  int get start => throw _privateConstructorUsedError;
  int get end => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this DeletedRange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeletedRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeletedRangeCopyWith<DeletedRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeletedRangeCopyWith<$Res> {
  factory $DeletedRangeCopyWith(
          DeletedRange value, $Res Function(DeletedRange) then) =
      _$DeletedRangeCopyWithImpl<$Res, DeletedRange>;
  @useResult
  $Res call({int start, int end, int count});
}

/// @nodoc
class _$DeletedRangeCopyWithImpl<$Res, $Val extends DeletedRange>
    implements $DeletedRangeCopyWith<$Res> {
  _$DeletedRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeletedRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeletedRangeImplCopyWith<$Res>
    implements $DeletedRangeCopyWith<$Res> {
  factory _$$DeletedRangeImplCopyWith(
          _$DeletedRangeImpl value, $Res Function(_$DeletedRangeImpl) then) =
      __$$DeletedRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int start, int end, int count});
}

/// @nodoc
class __$$DeletedRangeImplCopyWithImpl<$Res>
    extends _$DeletedRangeCopyWithImpl<$Res, _$DeletedRangeImpl>
    implements _$$DeletedRangeImplCopyWith<$Res> {
  __$$DeletedRangeImplCopyWithImpl(
      _$DeletedRangeImpl _value, $Res Function(_$DeletedRangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeletedRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? count = null,
  }) {
    return _then(_$DeletedRangeImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeletedRangeImpl implements _DeletedRange {
  const _$DeletedRangeImpl(
      {required this.start, required this.end, required this.count});

  factory _$DeletedRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeletedRangeImplFromJson(json);

  @override
  final int start;
  @override
  final int end;
  @override
  final int count;

  @override
  String toString() {
    return 'DeletedRange(start: $start, end: $end, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletedRangeImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start, end, count);

  /// Create a copy of DeletedRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletedRangeImplCopyWith<_$DeletedRangeImpl> get copyWith =>
      __$$DeletedRangeImplCopyWithImpl<_$DeletedRangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeletedRangeImplToJson(
      this,
    );
  }
}

abstract class _DeletedRange implements DeletedRange {
  const factory _DeletedRange(
      {required final int start,
      required final int end,
      required final int count}) = _$DeletedRangeImpl;

  factory _DeletedRange.fromJson(Map<String, dynamic> json) =
      _$DeletedRangeImpl.fromJson;

  @override
  int get start;
  @override
  int get end;
  @override
  int get count;

  /// Create a copy of DeletedRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeletedRangeImplCopyWith<_$DeletedRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
