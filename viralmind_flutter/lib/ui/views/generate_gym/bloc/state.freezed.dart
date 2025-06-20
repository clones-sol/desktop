// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GenerateGymState {
  String? get skills => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get gymName => throw _privateConstructorUsedError;
  List<ForgeApp>? get apps => throw _privateConstructorUsedError;
  bool get showJsonEditor => throw _privateConstructorUsedError;
  GenerateGymStep get currentStep => throw _privateConstructorUsedError;

  /// Create a copy of GenerateGymState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerateGymStateCopyWith<GenerateGymState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateGymStateCopyWith<$Res> {
  factory $GenerateGymStateCopyWith(
          GenerateGymState value, $Res Function(GenerateGymState) then) =
      _$GenerateGymStateCopyWithImpl<$Res, GenerateGymState>;
  @useResult
  $Res call(
      {String? skills,
      String? error,
      String? gymName,
      List<ForgeApp>? apps,
      bool showJsonEditor,
      GenerateGymStep currentStep});
}

/// @nodoc
class _$GenerateGymStateCopyWithImpl<$Res, $Val extends GenerateGymState>
    implements $GenerateGymStateCopyWith<$Res> {
  _$GenerateGymStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerateGymState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skills = freezed,
    Object? error = freezed,
    Object? gymName = freezed,
    Object? apps = freezed,
    Object? showJsonEditor = null,
    Object? currentStep = null,
  }) {
    return _then(_value.copyWith(
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      gymName: freezed == gymName
          ? _value.gymName
          : gymName // ignore: cast_nullable_to_non_nullable
              as String?,
      apps: freezed == apps
          ? _value.apps
          : apps // ignore: cast_nullable_to_non_nullable
              as List<ForgeApp>?,
      showJsonEditor: null == showJsonEditor
          ? _value.showJsonEditor
          : showJsonEditor // ignore: cast_nullable_to_non_nullable
              as bool,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as GenerateGymStep,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerateGymStateImplCopyWith<$Res>
    implements $GenerateGymStateCopyWith<$Res> {
  factory _$$GenerateGymStateImplCopyWith(_$GenerateGymStateImpl value,
          $Res Function(_$GenerateGymStateImpl) then) =
      __$$GenerateGymStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? skills,
      String? error,
      String? gymName,
      List<ForgeApp>? apps,
      bool showJsonEditor,
      GenerateGymStep currentStep});
}

/// @nodoc
class __$$GenerateGymStateImplCopyWithImpl<$Res>
    extends _$GenerateGymStateCopyWithImpl<$Res, _$GenerateGymStateImpl>
    implements _$$GenerateGymStateImplCopyWith<$Res> {
  __$$GenerateGymStateImplCopyWithImpl(_$GenerateGymStateImpl _value,
      $Res Function(_$GenerateGymStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerateGymState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skills = freezed,
    Object? error = freezed,
    Object? gymName = freezed,
    Object? apps = freezed,
    Object? showJsonEditor = null,
    Object? currentStep = null,
  }) {
    return _then(_$GenerateGymStateImpl(
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      gymName: freezed == gymName
          ? _value.gymName
          : gymName // ignore: cast_nullable_to_non_nullable
              as String?,
      apps: freezed == apps
          ? _value._apps
          : apps // ignore: cast_nullable_to_non_nullable
              as List<ForgeApp>?,
      showJsonEditor: null == showJsonEditor
          ? _value.showJsonEditor
          : showJsonEditor // ignore: cast_nullable_to_non_nullable
              as bool,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as GenerateGymStep,
    ));
  }
}

/// @nodoc

class _$GenerateGymStateImpl extends _GenerateGymState {
  const _$GenerateGymStateImpl(
      {this.skills,
      this.error,
      this.gymName,
      final List<ForgeApp>? apps,
      this.showJsonEditor = false,
      this.currentStep = GenerateGymStep.input})
      : _apps = apps,
        super._();

  @override
  final String? skills;
  @override
  final String? error;
  @override
  final String? gymName;
  final List<ForgeApp>? _apps;
  @override
  List<ForgeApp>? get apps {
    final value = _apps;
    if (value == null) return null;
    if (_apps is EqualUnmodifiableListView) return _apps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool showJsonEditor;
  @override
  @JsonKey()
  final GenerateGymStep currentStep;

  @override
  String toString() {
    return 'GenerateGymState(skills: $skills, error: $error, gymName: $gymName, apps: $apps, showJsonEditor: $showJsonEditor, currentStep: $currentStep)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateGymStateImpl &&
            (identical(other.skills, skills) || other.skills == skills) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.gymName, gymName) || other.gymName == gymName) &&
            const DeepCollectionEquality().equals(other._apps, _apps) &&
            (identical(other.showJsonEditor, showJsonEditor) ||
                other.showJsonEditor == showJsonEditor) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep));
  }

  @override
  int get hashCode => Object.hash(runtimeType, skills, error, gymName,
      const DeepCollectionEquality().hash(_apps), showJsonEditor, currentStep);

  /// Create a copy of GenerateGymState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateGymStateImplCopyWith<_$GenerateGymStateImpl> get copyWith =>
      __$$GenerateGymStateImplCopyWithImpl<_$GenerateGymStateImpl>(
          this, _$identity);
}

abstract class _GenerateGymState extends GenerateGymState {
  const factory _GenerateGymState(
      {final String? skills,
      final String? error,
      final String? gymName,
      final List<ForgeApp>? apps,
      final bool showJsonEditor,
      final GenerateGymStep currentStep}) = _$GenerateGymStateImpl;
  const _GenerateGymState._() : super._();

  @override
  String? get skills;
  @override
  String? get error;
  @override
  String? get gymName;
  @override
  List<ForgeApp>? get apps;
  @override
  bool get showJsonEditor;
  @override
  GenerateGymStep get currentStep;

  /// Create a copy of GenerateGymState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateGymStateImplCopyWith<_$GenerateGymStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
