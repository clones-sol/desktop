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
mixin _$TrainingSessionState {
  Quest? get currentQuest => throw _privateConstructorUsedError;
  Quest? get activeQuest => throw _privateConstructorUsedError;
  bool get recordingLoading => throw _privateConstructorUsedError;
  bool get recordingProcessing => throw _privateConstructorUsedError;
  bool get showUploadConfirmModal => throw _privateConstructorUsedError;
  String? get currentRecordingId => throw _privateConstructorUsedError;
  bool get isUploading => throw _privateConstructorUsedError;
  bool get loadingSftData => throw _privateConstructorUsedError;
  RecordingState get recordingState => throw _privateConstructorUsedError;

  /// Create a copy of TrainingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainingSessionStateCopyWith<TrainingSessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingSessionStateCopyWith<$Res> {
  factory $TrainingSessionStateCopyWith(TrainingSessionState value,
          $Res Function(TrainingSessionState) then) =
      _$TrainingSessionStateCopyWithImpl<$Res, TrainingSessionState>;
  @useResult
  $Res call(
      {Quest? currentQuest,
      Quest? activeQuest,
      bool recordingLoading,
      bool recordingProcessing,
      bool showUploadConfirmModal,
      String? currentRecordingId,
      bool isUploading,
      bool loadingSftData,
      RecordingState recordingState});

  $QuestCopyWith<$Res>? get currentQuest;
  $QuestCopyWith<$Res>? get activeQuest;
}

