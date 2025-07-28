// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'factory_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FactorySettings _$FactorySettingsFromJson(Map<String, dynamic> json) {
  return _FactorySettings.fromJson(json);
}

/// @nodoc
mixin _$FactorySettings {
  bool get hideAdult => throw _privateConstructorUsedError;
  int get minPrice => throw _privateConstructorUsedError;
  int get maxPrice => throw _privateConstructorUsedError;

  /// Serializes this FactorySettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FactorySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FactorySettingsCopyWith<FactorySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactorySettingsCopyWith<$Res> {
  factory $FactorySettingsCopyWith(
          FactorySettings value, $Res Function(FactorySettings) then) =
      _$FactorySettingsCopyWithImpl<$Res, FactorySettings>;
  @useResult
  $Res call({bool hideAdult, int minPrice, int maxPrice});
}

/// @nodoc
class _$FactorySettingsCopyWithImpl<$Res, $Val extends FactorySettings>
    implements $FactorySettingsCopyWith<$Res> {
  _$FactorySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FactorySettings
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
abstract class _$$FactorySettingsImplCopyWith<$Res>
    implements $FactorySettingsCopyWith<$Res> {
  factory _$$FactorySettingsImplCopyWith(_$FactorySettingsImpl value,
          $Res Function(_$FactorySettingsImpl) then) =
      __$$FactorySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hideAdult, int minPrice, int maxPrice});
}

/// @nodoc
class __$$FactorySettingsImplCopyWithImpl<$Res>
    extends _$FactorySettingsCopyWithImpl<$Res, _$FactorySettingsImpl>
    implements _$$FactorySettingsImplCopyWith<$Res> {
  __$$FactorySettingsImplCopyWithImpl(
      _$FactorySettingsImpl _value, $Res Function(_$FactorySettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FactorySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hideAdult = null,
    Object? minPrice = null,
    Object? maxPrice = null,
  }) {
    return _then(_$FactorySettingsImpl(
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
class _$FactorySettingsImpl implements _FactorySettings {
  const _$FactorySettingsImpl(
      {this.hideAdult = true, this.minPrice = 0, this.maxPrice = 500});

  factory _$FactorySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FactorySettingsImplFromJson(json);

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
    return 'FactorySettings(hideAdult: $hideAdult, minPrice: $minPrice, maxPrice: $maxPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FactorySettingsImpl &&
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

  /// Create a copy of FactorySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FactorySettingsImplCopyWith<_$FactorySettingsImpl> get copyWith =>
      __$$FactorySettingsImplCopyWithImpl<_$FactorySettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FactorySettingsImplToJson(
      this,
    );
  }
}

abstract class _FactorySettings implements FactorySettings {
  const factory _FactorySettings(
      {final bool hideAdult,
      final int minPrice,
      final int maxPrice}) = _$FactorySettingsImpl;

  factory _FactorySettings.fromJson(Map<String, dynamic> json) =
      _$FactorySettingsImpl.fromJson;

  @override
  bool get hideAdult;
  @override
  int get minPrice;
  @override
  int get maxPrice;

  /// Create a copy of FactorySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FactorySettingsImplCopyWith<_$FactorySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
