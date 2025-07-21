// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supported_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SupportedToken _$SupportedTokenFromJson(Map<String, dynamic> json) {
  return _SupportedToken.fromJson(json);
}

/// @nodoc
mixin _$SupportedToken {
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;

  /// Serializes this SupportedToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SupportedToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupportedTokenCopyWith<SupportedToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportedTokenCopyWith<$Res> {
  factory $SupportedTokenCopyWith(
          SupportedToken value, $Res Function(SupportedToken) then) =
      _$SupportedTokenCopyWithImpl<$Res, SupportedToken>;
  @useResult
  $Res call({String name, String symbol, String? logoUrl});
}

/// @nodoc
class _$SupportedTokenCopyWithImpl<$Res, $Val extends SupportedToken>
    implements $SupportedTokenCopyWith<$Res> {
  _$SupportedTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupportedToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? symbol = null,
    Object? logoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupportedTokenImplCopyWith<$Res>
    implements $SupportedTokenCopyWith<$Res> {
  factory _$$SupportedTokenImplCopyWith(_$SupportedTokenImpl value,
          $Res Function(_$SupportedTokenImpl) then) =
      __$$SupportedTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String symbol, String? logoUrl});
}

/// @nodoc
class __$$SupportedTokenImplCopyWithImpl<$Res>
    extends _$SupportedTokenCopyWithImpl<$Res, _$SupportedTokenImpl>
    implements _$$SupportedTokenImplCopyWith<$Res> {
  __$$SupportedTokenImplCopyWithImpl(
      _$SupportedTokenImpl _value, $Res Function(_$SupportedTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of SupportedToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? symbol = null,
    Object? logoUrl = freezed,
  }) {
    return _then(_$SupportedTokenImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SupportedTokenImpl implements _SupportedToken {
  const _$SupportedTokenImpl(
      {required this.name, required this.symbol, required this.logoUrl});

  factory _$SupportedTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupportedTokenImplFromJson(json);

  @override
  final String name;
  @override
  final String symbol;
  @override
  final String? logoUrl;

  @override
  String toString() {
    return 'SupportedToken(name: $name, symbol: $symbol, logoUrl: $logoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportedTokenImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, symbol, logoUrl);

  /// Create a copy of SupportedToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportedTokenImplCopyWith<_$SupportedTokenImpl> get copyWith =>
      __$$SupportedTokenImplCopyWithImpl<_$SupportedTokenImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupportedTokenImplToJson(
      this,
    );
  }
}

abstract class _SupportedToken implements SupportedToken {
  const factory _SupportedToken(
      {required final String name,
      required final String symbol,
      required final String? logoUrl}) = _$SupportedTokenImpl;

  factory _SupportedToken.fromJson(Map<String, dynamic> json) =
      _$SupportedTokenImpl.fromJson;

  @override
  String get name;
  @override
  String get symbol;
  @override
  String? get logoUrl;

  /// Create a copy of SupportedToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupportedTokenImplCopyWith<_$SupportedTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