/// @nodoc
class _$TrainingSessionStateCopyWithImpl<$Res,
        $Val extends TrainingSessionState>
    implements $TrainingSessionStateCopyWith<$Res> {
  _$TrainingSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentQuest = freezed,
    Object? activeQuest = freezed,
    Object? recordingLoading = null,
    Object? recordingProcessing = null,
    Object? showUploadConfirmModal = null,
    Object? currentRecordingId = freezed,
    Object? isUploading = null,
    Object? loadingSftData = null,
    Object? recordingState = null,
  }) {
    return _then(_value.copyWith(
      currentQuest: freezed == currentQuest
          ? _value.currentQuest
          : currentQuest // ignore: cast_nullable_to_non_nullable
              as Quest?,
      activeQuest: freezed == activeQuest
          ? _value.activeQuest
          : activeQuest // ignore: cast_nullable_to_non_nullable
              as Quest?,
      recordingLoading: null == recordingLoading
          ? _value.recordingLoading
          : recordingLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      recordingProcessing: null == recordingProcessing
          ? _value.recordingProcessing
          : recordingProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      showUploadConfirmModal: null == showUploadConfirmModal
          ? _value.showUploadConfirmModal
          : showUploadConfirmModal // ignore: cast_nullable_to_non_nullable
              as bool,
      currentRecordingId: freezed == currentRecordingId
          ? _value.currentRecordingId
          : currentRecordingId // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploading: null == isUploading
          ? _value.isUploading
          : isUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingSftData: null == loadingSftData
          ? _value.loadingSftData
          : loadingSftData // ignore: cast_nullable_to_non_nullable
              as bool,
      recordingState: null == recordingState
          ? _value.recordingState
          : recordingState // ignore: cast_nullable_to_non_nullable
              as RecordingState,
    ) as $Val);
  }

  /// Create a copy of TrainingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestCopyWith<$Res>? get currentQuest {
    if (_value.currentQuest == null) {
      return null;
    }

    return $QuestCopyWith<$Res>(_value.currentQuest!, (value) {
      return _then(_value.copyWith(currentQuest: value) as $Val);
    });
  }

  /// Create a copy of TrainingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestCopyWith<$Res>? get activeQuest {
    if (_value.activeQuest == null) {
      return null;
    }

    return $QuestCopyWith<$Res>(_value.activeQuest!, (value) {
      return _then(_value.copyWith(activeQuest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrainingSessionStateImplCopyWith<$Res>
    implements $TrainingSessionStateCopyWith<$Res> {
  factory _$$TrainingSessionStateImplCopyWith(_$TrainingSessionStateImpl value,
          $Res Function(_$TrainingSessionStateImpl) then) =
      __$$TrainingSessionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Quest? currentQuest,
      Quest? activeQuest,
      bool recordingLoading,
      bool recordingProcessing,
      bool showUploadConfirmModal,
      String? currentRecordingId,
      bool isUploading,
      bool loadingSftData,
      RecordingState recordingState});

  @override
  $QuestCopyWith<$Res>? get currentQuest;
  @override
  $QuestCopyWith<$Res>? get activeQuest;
}

/// @nodoc
class __$$TrainingSessionStateImplCopyWithImpl<$Res>
    extends _$TrainingSessionStateCopyWithImpl<$Res, _$TrainingSessionStateImpl>
    implements _$$TrainingSessionStateImplCopyWith<$Res> {
  __$$TrainingSessionStateImplCopyWithImpl(_$TrainingSessionStateImpl _value,
      $Res Function(_$TrainingSessionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentQuest = freezed,
    Object? activeQuest = freezed,
    Object? recordingLoading = null,
    Object? recordingProcessing = null,
    Object? showUploadConfirmModal = null,
    Object? currentRecordingId = freezed,
    Object? isUploading = null,
    Object? loadingSftData = null,
    Object? recordingState = null,
  }) {
    return _then(_$TrainingSessionStateImpl(
      currentQuest: freezed == currentQuest
          ? _value.currentQuest
          : currentQuest // ignore: cast_nullable_to_non_nullable
              as Quest?,
      activeQuest: freezed == activeQuest
          ? _value.activeQuest
          : activeQuest // ignore: cast_nullable_to_non_nullable
              as Quest?,
      recordingLoading: null == recordingLoading
          ? _value.recordingLoading
          : recordingLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      recordingProcessing: null == recordingProcessing
          ? _value.recordingProcessing
          : recordingProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      showUploadConfirmModal: null == showUploadConfirmModal
          ? _value.showUploadConfirmModal
          : showUploadConfirmModal // ignore: cast_nullable_to_non_nullable
              as bool,
      currentRecordingId: freezed == currentRecordingId
          ? _value.currentRecordingId
          : currentRecordingId // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploading: null == isUploading
          ? _value.isUploading
          : isUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingSftData: null == loadingSftData
          ? _value.loadingSftData
          : loadingSftData // ignore: cast_nullable_to_non_nullable
              as bool,
      recordingState: null == recordingState
          ? _value.recordingState
          : recordingState // ignore: cast_nullable_to_non_nullable
              as RecordingState,
    ));
  }
}

/// @nodoc

class _$TrainingSessionStateImpl extends _TrainingSessionState {
  const _$TrainingSessionStateImpl(
      {this.currentQuest,
      this.activeQuest,
      this.recordingLoading = false,
      this.recordingProcessing = false,
      this.showUploadConfirmModal = false,
      this.currentRecordingId,
      this.isUploading = false,
      this.loadingSftData = false,
      this.recordingState = RecordingState.off})
      : super._();

  @override
  final Quest? currentQuest;
  @override
  final Quest? activeQuest;
  @override
  @JsonKey()
  final bool recordingLoading;
  @override
  @JsonKey()
  final bool recordingProcessing;
  @override
  @JsonKey()
  final bool showUploadConfirmModal;
  @override
  final String? currentRecordingId;
  @override
  @JsonKey()
  final bool isUploading;
  @override
  @JsonKey()
  final bool loadingSftData;
  @override
  @JsonKey()
  final RecordingState recordingState;

  @override
  String toString() {
    return 'TrainingSessionState(currentQuest: $currentQuest, activeQuest: $activeQuest, recordingLoading: $recordingLoading, recordingProcessing: $recordingProcessing, showUploadConfirmModal: $showUploadConfirmModal, currentRecordingId: $currentRecordingId, isUploading: $isUploading, loadingSftData: $loadingSftData, recordingState: $recordingState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainingSessionStateImpl &&
            (identical(other.currentQuest, currentQuest) ||
                other.currentQuest == currentQuest) &&
            (identical(other.activeQuest, activeQuest) ||
                other.activeQuest == activeQuest) &&
            (identical(other.recordingLoading, recordingLoading) ||
                other.recordingLoading == recordingLoading) &&
            (identical(other.recordingProcessing, recordingProcessing) ||
                other.recordingProcessing == recordingProcessing) &&
            (identical(other.showUploadConfirmModal, showUploadConfirmModal) ||
                other.showUploadConfirmModal == showUploadConfirmModal) &&
            (identical(other.currentRecordingId, currentRecordingId) ||
                other.currentRecordingId == currentRecordingId) &&
            (identical(other.isUploading, isUploading) ||
                other.isUploading == isUploading) &&
            (identical(other.loadingSftData, loadingSftData) ||
                other.loadingSftData == loadingSftData) &&
            (identical(other.recordingState, recordingState) ||
                other.recordingState == recordingState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentQuest,
      activeQuest,
      recordingLoading,
      recordingProcessing,
      showUploadConfirmModal,
      currentRecordingId,
      isUploading,
      loadingSftData,
      recordingState);

  /// Create a copy of TrainingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingSessionStateImplCopyWith<_$TrainingSessionStateImpl>
      get copyWith =>
          __$$TrainingSessionStateImplCopyWithImpl<_$TrainingSessionStateImpl>(
              this, _$identity);
}

abstract class _TrainingSessionState extends TrainingSessionState {
  const factory _TrainingSessionState(
      {final Quest? currentQuest,
      final Quest? activeQuest,
      final bool recordingLoading,
      final bool recordingProcessing,
      final bool showUploadConfirmModal,
      final String? currentRecordingId,
      final bool isUploading,
      final bool loadingSftData,
      final RecordingState recordingState}) = _$TrainingSessionStateImpl;
  const _TrainingSessionState._() : super._();

  @override
  Quest? get currentQuest;
  @override
  Quest? get activeQuest;
  @override
  bool get recordingLoading;
  @override
  bool get recordingProcessing;
  @override
  bool get showUploadConfirmModal;
  @override
  String? get currentRecordingId;
  @override
  bool get isUploading;
  @override
  bool get loadingSftData;
  @override
  RecordingState get recordingState;

  /// Create a copy of TrainingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainingSessionStateImplCopyWith<_$TrainingSessionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
