// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gym_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GymSettings _$GymSettingsFromJson(Map<String, dynamic> json) {
  return _GymSettings.fromJson(json);
}

/// @nodoc
mixin _$GymSettings {
  bool get hideAdult => throw _privateConstructorUsedError;
  int get minPrice => throw _privateConstructorUsedError;
  int get maxPrice => throw _privateConstructorUsedError;

  /// Serializes this GymSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GymSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GymSettingsCopyWith<GymSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GymSettingsCopyWith<$Res> {
  factory $GymSettingsCopyWith(
          GymSettings value, $Res Function(GymSettings) then) =
      _$GymSettingsCopyWithImpl<$Res, GymSettings>;
  @useResult
  $Res call({bool hideAdult, int minPrice, int maxPrice});
}

/// @nodoc
class _$GymSettingsCopyWithImpl<$Res, $Val extends GymSettings>
    implements $GymSettingsCopyWith<$Res> {
  _$GymSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GymSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hideAdult = null,
    Object? minPrice = null,
    Object? maxPrice = null,
  }) {
    return _then(_value.copyWith(
      hideAdult: null == hideAdult
          ? _value.hideAdult
          : hideAdult // ignore: cast_nullable_to_non_nullable
              as bool,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GymSettingsImplCopyWith<$Res>
    implements $GymSettingsCopyWith<$Res> {
  factory _$$GymSettingsImplCopyWith(
          _$GymSettingsImpl value, $Res Function(_$GymSettingsImpl) then) =
      __$$GymSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hideAdult, int minPrice, int maxPrice});
}

/// @nodoc
class __$$GymSettingsImplCopyWithImpl<$Res>
    extends _$GymSettingsCopyWithImpl<$Res, _$GymSettingsImpl>
    implements _$$GymSettingsImplCopyWith<$Res> {
  __$$GymSettingsImplCopyWithImpl(
      _$GymSettingsImpl _value, $Res Function(_$GymSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GymSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hideAdult = null,
    Object? minPrice = null,
    Object? maxPrice = null,
  }) {
    return _then(_$GymSettingsImpl(
      hideAdult: null == hideAdult
          ? _value.hideAdult
          : hideAdult // ignore: cast_nullable_to_non_nullable
              as bool,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GymSettingsImpl implements _GymSettings {
  const _$GymSettingsImpl(
      {this.hideAdult = true, this.minPrice = 0, this.maxPrice = 500});

  factory _$GymSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GymSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool hideAdult;
  @override
  @JsonKey()
  final int minPrice;
  @override
  @JsonKey()
  final int maxPrice;

  @override
  String toString() {
    return 'GymSettings(hideAdult: $hideAdult, minPrice: $minPrice, maxPrice: $maxPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GymSettingsImpl &&
            (identical(other.hideAdult, hideAdult) ||
                other.hideAdult == hideAdult) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hideAdult, minPrice, maxPrice);

  /// Create a copy of GymSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GymSettingsImplCopyWith<_$GymSettingsImpl> get copyWith =>
      __$$GymSettingsImplCopyWithImpl<_$GymSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GymSettingsImplToJson(
      this,
    );
  }
}

abstract class _GymSettings implements GymSettings {
  const factory _GymSettings(
      {final bool hideAdult,
      final int minPrice,
      final int maxPrice}) = _$GymSettingsImpl;

  factory _GymSettings.fromJson(Map<String, dynamic> json) =
      _$GymSettingsImpl.fromJson;

  @override
  bool get hideAdult;
  @override
  int get minPrice;
  @override
  int get maxPrice;

  /// Create a copy of GymSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GymSettingsImplCopyWith<_$GymSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
