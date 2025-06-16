// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadMetadata _$UploadMetadataFromJson(Map<String, dynamic> json) {
  return _UploadMetadata.fromJson(json);
}

/// @nodoc
mixin _$UploadMetadata {
  String get id => throw _privateConstructorUsedError;
  String? get poolId => throw _privateConstructorUsedError;
  int? get generatedTime => throw _privateConstructorUsedError;

  /// Serializes this UploadMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadMetadataCopyWith<UploadMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadMetadataCopyWith<$Res> {
  factory $UploadMetadataCopyWith(
          UploadMetadata value, $Res Function(UploadMetadata) then) =
      _$UploadMetadataCopyWithImpl<$Res, UploadMetadata>;
  @useResult
  $Res call({String id, String? poolId, int? generatedTime});
}

/// @nodoc
class _$UploadMetadataCopyWithImpl<$Res, $Val extends UploadMetadata>
    implements $UploadMetadataCopyWith<$Res> {
  _$UploadMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poolId = freezed,
    Object? generatedTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poolId: freezed == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String?,
      generatedTime: freezed == generatedTime
          ? _value.generatedTime
          : generatedTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadMetadataImplCopyWith<$Res>
    implements $UploadMetadataCopyWith<$Res> {
  factory _$$UploadMetadataImplCopyWith(_$UploadMetadataImpl value,
          $Res Function(_$UploadMetadataImpl) then) =
      __$$UploadMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? poolId, int? generatedTime});
}

/// @nodoc
class __$$UploadMetadataImplCopyWithImpl<$Res>
    extends _$UploadMetadataCopyWithImpl<$Res, _$UploadMetadataImpl>
    implements _$$UploadMetadataImplCopyWith<$Res> {
  __$$UploadMetadataImplCopyWithImpl(
      _$UploadMetadataImpl _value, $Res Function(_$UploadMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poolId = freezed,
    Object? generatedTime = freezed,
  }) {
    return _then(_$UploadMetadataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poolId: freezed == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String?,
      generatedTime: freezed == generatedTime
          ? _value.generatedTime
          : generatedTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadMetadataImpl implements _UploadMetadata {
  const _$UploadMetadataImpl(
      {required this.id, this.poolId, this.generatedTime});

  factory _$UploadMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadMetadataImplFromJson(json);

  @override
  final String id;
  @override
  final String? poolId;
  @override
  final int? generatedTime;

  @override
  String toString() {
    return 'UploadMetadata(id: $id, poolId: $poolId, generatedTime: $generatedTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadMetadataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.poolId, poolId) || other.poolId == poolId) &&
            (identical(other.generatedTime, generatedTime) ||
                other.generatedTime == generatedTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, poolId, generatedTime);

  /// Create a copy of UploadMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadMetadataImplCopyWith<_$UploadMetadataImpl> get copyWith =>
      __$$UploadMetadataImplCopyWithImpl<_$UploadMetadataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadMetadataImplToJson(
      this,
    );
  }
}

abstract class _UploadMetadata implements UploadMetadata {
  const factory _UploadMetadata(
      {required final String id,
      final String? poolId,
      final int? generatedTime}) = _$UploadMetadataImpl;

  factory _UploadMetadata.fromJson(Map<String, dynamic> json) =
      _$UploadMetadataImpl.fromJson;

  @override
  String get id;
  @override
  String? get poolId;
  @override
  int? get generatedTime;

  /// Create a copy of UploadMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadMetadataImplCopyWith<_$UploadMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
