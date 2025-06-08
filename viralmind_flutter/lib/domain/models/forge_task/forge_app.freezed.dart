// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forge_app.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForgeApp _$ForgeAppFromJson(Map<String, dynamic> json) {
  return _ForgeApp.fromJson(json);
}

/// @nodoc
mixin _$ForgeApp {
  String get name => throw _privateConstructorUsedError;
  String get domain => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  List<ForgeTaskItem> get tasks => throw _privateConstructorUsedError;
  PoolId? get poolId => throw _privateConstructorUsedError;
  bool? get seen => throw _privateConstructorUsedError;
  bool? get gymLimitReached => throw _privateConstructorUsedError;
  int? get gymSubmissions => throw _privateConstructorUsedError;
  String? get gymLimitType => throw _privateConstructorUsedError;
  int? get gymLimitValue => throw _privateConstructorUsedError;

  /// Serializes this ForgeApp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForgeApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgeAppCopyWith<ForgeApp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgeAppCopyWith<$Res> {
  factory $ForgeAppCopyWith(ForgeApp value, $Res Function(ForgeApp) then) =
      _$ForgeAppCopyWithImpl<$Res, ForgeApp>;
  @useResult
  $Res call(
      {String name,
      String domain,
      String description,
      List<String> categories,
      List<ForgeTaskItem> tasks,
      PoolId? poolId,
      bool? seen,
      bool? gymLimitReached,
      int? gymSubmissions,
      String? gymLimitType,
      int? gymLimitValue});

  $PoolIdCopyWith<$Res>? get poolId;
}

