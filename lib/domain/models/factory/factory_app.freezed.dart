// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'factory_app.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FactoryApp _$FactoryAppFromJson(Map<String, dynamic> json) {
  return _FactoryApp.fromJson(json);
}

/// @nodoc
mixin _$FactoryApp {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get domain => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  List<FactoryTask> get tasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'pool_id')
  String? get poolId => throw _privateConstructorUsedError;

  /// Serializes this FactoryApp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FactoryApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FactoryAppCopyWith<FactoryApp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactoryAppCopyWith<$Res> {
  factory $FactoryAppCopyWith(
          FactoryApp value, $Res Function(FactoryApp) then) =
      _$FactoryAppCopyWithImpl<$Res, FactoryApp>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String name,
      String domain,
      String? description,
      List<String> categories,
      List<FactoryTask> tasks,
      @JsonKey(name: 'pool_id') String? poolId});
}

/// @nodoc
class _$FactoryAppCopyWithImpl<$Res, $Val extends FactoryApp>
    implements $FactoryAppCopyWith<$Res> {
  _$FactoryAppCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FactoryApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? domain = null,
    Object? description = freezed,
    Object? categories = null,
    Object? tasks = null,
    Object? poolId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<FactoryTask>,
      poolId: freezed == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FactoryAppImplCopyWith<$Res>
    implements $FactoryAppCopyWith<$Res> {
  factory _$$FactoryAppImplCopyWith(
          _$FactoryAppImpl value, $Res Function(_$FactoryAppImpl) then) =
      __$$FactoryAppImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String name,
      String domain,
      String? description,
      List<String> categories,
      List<FactoryTask> tasks,
      @JsonKey(name: 'pool_id') String? poolId});
}

/// @nodoc
class __$$FactoryAppImplCopyWithImpl<$Res>
    extends _$FactoryAppCopyWithImpl<$Res, _$FactoryAppImpl>
    implements _$$FactoryAppImplCopyWith<$Res> {
  __$$FactoryAppImplCopyWithImpl(
      _$FactoryAppImpl _value, $Res Function(_$FactoryAppImpl) _then)
      : super(_value, _then);

  /// Create a copy of FactoryApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? domain = null,
    Object? description = freezed,
    Object? categories = null,
    Object? tasks = null,
    Object? poolId = freezed,
  }) {
    return _then(_$FactoryAppImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<FactoryTask>,
      poolId: freezed == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FactoryAppImpl implements _FactoryApp {
  const _$FactoryAppImpl(
      {@JsonKey(name: '_id') this.id,
      required this.name,
      required this.domain,
      this.description,
      final List<String> categories = const [],
      final List<FactoryTask> tasks = const [],
      @JsonKey(name: 'pool_id') this.poolId})
      : _categories = categories,
        _tasks = tasks;

  factory _$FactoryAppImpl.fromJson(Map<String, dynamic> json) =>
      _$$FactoryAppImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String name;
  @override
  final String domain;
  @override
  final String? description;
  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<FactoryTask> _tasks;
  @override
  @JsonKey()
  List<FactoryTask> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  @JsonKey(name: 'pool_id')
  final String? poolId;

  @override
  String toString() {
    return 'FactoryApp(id: $id, name: $name, domain: $domain, description: $description, categories: $categories, tasks: $tasks, poolId: $poolId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FactoryAppImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.poolId, poolId) || other.poolId == poolId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      domain,
      description,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_tasks),
      poolId);

  /// Create a copy of FactoryApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FactoryAppImplCopyWith<_$FactoryAppImpl> get copyWith =>
      __$$FactoryAppImplCopyWithImpl<_$FactoryAppImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FactoryAppImplToJson(
      this,
    );
  }
}

abstract class _FactoryApp implements FactoryApp {
  const factory _FactoryApp(
      {@JsonKey(name: '_id') final String? id,
      required final String name,
      required final String domain,
      final String? description,
      final List<String> categories,
      final List<FactoryTask> tasks,
      @JsonKey(name: 'pool_id') final String? poolId}) = _$FactoryAppImpl;

  factory _FactoryApp.fromJson(Map<String, dynamic> json) =
      _$FactoryAppImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String get name;
  @override
  String get domain;
  @override
  String? get description;
  @override
  List<String> get categories;
  @override
  List<FactoryTask> get tasks;
  @override
  @JsonKey(name: 'pool_id')
  String? get poolId;

  /// Create a copy of FactoryApp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FactoryAppImplCopyWith<_$FactoryAppImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
