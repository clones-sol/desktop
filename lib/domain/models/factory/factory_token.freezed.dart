// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'factory_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FactoryToken _$FactoryTokenFromJson(Map<String, dynamic> json) {
  return _FactoryToken.fromJson(json);
}

/// @nodoc
mixin _$FactoryToken {
  String get type => throw _privateConstructorUsedError; // 'ETH' | 'ERC20'
  String get symbol => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get decimals => throw _privateConstructorUsedError;

  /// Serializes this FactoryToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FactoryToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FactoryTokenCopyWith<FactoryToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactoryTokenCopyWith<$Res> {
  factory $FactoryTokenCopyWith(
          FactoryToken value, $Res Function(FactoryToken) then) =
      _$FactoryTokenCopyWithImpl<$Res, FactoryToken>;
  @useResult
  $Res call({String type, String symbol, String address, int decimals});
}

/// @nodoc
class _$FactoryTokenCopyWithImpl<$Res, $Val extends FactoryToken>
    implements $FactoryTokenCopyWith<$Res> {
  _$FactoryTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FactoryToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? symbol = null,
    Object? address = null,
    Object? decimals = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      decimals: null == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FactoryTokenImplCopyWith<$Res>
    implements $FactoryTokenCopyWith<$Res> {
  factory _$$FactoryTokenImplCopyWith(
          _$FactoryTokenImpl value, $Res Function(_$FactoryTokenImpl) then) =
      __$$FactoryTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String symbol, String address, int decimals});
}

/// @nodoc
class __$$FactoryTokenImplCopyWithImpl<$Res>
    extends _$FactoryTokenCopyWithImpl<$Res, _$FactoryTokenImpl>
    implements _$$FactoryTokenImplCopyWith<$Res> {
  __$$FactoryTokenImplCopyWithImpl(
      _$FactoryTokenImpl _value, $Res Function(_$FactoryTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of FactoryToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? symbol = null,
    Object? address = null,
    Object? decimals = null,
  }) {
    return _then(_$FactoryTokenImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      decimals: null == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FactoryTokenImpl implements _FactoryToken {
  const _$FactoryTokenImpl(
      {required this.type,
      required this.symbol,
      required this.address,
      this.decimals = 18});

  factory _$FactoryTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$FactoryTokenImplFromJson(json);

  @override
  final String type;
// 'ETH' | 'ERC20'
  @override
  final String symbol;
  @override
  final String address;
  @override
  @JsonKey()
  final int decimals;

  @override
  String toString() {
    return 'FactoryToken(type: $type, symbol: $symbol, address: $address, decimals: $decimals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FactoryTokenImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, symbol, address, decimals);

  /// Create a copy of FactoryToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FactoryTokenImplCopyWith<_$FactoryTokenImpl> get copyWith =>
      __$$FactoryTokenImplCopyWithImpl<_$FactoryTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FactoryTokenImplToJson(
      this,
    );
  }
}

abstract class _FactoryToken implements FactoryToken {
  const factory _FactoryToken(
      {required final String type,
      required final String symbol,
      required final String address,
      final int decimals}) = _$FactoryTokenImpl;

  factory _FactoryToken.fromJson(Map<String, dynamic> json) =
      _$FactoryTokenImpl.fromJson;

  @override
  String get type; // 'ETH' | 'ERC20'
  @override
  String get symbol;
  @override
  String get address;
  @override
  int get decimals;

  /// Create a copy of FactoryToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FactoryTokenImplCopyWith<_$FactoryTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
