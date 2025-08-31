// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'factory_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FactorySearchResult _$FactorySearchResultFromJson(Map<String, dynamic> json) {
  return _FactorySearchResult.fromJson(json);
}

/// @nodoc
mixin _$FactorySearchResult {
  List<Factory> get factories => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  /// Serializes this FactorySearchResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FactorySearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FactorySearchResultCopyWith<FactorySearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactorySearchResultCopyWith<$Res> {
  factory $FactorySearchResultCopyWith(
          FactorySearchResult value, $Res Function(FactorySearchResult) then) =
      _$FactorySearchResultCopyWithImpl<$Res, FactorySearchResult>;
  @useResult
  $Res call(
      {List<Factory> factories,
      int total,
      int limit,
      int offset,
      bool hasMore});
}

/// @nodoc
class _$FactorySearchResultCopyWithImpl<$Res, $Val extends FactorySearchResult>
    implements $FactorySearchResultCopyWith<$Res> {
  _$FactorySearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FactorySearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? factories = null,
    Object? total = null,
    Object? limit = null,
    Object? offset = null,
    Object? hasMore = null,
  }) {
    return _then(_value.copyWith(
      factories: null == factories
          ? _value.factories
          : factories // ignore: cast_nullable_to_non_nullable
              as List<Factory>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FactorySearchResultImplCopyWith<$Res>
    implements $FactorySearchResultCopyWith<$Res> {
  factory _$$FactorySearchResultImplCopyWith(_$FactorySearchResultImpl value,
          $Res Function(_$FactorySearchResultImpl) then) =
      __$$FactorySearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Factory> factories,
      int total,
      int limit,
      int offset,
      bool hasMore});
}

/// @nodoc
class __$$FactorySearchResultImplCopyWithImpl<$Res>
    extends _$FactorySearchResultCopyWithImpl<$Res, _$FactorySearchResultImpl>
    implements _$$FactorySearchResultImplCopyWith<$Res> {
  __$$FactorySearchResultImplCopyWithImpl(_$FactorySearchResultImpl _value,
      $Res Function(_$FactorySearchResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of FactorySearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? factories = null,
    Object? total = null,
    Object? limit = null,
    Object? offset = null,
    Object? hasMore = null,
  }) {
    return _then(_$FactorySearchResultImpl(
      factories: null == factories
          ? _value._factories
          : factories // ignore: cast_nullable_to_non_nullable
              as List<Factory>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FactorySearchResultImpl implements _FactorySearchResult {
  const _$FactorySearchResultImpl(
      {final List<Factory> factories = const [],
      this.total = 0,
      this.limit = 20,
      this.offset = 0,
      this.hasMore = false})
      : _factories = factories;

  factory _$FactorySearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$FactorySearchResultImplFromJson(json);

  final List<Factory> _factories;
  @override
  @JsonKey()
  List<Factory> get factories {
    if (_factories is EqualUnmodifiableListView) return _factories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_factories);
  }

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int offset;
  @override
  @JsonKey()
  final bool hasMore;

  @override
  String toString() {
    return 'FactorySearchResult(factories: $factories, total: $total, limit: $limit, offset: $offset, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FactorySearchResultImpl &&
            const DeepCollectionEquality()
                .equals(other._factories, _factories) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_factories),
      total,
      limit,
      offset,
      hasMore);

  /// Create a copy of FactorySearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FactorySearchResultImplCopyWith<_$FactorySearchResultImpl> get copyWith =>
      __$$FactorySearchResultImplCopyWithImpl<_$FactorySearchResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FactorySearchResultImplToJson(
      this,
    );
  }
}

abstract class _FactorySearchResult implements FactorySearchResult {
  const factory _FactorySearchResult(
      {final List<Factory> factories,
      final int total,
      final int limit,
      final int offset,
      final bool hasMore}) = _$FactorySearchResultImpl;

  factory _FactorySearchResult.fromJson(Map<String, dynamic> json) =
      _$FactorySearchResultImpl.fromJson;

  @override
  List<Factory> get factories;
  @override
  int get total;
  @override
  int get limit;
  @override
  int get offset;
  @override
  bool get hasMore;

  /// Create a copy of FactorySearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FactorySearchResultImplCopyWith<_$FactorySearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
