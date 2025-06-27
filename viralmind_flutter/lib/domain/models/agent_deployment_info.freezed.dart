// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_deployment_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgentDeploymentInfo _$AgentDeploymentInfoFromJson(Map<String, dynamic> json) {
  return _AgentDeploymentInfo.fromJson(json);
}

/// @nodoc
mixin _$AgentDeploymentInfo {
  String get name => throw _privateConstructorUsedError;
  String get ticker => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<int>? get logo => throw _privateConstructorUsedError;
  List<int>? get proofOfExecutionVideo => throw _privateConstructorUsedError;
  int get supplyPreset => throw _privateConstructorUsedError;

  /// Serializes this AgentDeploymentInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentDeploymentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentDeploymentInfoCopyWith<AgentDeploymentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentDeploymentInfoCopyWith<$Res> {
  factory $AgentDeploymentInfoCopyWith(
          AgentDeploymentInfo value, $Res Function(AgentDeploymentInfo) then) =
      _$AgentDeploymentInfoCopyWithImpl<$Res, AgentDeploymentInfo>;
  @useResult
  $Res call(
      {String name,
      String ticker,
      String description,
      List<int>? logo,
      List<int>? proofOfExecutionVideo,
      int supplyPreset});
}

/// @nodoc
class _$AgentDeploymentInfoCopyWithImpl<$Res, $Val extends AgentDeploymentInfo>
    implements $AgentDeploymentInfoCopyWith<$Res> {
  _$AgentDeploymentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentDeploymentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ticker = null,
    Object? description = null,
    Object? logo = freezed,
    Object? proofOfExecutionVideo = freezed,
    Object? supplyPreset = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      proofOfExecutionVideo: freezed == proofOfExecutionVideo
          ? _value.proofOfExecutionVideo
          : proofOfExecutionVideo // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      supplyPreset: null == supplyPreset
          ? _value.supplyPreset
          : supplyPreset // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgentDeploymentInfoImplCopyWith<$Res>
    implements $AgentDeploymentInfoCopyWith<$Res> {
  factory _$$AgentDeploymentInfoImplCopyWith(_$AgentDeploymentInfoImpl value,
          $Res Function(_$AgentDeploymentInfoImpl) then) =
      __$$AgentDeploymentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String ticker,
      String description,
      List<int>? logo,
      List<int>? proofOfExecutionVideo,
      int supplyPreset});
}

/// @nodoc
class __$$AgentDeploymentInfoImplCopyWithImpl<$Res>
    extends _$AgentDeploymentInfoCopyWithImpl<$Res, _$AgentDeploymentInfoImpl>
    implements _$$AgentDeploymentInfoImplCopyWith<$Res> {
  __$$AgentDeploymentInfoImplCopyWithImpl(_$AgentDeploymentInfoImpl _value,
      $Res Function(_$AgentDeploymentInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentDeploymentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ticker = null,
    Object? description = null,
    Object? logo = freezed,
    Object? proofOfExecutionVideo = freezed,
    Object? supplyPreset = null,
  }) {
    return _then(_$AgentDeploymentInfoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value._logo
          : logo // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      proofOfExecutionVideo: freezed == proofOfExecutionVideo
          ? _value._proofOfExecutionVideo
          : proofOfExecutionVideo // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      supplyPreset: null == supplyPreset
          ? _value.supplyPreset
          : supplyPreset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentDeploymentInfoImpl implements _AgentDeploymentInfo {
  const _$AgentDeploymentInfoImpl(
      {required this.name,
      required this.ticker,
      required this.description,
      final List<int>? logo,
      final List<int>? proofOfExecutionVideo,
      this.supplyPreset = 0})
      : _logo = logo,
        _proofOfExecutionVideo = proofOfExecutionVideo;

  factory _$AgentDeploymentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentDeploymentInfoImplFromJson(json);

  @override
  final String name;
  @override
  final String ticker;
  @override
  final String description;
  final List<int>? _logo;
  @override
  List<int>? get logo {
    final value = _logo;
    if (value == null) return null;
    if (_logo is EqualUnmodifiableListView) return _logo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _proofOfExecutionVideo;
  @override
  List<int>? get proofOfExecutionVideo {
    final value = _proofOfExecutionVideo;
    if (value == null) return null;
    if (_proofOfExecutionVideo is EqualUnmodifiableListView)
      return _proofOfExecutionVideo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int supplyPreset;

  @override
  String toString() {
    return 'AgentDeploymentInfo(name: $name, ticker: $ticker, description: $description, logo: $logo, proofOfExecutionVideo: $proofOfExecutionVideo, supplyPreset: $supplyPreset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentDeploymentInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ticker, ticker) || other.ticker == ticker) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._logo, _logo) &&
            const DeepCollectionEquality()
                .equals(other._proofOfExecutionVideo, _proofOfExecutionVideo) &&
            (identical(other.supplyPreset, supplyPreset) ||
                other.supplyPreset == supplyPreset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      ticker,
      description,
      const DeepCollectionEquality().hash(_logo),
      const DeepCollectionEquality().hash(_proofOfExecutionVideo),
      supplyPreset);

  /// Create a copy of AgentDeploymentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentDeploymentInfoImplCopyWith<_$AgentDeploymentInfoImpl> get copyWith =>
      __$$AgentDeploymentInfoImplCopyWithImpl<_$AgentDeploymentInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentDeploymentInfoImplToJson(
      this,
    );
  }
}

abstract class _AgentDeploymentInfo implements AgentDeploymentInfo {
  const factory _AgentDeploymentInfo(
      {required final String name,
      required final String ticker,
      required final String description,
      final List<int>? logo,
      final List<int>? proofOfExecutionVideo,
      final int supplyPreset}) = _$AgentDeploymentInfoImpl;

  factory _AgentDeploymentInfo.fromJson(Map<String, dynamic> json) =
      _$AgentDeploymentInfoImpl.fromJson;

  @override
  String get name;
  @override
  String get ticker;
  @override
  String get description;
  @override
  List<int>? get logo;
  @override
  List<int>? get proofOfExecutionVideo;
  @override
  int get supplyPreset;

  /// Create a copy of AgentDeploymentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentDeploymentInfoImplCopyWith<_$AgentDeploymentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
