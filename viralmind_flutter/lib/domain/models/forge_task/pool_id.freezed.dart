// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pool_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PoolId _$PoolIdFromJson(Map<String, dynamic> json) {
  return _PoolId.fromJson(json);
}

/// @nodoc
mixin _$PoolId {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double get pricePerDemo => throw _privateConstructorUsedError;

  /// Serializes this PoolId to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoolId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoolIdCopyWith<PoolId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoolIdCopyWith<$Res> {
  factory $PoolIdCopyWith(PoolId value, $Res Function(PoolId) then) =
      _$PoolIdCopyWithImpl<$Res, PoolId>;
  @useResult
  $Res call({String id, String name, String status, double pricePerDemo});
}

/// @nodoc
class _$PoolIdCopyWithImpl<$Res, $Val extends PoolId>
    implements $PoolIdCopyWith<$Res> {
  _$PoolIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoolId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? pricePerDemo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerDemo: null == pricePerDemo
          ? _value.pricePerDemo
          : pricePerDemo // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoolIdImplCopyWith<$Res> implements $PoolIdCopyWith<$Res> {
  factory _$$PoolIdImplCopyWith(
          _$PoolIdImpl value, $Res Function(_$PoolIdImpl) then) =
      __$$PoolIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String status, double pricePerDemo});
}

/// @nodoc
class __$$PoolIdImplCopyWithImpl<$Res>
    extends _$PoolIdCopyWithImpl<$Res, _$PoolIdImpl>
    implements _$$PoolIdImplCopyWith<$Res> {
  __$$PoolIdImplCopyWithImpl(
      _$PoolIdImpl _value, $Res Function(_$PoolIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoolId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? pricePerDemo = null,
  }) {
    return _then(_$PoolIdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerDemo: null == pricePerDemo
          ? _value.pricePerDemo
          : pricePerDemo // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoolIdImpl implements _PoolId {
  const _$PoolIdImpl(
      {required this.id,
      required this.name,
      required this.status,
      required this.pricePerDemo});

  factory _$PoolIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoolIdImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String status;
  @override
  final double pricePerDemo;

  @override
  String toString() {
    return 'PoolId(id: $id, name: $name, status: $status, pricePerDemo: $pricePerDemo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoolIdImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pricePerDemo, pricePerDemo) ||
                other.pricePerDemo == pricePerDemo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, status, pricePerDemo);

  /// Create a copy of PoolId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoolIdImplCopyWith<_$PoolIdImpl> get copyWith =>
      __$$PoolIdImplCopyWithImpl<_$PoolIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoolIdImplToJson(
      this,
    );
  }
}

abstract class _PoolId implements PoolId {
  const factory _PoolId(
      {required final String id,
      required final String name,
      required final String status,
      required final double pricePerDemo}) = _$PoolIdImpl;

  factory _PoolId.fromJson(Map<String, dynamic> json) = _$PoolIdImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get status;
  @override
  double get pricePerDemo;

  /// Create a copy of PoolId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoolIdImplCopyWith<_$PoolIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