/// @nodoc
class _$ForgeAppCopyWithImpl<$Res, $Val extends ForgeApp>
    implements $ForgeAppCopyWith<$Res> {
  _$ForgeAppCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgeApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? domain = null,
    Object? description = null,
    Object? categories = null,
    Object? tasks = null,
    Object? poolId = freezed,
    Object? seen = freezed,
    Object? gymLimitReached = freezed,
    Object? gymSubmissions = freezed,
    Object? gymLimitType = freezed,
    Object? gymLimitValue = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<ForgeTaskItem>,
      poolId: freezed == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as PoolId?,
      seen: freezed == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool?,
      gymLimitReached: freezed == gymLimitReached
          ? _value.gymLimitReached
          : gymLimitReached // ignore: cast_nullable_to_non_nullable
              as bool?,
      gymSubmissions: freezed == gymSubmissions
          ? _value.gymSubmissions
          : gymSubmissions // ignore: cast_nullable_to_non_nullable
              as int?,
      gymLimitType: freezed == gymLimitType
          ? _value.gymLimitType
          : gymLimitType // ignore: cast_nullable_to_non_nullable
              as String?,
      gymLimitValue: freezed == gymLimitValue
          ? _value.gymLimitValue
          : gymLimitValue // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of ForgeApp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PoolIdCopyWith<$Res>? get poolId {
    if (_value.poolId == null) {
      return null;
    }

    return $PoolIdCopyWith<$Res>(_value.poolId!, (value) {
      return _then(_value.copyWith(poolId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForgeAppImplCopyWith<$Res>
    implements $ForgeAppCopyWith<$Res> {
  factory _$$ForgeAppImplCopyWith(
          _$ForgeAppImpl value, $Res Function(_$ForgeAppImpl) then) =
      __$$ForgeAppImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String domain,
      String description,
      List<String> categories,
      List<ForgeTaskItem> tasks,
      PoolId? poolId,
      bool? seen,
      bool? gymLimitReached,
      int? gymSubmissions,
      String? gymLimitType,
      int? gymLimitValue});

  @override
  $PoolIdCopyWith<$Res>? get poolId;
}

/// @nodoc
class __$$ForgeAppImplCopyWithImpl<$Res>
    extends _$ForgeAppCopyWithImpl<$Res, _$ForgeAppImpl>
    implements _$$ForgeAppImplCopyWith<$Res> {
  __$$ForgeAppImplCopyWithImpl(
      _$ForgeAppImpl _value, $Res Function(_$ForgeAppImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgeApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? domain = null,
    Object? description = null,
    Object? categories = null,
    Object? tasks = null,
    Object? poolId = freezed,
    Object? seen = freezed,
    Object? gymLimitReached = freezed,
    Object? gymSubmissions = freezed,
    Object? gymLimitType = freezed,
    Object? gymLimitValue = freezed,
  }) {
    return _then(_$ForgeAppImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<ForgeTaskItem>,
      poolId: freezed == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as PoolId?,
      seen: freezed == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool?,
      gymLimitReached: freezed == gymLimitReached
          ? _value.gymLimitReached
          : gymLimitReached // ignore: cast_nullable_to_non_nullable
              as bool?,
      gymSubmissions: freezed == gymSubmissions
          ? _value.gymSubmissions
          : gymSubmissions // ignore: cast_nullable_to_non_nullable
              as int?,
      gymLimitType: freezed == gymLimitType
          ? _value.gymLimitType
          : gymLimitType // ignore: cast_nullable_to_non_nullable
              as String?,
      gymLimitValue: freezed == gymLimitValue
          ? _value.gymLimitValue
          : gymLimitValue // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgeAppImpl implements _ForgeApp {
  const _$ForgeAppImpl(
      {required this.name,
      required this.domain,
      required this.description,
      required final List<String> categories,
      required final List<ForgeTaskItem> tasks,
      this.poolId,
      this.seen,
      this.gymLimitReached,
      this.gymSubmissions,
      this.gymLimitType,
      this.gymLimitValue})
      : _categories = categories,
        _tasks = tasks;

  factory _$ForgeAppImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgeAppImplFromJson(json);

  @override
  final String name;
  @override
  final String domain;
  @override
  final String description;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<ForgeTaskItem> _tasks;
  @override
  List<ForgeTaskItem> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  final PoolId? poolId;
  @override
  final bool? seen;
  @override
  final bool? gymLimitReached;
  @override
  final int? gymSubmissions;
  @override
  final String? gymLimitType;
  @override
  final int? gymLimitValue;

  @override
  String toString() {
    return 'ForgeApp(name: $name, domain: $domain, description: $description, categories: $categories, tasks: $tasks, poolId: $poolId, seen: $seen, gymLimitReached: $gymLimitReached, gymSubmissions: $gymSubmissions, gymLimitType: $gymLimitType, gymLimitValue: $gymLimitValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgeAppImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.poolId, poolId) || other.poolId == poolId) &&
            (identical(other.seen, seen) || other.seen == seen) &&
            (identical(other.gymLimitReached, gymLimitReached) ||
                other.gymLimitReached == gymLimitReached) &&
            (identical(other.gymSubmissions, gymSubmissions) ||
                other.gymSubmissions == gymSubmissions) &&
            (identical(other.gymLimitType, gymLimitType) ||
                other.gymLimitType == gymLimitType) &&
            (identical(other.gymLimitValue, gymLimitValue) ||
                other.gymLimitValue == gymLimitValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      domain,
      description,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_tasks),
      poolId,
      seen,
      gymLimitReached,
      gymSubmissions,
      gymLimitType,
      gymLimitValue);

  /// Create a copy of ForgeApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgeAppImplCopyWith<_$ForgeAppImpl> get copyWith =>
      __$$ForgeAppImplCopyWithImpl<_$ForgeAppImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgeAppImplToJson(
      this,
    );
  }
}

abstract class _ForgeApp implements ForgeApp {
  const factory _ForgeApp(
      {required final String name,
      required final String domain,
      required final String description,
      required final List<String> categories,
      required final List<ForgeTaskItem> tasks,
      final PoolId? poolId,
      final bool? seen,
      final bool? gymLimitReached,
      final int? gymSubmissions,
      final String? gymLimitType,
      final int? gymLimitValue}) = _$ForgeAppImpl;

  factory _ForgeApp.fromJson(Map<String, dynamic> json) =
      _$ForgeAppImpl.fromJson;

  @override
  String get name;
  @override
  String get domain;
  @override
  String get description;
  @override
  List<String> get categories;
  @override
  List<ForgeTaskItem> get tasks;
  @override
  PoolId? get poolId;
  @override
  bool? get seen;
  @override
  bool? get gymLimitReached;
  @override
  int? get gymSubmissions;
  @override
  String? get gymLimitType;
  @override
  int? get gymLimitValue;

  /// Create a copy of ForgeApp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgeAppImplCopyWith<_$ForgeAppImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
