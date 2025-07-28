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
mixin _$FactoryHistoryState {
  List<ApiRecording> get recordings => throw _privateConstructorUsedError;
  FactoryHistorySortOrder get sortOrder => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;

  /// Create a copy of FactoryHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FactoryHistoryStateCopyWith<FactoryHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactoryHistoryStateCopyWith<$Res> {
  factory $FactoryHistoryStateCopyWith(
          FactoryHistoryState value, $Res Function(FactoryHistoryState) then) =
      _$FactoryHistoryStateCopyWithImpl<$Res, FactoryHistoryState>;
  @useResult
  $Res call(
      {List<ApiRecording> recordings,
      FactoryHistorySortOrder sortOrder,
      String searchQuery});
}

/// @nodoc
class _$FactoryHistoryStateCopyWithImpl<$Res, $Val extends FactoryHistoryState>
    implements $FactoryHistoryStateCopyWith<$Res> {
  _$FactoryHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FactoryHistoryState
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
              as FactoryHistorySortOrder,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FactoryHistoryStateImplCopyWith<$Res>
    implements $FactoryHistoryStateCopyWith<$Res> {
  factory _$$FactoryHistoryStateImplCopyWith(_$FactoryHistoryStateImpl value,
          $Res Function(_$FactoryHistoryStateImpl) then) =
      __$$FactoryHistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ApiRecording> recordings,
      FactoryHistorySortOrder sortOrder,
      String searchQuery});
}

/// @nodoc
class __$$FactoryHistoryStateImplCopyWithImpl<$Res>
    extends _$FactoryHistoryStateCopyWithImpl<$Res, _$FactoryHistoryStateImpl>
    implements _$$FactoryHistoryStateImplCopyWith<$Res> {
  __$$FactoryHistoryStateImplCopyWithImpl(_$FactoryHistoryStateImpl _value,
      $Res Function(_$FactoryHistoryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FactoryHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordings = null,
    Object? sortOrder = null,
    Object? searchQuery = null,
  }) {
    return _then(_$FactoryHistoryStateImpl(
      recordings: null == recordings
          ? _value._recordings
          : recordings // ignore: cast_nullable_to_non_nullable
              as List<ApiRecording>,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as FactoryHistorySortOrder,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FactoryHistoryStateImpl extends _FactoryHistoryState {
  const _$FactoryHistoryStateImpl(
      {final List<ApiRecording> recordings = const [],
      this.sortOrder = FactoryHistorySortOrder.newest,
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
  final FactoryHistorySortOrder sortOrder;
  @override
  @JsonKey()
  final String searchQuery;

  @override
  String toString() {
    return 'FactoryHistoryState(recordings: $recordings, sortOrder: $sortOrder, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FactoryHistoryStateImpl &&
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

  /// Create a copy of FactoryHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FactoryHistoryStateImplCopyWith<_$FactoryHistoryStateImpl> get copyWith =>
      __$$FactoryHistoryStateImplCopyWithImpl<_$FactoryHistoryStateImpl>(
          this, _$identity);
}

abstract class _FactoryHistoryState extends FactoryHistoryState {
  const factory _FactoryHistoryState(
      {final List<ApiRecording> recordings,
      final FactoryHistorySortOrder sortOrder,
      final String searchQuery}) = _$FactoryHistoryStateImpl;
  const _FactoryHistoryState._() : super._();

  @override
  List<ApiRecording> get recordings;
  @override
  FactoryHistorySortOrder get sortOrder;
  @override
  String get searchQuery;

  /// Create a copy of FactoryHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FactoryHistoryStateImplCopyWith<_$FactoryHistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
