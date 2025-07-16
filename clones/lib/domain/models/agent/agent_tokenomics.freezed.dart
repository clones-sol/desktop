// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_tokenomics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgentTokenomics _$AgentTokenomicsFromJson(Map<String, dynamic> json) {
  return _AgentTokenomics.fromJson(json);
}

/// @nodoc
mixin _$AgentTokenomics {
  int get supply => throw _privateConstructorUsedError;
  double get minLiquiditySol => throw _privateConstructorUsedError;
  double get gatedPercentage => throw _privateConstructorUsedError;
  int get decimals => throw _privateConstructorUsedError;

  /// Serializes this AgentTokenomics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentTokenomics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentTokenomicsCopyWith<AgentTokenomics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentTokenomicsCopyWith<$Res> {
  factory $AgentTokenomicsCopyWith(
          AgentTokenomics value, $Res Function(AgentTokenomics) then) =
      _$AgentTokenomicsCopyWithImpl<$Res, AgentTokenomics>;
  @useResult
  $Res call(
      {int supply,
      double minLiquiditySol,
      double gatedPercentage,
      int decimals});
}

/// @nodoc
class _$AgentTokenomicsCopyWithImpl<$Res, $Val extends AgentTokenomics>
    implements $AgentTokenomicsCopyWith<$Res> {
  _$AgentTokenomicsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentTokenomics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supply = null,
    Object? minLiquiditySol = null,
    Object? gatedPercentage = null,
    Object? decimals = null,
  }) {
    return _then(_value.copyWith(
      supply: null == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as int,
      minLiquiditySol: null == minLiquiditySol
          ? _value.minLiquiditySol
          : minLiquiditySol // ignore: cast_nullable_to_non_nullable
              as double,
      gatedPercentage: null == gatedPercentage
          ? _value.gatedPercentage
          : gatedPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      decimals: null == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgentTokenomicsImplCopyWith<$Res>
    implements $AgentTokenomicsCopyWith<$Res> {
  factory _$$AgentTokenomicsImplCopyWith(_$AgentTokenomicsImpl value,
          $Res Function(_$AgentTokenomicsImpl) then) =
      __$$AgentTokenomicsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int supply,
      double minLiquiditySol,
      double gatedPercentage,
      int decimals});
}

/// @nodoc
class __$$AgentTokenomicsImplCopyWithImpl<$Res>
    extends _$AgentTokenomicsCopyWithImpl<$Res, _$AgentTokenomicsImpl>
    implements _$$AgentTokenomicsImplCopyWith<$Res> {
  __$$AgentTokenomicsImplCopyWithImpl(
      _$AgentTokenomicsImpl _value, $Res Function(_$AgentTokenomicsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentTokenomics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supply = null,
    Object? minLiquiditySol = null,
    Object? gatedPercentage = null,
    Object? decimals = null,
  }) {
    return _then(_$AgentTokenomicsImpl(
      supply: null == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as int,
      minLiquiditySol: null == minLiquiditySol
          ? _value.minLiquiditySol
          : minLiquiditySol // ignore: cast_nullable_to_non_nullable
              as double,
      gatedPercentage: null == gatedPercentage
          ? _value.gatedPercentage
          : gatedPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      decimals: null == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentTokenomicsImpl implements _AgentTokenomics {
  const _$AgentTokenomicsImpl(
      {required this.supply,
      required this.minLiquiditySol,
      this.gatedPercentage = 0,
      this.decimals = 9});

  factory _$AgentTokenomicsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentTokenomicsImplFromJson(json);

  @override
  final int supply;
  @override
  final double minLiquiditySol;
  @override
  @JsonKey()
  final double gatedPercentage;
  @override
  @JsonKey()
  final int decimals;

  @override
  String toString() {
    return 'AgentTokenomics(supply: $supply, minLiquiditySol: $minLiquiditySol, gatedPercentage: $gatedPercentage, decimals: $decimals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentTokenomicsImpl &&
            (identical(other.supply, supply) || other.supply == supply) &&
            (identical(other.minLiquiditySol, minLiquiditySol) ||
                other.minLiquiditySol == minLiquiditySol) &&
            (identical(other.gatedPercentage, gatedPercentage) ||
                other.gatedPercentage == gatedPercentage) &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, supply, minLiquiditySol, gatedPercentage, decimals);

  /// Create a copy of AgentTokenomics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentTokenomicsImplCopyWith<_$AgentTokenomicsImpl> get copyWith =>
      __$$AgentTokenomicsImplCopyWithImpl<_$AgentTokenomicsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentTokenomicsImplToJson(
      this,
    );
  }
}

abstract class _AgentTokenomics implements AgentTokenomics {
  const factory _AgentTokenomics(
      {required final int supply,
      required final double minLiquiditySol,
      final double gatedPercentage,
      final int decimals}) = _$AgentTokenomicsImpl;

  factory _AgentTokenomics.fromJson(Map<String, dynamic> json) =
      _$AgentTokenomicsImpl.fromJson;

  @override
  int get supply;
  @override
  double get minLiquiditySol;
  @override
  double get gatedPercentage;
  @override
  int get decimals;

  /// Create a copy of AgentTokenomics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentTokenomicsImplCopyWith<_$AgentTokenomicsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
