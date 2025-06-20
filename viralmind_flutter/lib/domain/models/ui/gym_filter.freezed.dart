// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gym_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GymFilter _$GymFilterFromJson(Map<String, dynamic> json) {
  return _GymFilter.fromJson(json);
}

/// @nodoc
mixin _$GymFilter {
  String? get poolId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int? get minReward => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int? get maxReward => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get query => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  List<String>? get categories => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  bool? get hideAdult => throw _privateConstructorUsedError;

  /// Serializes this GymFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GymFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GymFilterCopyWith<GymFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GymFilterCopyWith<$Res> {
  factory $GymFilterCopyWith(GymFilter value, $Res Function(GymFilter) then) =
      _$GymFilterCopyWithImpl<$Res, GymFilter>;
  @useResult
  $Res call(
      {String? poolId,
      @JsonKey(includeIfNull: false) int? minReward,
      @JsonKey(includeIfNull: false) int? maxReward,
      @JsonKey(includeIfNull: false) String? query,
      @JsonKey(includeIfNull: false) List<String>? categories,
      @JsonKey(includeIfNull: false) bool? hideAdult});
}

/// @nodoc
class _$GymFilterCopyWithImpl<$Res, $Val extends GymFilter>
    implements $GymFilterCopyWith<$Res> {
  _$GymFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GymFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poolId = freezed,
    Object? minReward = freezed,
    Object? maxReward = freezed,
    Object? query = freezed,
    Object? categories = freezed,
    Object? hideAdult = freezed,
  }) {
    return _then(_value.copyWith(
      poolId: freezed == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String?,
      minReward: freezed == minReward
          ? _value.minReward
          : minReward // ignore: cast_nullable_to_non_nullable
              as int?,
      maxReward: freezed == maxReward
          ? _value.maxReward
          : maxReward // ignore: cast_nullable_to_non_nullable
              as int?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      hideAdult: freezed == hideAdult
          ? _value.hideAdult
          : hideAdult // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GymFilterImplCopyWith<$Res>
    implements $GymFilterCopyWith<$Res> {
  factory _$$GymFilterImplCopyWith(
          _$GymFilterImpl value, $Res Function(_$GymFilterImpl) then) =
      __$$GymFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? poolId,
      @JsonKey(includeIfNull: false) int? minReward,
      @JsonKey(includeIfNull: false) int? maxReward,
      @JsonKey(includeIfNull: false) String? query,
      @JsonKey(includeIfNull: false) List<String>? categories,
      @JsonKey(includeIfNull: false) bool? hideAdult});
}

/// @nodoc
class __$$GymFilterImplCopyWithImpl<$Res>
    extends _$GymFilterCopyWithImpl<$Res, _$GymFilterImpl>
    implements _$$GymFilterImplCopyWith<$Res> {
  __$$GymFilterImplCopyWithImpl(
      _$GymFilterImpl _value, $Res Function(_$GymFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of GymFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poolId = freezed,
    Object? minReward = freezed,
    Object? maxReward = freezed,
    Object? query = freezed,
    Object? categories = freezed,
    Object? hideAdult = freezed,
  }) {
    return _then(_$GymFilterImpl(
      poolId: freezed == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String?,
      minReward: freezed == minReward
          ? _value.minReward
          : minReward // ignore: cast_nullable_to_non_nullable
              as int?,
      maxReward: freezed == maxReward
          ? _value.maxReward
          : maxReward // ignore: cast_nullable_to_non_nullable
              as int?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      hideAdult: freezed == hideAdult
          ? _value.hideAdult
          : hideAdult // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GymFilterImpl implements _GymFilter {
  const _$GymFilterImpl(
      {this.poolId,
      @JsonKey(includeIfNull: false) this.minReward,
      @JsonKey(includeIfNull: false) this.maxReward,
      @JsonKey(includeIfNull: false) this.query,
      @JsonKey(includeIfNull: false) final List<String>? categories,
      @JsonKey(includeIfNull: false) this.hideAdult})
      : _categories = categories;

  factory _$GymFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$GymFilterImplFromJson(json);

  @override
  final String? poolId;
  @override
  @JsonKey(includeIfNull: false)
  final int? minReward;
  @override
  @JsonKey(includeIfNull: false)
  final int? maxReward;
  @override
  @JsonKey(includeIfNull: false)
  final String? query;
  final List<String>? _categories;
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(includeIfNull: false)
  final bool? hideAdult;

  @override
  String toString() {
    return 'GymFilter(poolId: $poolId, minReward: $minReward, maxReward: $maxReward, query: $query, categories: $categories, hideAdult: $hideAdult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GymFilterImpl &&
            (identical(other.poolId, poolId) || other.poolId == poolId) &&
            (identical(other.minReward, minReward) ||
                other.minReward == minReward) &&
            (identical(other.maxReward, maxReward) ||
                other.maxReward == maxReward) &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.hideAdult, hideAdult) ||
                other.hideAdult == hideAdult));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, poolId, minReward, maxReward,
      query, const DeepCollectionEquality().hash(_categories), hideAdult);

  /// Create a copy of GymFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GymFilterImplCopyWith<_$GymFilterImpl> get copyWith =>
      __$$GymFilterImplCopyWithImpl<_$GymFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GymFilterImplToJson(
      this,
    );
  }
}

abstract class _GymFilter implements GymFilter {
  const factory _GymFilter(
      {final String? poolId,
      @JsonKey(includeIfNull: false) final int? minReward,
      @JsonKey(includeIfNull: false) final int? maxReward,
      @JsonKey(includeIfNull: false) final String? query,
      @JsonKey(includeIfNull: false) final List<String>? categories,
      @JsonKey(includeIfNull: false) final bool? hideAdult}) = _$GymFilterImpl;

  factory _GymFilter.fromJson(Map<String, dynamic> json) =
      _$GymFilterImpl.fromJson;

  @override
  String? get poolId;
  @override
  @JsonKey(includeIfNull: false)
  int? get minReward;
  @override
  @JsonKey(includeIfNull: false)
  int? get maxReward;
  @override
  @JsonKey(includeIfNull: false)
  String? get query;
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get categories;
  @override
  @JsonKey(includeIfNull: false)
  bool? get hideAdult;

  /// Create a copy of GymFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GymFilterImplCopyWith<_$GymFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
