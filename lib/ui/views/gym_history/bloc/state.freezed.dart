// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GymHistoryState {
  List<ApiRecording> get recordings => throw _privateConstructorUsedError;
  GymHistorySortOrder get sortOrder => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;

  /// Create a copy of GymHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GymHistoryStateCopyWith<GymHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GymHistoryStateCopyWith<$Res> {
  factory $GymHistoryStateCopyWith(
          GymHistoryState value, $Res Function(GymHistoryState) then) =
      _$GymHistoryStateCopyWithImpl<$Res, GymHistoryState>;
  @useResult
  $Res call(
      {List<ApiRecording> recordings,
      GymHistorySortOrder sortOrder,
      String searchQuery});
}

/// @nodoc
class _$GymHistoryStateCopyWithImpl<$Res, $Val extends GymHistoryState>
    implements $GymHistoryStateCopyWith<$Res> {
  _$GymHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GymHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordings = null,
    Object? sortOrder = null,
    Object? searchQuery = null,
  }) {
    return _then(_value.copyWith(
      recordings: null == recordings
          ? _value.recordings
          : recordings // ignore: cast_nullable_to_non_nullable
              as List<ApiRecording>,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as GymHistorySortOrder,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GymHistoryStateImplCopyWith<$Res>
    implements $GymHistoryStateCopyWith<$Res> {
  factory _$$GymHistoryStateImplCopyWith(_$GymHistoryStateImpl value,
          $Res Function(_$GymHistoryStateImpl) then) =
      __$$GymHistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ApiRecording> recordings,
      GymHistorySortOrder sortOrder,
      String searchQuery});
}

/// @nodoc
class __$$GymHistoryStateImplCopyWithImpl<$Res>
    extends _$GymHistoryStateCopyWithImpl<$Res, _$GymHistoryStateImpl>
    implements _$$GymHistoryStateImplCopyWith<$Res> {
  __$$GymHistoryStateImplCopyWithImpl(
      _$GymHistoryStateImpl _value, $Res Function(_$GymHistoryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GymHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordings = null,
    Object? sortOrder = null,
    Object? searchQuery = null,
  }) {
    return _then(_$GymHistoryStateImpl(
      recordings: null == recordings
          ? _value._recordings
          : recordings // ignore: cast_nullable_to_non_nullable
              as List<ApiRecording>,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as GymHistorySortOrder,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GymHistoryStateImpl extends _GymHistoryState {
  const _$GymHistoryStateImpl(
      {final List<ApiRecording> recordings = const [],
      this.sortOrder = GymHistorySortOrder.newest,
      this.searchQuery = ''})
      : _recordings = recordings,
        super._();

  final List<ApiRecording> _recordings;
  @override
  @JsonKey()
  List<ApiRecording> get recordings {
    if (_recordings is EqualUnmodifiableListView) return _recordings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recordings);
  }

  @override
  @JsonKey()
  final GymHistorySortOrder sortOrder;
  @override
  @JsonKey()
  final String searchQuery;

  @override
  String toString() {
    return 'GymHistoryState(recordings: $recordings, sortOrder: $sortOrder, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GymHistoryStateImpl &&
            const DeepCollectionEquality()
                .equals(other._recordings, _recordings) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_recordings), sortOrder, searchQuery);

  /// Create a copy of GymHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GymHistoryStateImplCopyWith<_$GymHistoryStateImpl> get copyWith =>
      __$$GymHistoryStateImplCopyWithImpl<_$GymHistoryStateImpl>(
          this, _$identity);
}

abstract class _GymHistoryState extends GymHistoryState {
  const factory _GymHistoryState(
      {final List<ApiRecording> recordings,
      final GymHistorySortOrder sortOrder,
      final String searchQuery}) = _$GymHistoryStateImpl;
  const _GymHistoryState._() : super._();

  @override
  List<ApiRecording> get recordings;
  @override
  GymHistorySortOrder get sortOrder;
  @override
  String get searchQuery;

  /// Create a copy of GymHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GymHistoryStateImplCopyWith<_$GymHistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
