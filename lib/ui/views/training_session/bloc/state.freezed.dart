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
  String? get prompt => throw _privateConstructorUsedError;
  String? get poolId => throw _privateConstructorUsedError;
  Demonstration? get currentDemonstration => throw _privateConstructorUsedError;
  Demonstration? get activeDemonstration => throw _privateConstructorUsedError;
  bool get recordingLoading => throw _privateConstructorUsedError;
  bool get recordingProcessing => throw _privateConstructorUsedError;
  bool get showUploadConfirmModal => throw _privateConstructorUsedError;
  String? get currentRecordingId => throw _privateConstructorUsedError;
  bool get isUploading => throw _privateConstructorUsedError;
  Size? get originalWindowSize => throw _privateConstructorUsedError;
  bool get loadingSftData => throw _privateConstructorUsedError;
  RecordingState get recordingState => throw _privateConstructorUsedError;
  List<Message> get chatMessages => throw _privateConstructorUsedError;
  TypingMessage? get typingMessage => throw _privateConstructorUsedError;
  bool get isWaitingForResponse => throw _privateConstructorUsedError;
  int? get hoveredMessageIndex => throw _privateConstructorUsedError;
  List<DeletedRange> get deletedRanges => throw _privateConstructorUsedError;
  List<SftMessage>? get originalSftData => throw _privateConstructorUsedError;
  AppInfo? get app => throw _privateConstructorUsedError;
  int get scrollToBottomNonce => throw _privateConstructorUsedError;
  AudioPlayer? get toneAudio => throw _privateConstructorUsedError;
  AudioPlayer? get blipAudio => throw _privateConstructorUsedError;

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
      {String? prompt,
      String? poolId,
      Demonstration? currentDemonstration,
      Demonstration? activeDemonstration,
      bool recordingLoading,
      bool recordingProcessing,
      bool showUploadConfirmModal,
      String? currentRecordingId,
      bool isUploading,
      Size? originalWindowSize,
      bool loadingSftData,
      RecordingState recordingState,
      List<Message> chatMessages,
      TypingMessage? typingMessage,
      bool isWaitingForResponse,
      int? hoveredMessageIndex,
      List<DeletedRange> deletedRanges,
      List<SftMessage>? originalSftData,
      AppInfo? app,
      int scrollToBottomNonce,
      AudioPlayer? toneAudio,
      AudioPlayer? blipAudio});

  $DemonstrationCopyWith<$Res>? get currentDemonstration;
  $DemonstrationCopyWith<$Res>? get activeDemonstration;
  $TypingMessageCopyWith<$Res>? get typingMessage;
  $AppInfoCopyWith<$Res>? get app;
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
    Object? prompt = freezed,
    Object? poolId = freezed,
    Object? currentDemonstration = freezed,
    Object? activeDemonstration = freezed,
    Object? recordingLoading = null,
    Object? recordingProcessing = null,
    Object? showUploadConfirmModal = null,
    Object? currentRecordingId = freezed,
    Object? isUploading = null,
    Object? originalWindowSize = freezed,
    Object? loadingSftData = null,
    Object? recordingState = null,
    Object? chatMessages = null,
    Object? typingMessage = freezed,
    Object? isWaitingForResponse = null,
    Object? hoveredMessageIndex = freezed,
    Object? deletedRanges = null,
    Object? originalSftData = freezed,
    Object? app = freezed,
    Object? scrollToBottomNonce = null,
    Object? toneAudio = freezed,
    Object? blipAudio = freezed,
  }) {
    return _then(_value.copyWith(
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
      poolId: freezed == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentDemonstration: freezed == currentDemonstration
          ? _value.currentDemonstration
          : currentDemonstration // ignore: cast_nullable_to_non_nullable
              as Demonstration?,
      activeDemonstration: freezed == activeDemonstration
          ? _value.activeDemonstration
          : activeDemonstration // ignore: cast_nullable_to_non_nullable
              as Demonstration?,
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
      originalWindowSize: freezed == originalWindowSize
          ? _value.originalWindowSize
          : originalWindowSize // ignore: cast_nullable_to_non_nullable
              as Size?,
      loadingSftData: null == loadingSftData
          ? _value.loadingSftData
          : loadingSftData // ignore: cast_nullable_to_non_nullable
              as bool,
      recordingState: null == recordingState
          ? _value.recordingState
          : recordingState // ignore: cast_nullable_to_non_nullable
              as RecordingState,
      chatMessages: null == chatMessages
          ? _value.chatMessages
          : chatMessages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      typingMessage: freezed == typingMessage
          ? _value.typingMessage
          : typingMessage // ignore: cast_nullable_to_non_nullable
              as TypingMessage?,
      isWaitingForResponse: null == isWaitingForResponse
          ? _value.isWaitingForResponse
          : isWaitingForResponse // ignore: cast_nullable_to_non_nullable
              as bool,
      hoveredMessageIndex: freezed == hoveredMessageIndex
          ? _value.hoveredMessageIndex
          : hoveredMessageIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedRanges: null == deletedRanges
          ? _value.deletedRanges
          : deletedRanges // ignore: cast_nullable_to_non_nullable
              as List<DeletedRange>,
      originalSftData: freezed == originalSftData
          ? _value.originalSftData
          : originalSftData // ignore: cast_nullable_to_non_nullable
              as List<SftMessage>?,
      app: freezed == app
          ? _value.app
          : app // ignore: cast_nullable_to_non_nullable
              as AppInfo?,
      scrollToBottomNonce: null == scrollToBottomNonce
          ? _value.scrollToBottomNonce
          : scrollToBottomNonce // ignore: cast_nullable_to_non_nullable
              as int,
      toneAudio: freezed == toneAudio
          ? _value.toneAudio
          : toneAudio // ignore: cast_nullable_to_non_nullable
              as AudioPlayer?,
      blipAudio: freezed == blipAudio
          ? _value.blipAudio
          : blipAudio // ignore: cast_nullable_to_non_nullable
              as AudioPlayer?,
    ) as $Val);
  }

  /// Create a copy of TrainingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DemonstrationCopyWith<$Res>? get currentDemonstration {
    if (_value.currentDemonstration == null) {
      return null;
    }

    return $DemonstrationCopyWith<$Res>(_value.currentDemonstration!, (value) {
      return _then(_value.copyWith(currentDemonstration: value) as $Val);
    });
  }

  /// Create a copy of TrainingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DemonstrationCopyWith<$Res>? get activeDemonstration {
    if (_value.activeDemonstration == null) {
      return null;
    }

    return $DemonstrationCopyWith<$Res>(_value.activeDemonstration!, (value) {
      return _then(_value.copyWith(activeDemonstration: value) as $Val);
    });
  }

  /// Create a copy of TrainingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TypingMessageCopyWith<$Res>? get typingMessage {
    if (_value.typingMessage == null) {
      return null;
    }

    return $TypingMessageCopyWith<$Res>(_value.typingMessage!, (value) {
      return _then(_value.copyWith(typingMessage: value) as $Val);
    });
  }

  /// Create a copy of TrainingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppInfoCopyWith<$Res>? get app {
    if (_value.app == null) {
      return null;
    }

    return $AppInfoCopyWith<$Res>(_value.app!, (value) {
      return _then(_value.copyWith(app: value) as $Val);
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
      {String? prompt,
      String? poolId,
      Demonstration? currentDemonstration,
      Demonstration? activeDemonstration,
      bool recordingLoading,
      bool recordingProcessing,
      bool showUploadConfirmModal,
      String? currentRecordingId,
      bool isUploading,
      Size? originalWindowSize,
      bool loadingSftData,
      RecordingState recordingState,
      List<Message> chatMessages,
      TypingMessage? typingMessage,
      bool isWaitingForResponse,
      int? hoveredMessageIndex,
      List<DeletedRange> deletedRanges,
      List<SftMessage>? originalSftData,
      AppInfo? app,
      int scrollToBottomNonce,
      AudioPlayer? toneAudio,
      AudioPlayer? blipAudio});

  @override
  $DemonstrationCopyWith<$Res>? get currentDemonstration;
  @override
  $DemonstrationCopyWith<$Res>? get activeDemonstration;
  @override
  $TypingMessageCopyWith<$Res>? get typingMessage;
  @override
  $AppInfoCopyWith<$Res>? get app;
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
    Object? prompt = freezed,
    Object? poolId = freezed,
    Object? currentDemonstration = freezed,
    Object? activeDemonstration = freezed,
    Object? recordingLoading = null,
    Object? recordingProcessing = null,
    Object? showUploadConfirmModal = null,
    Object? currentRecordingId = freezed,
    Object? isUploading = null,
    Object? originalWindowSize = freezed,
    Object? loadingSftData = null,
    Object? recordingState = null,
    Object? chatMessages = null,
    Object? typingMessage = freezed,
    Object? isWaitingForResponse = null,
    Object? hoveredMessageIndex = freezed,
    Object? deletedRanges = null,
    Object? originalSftData = freezed,
    Object? app = freezed,
    Object? scrollToBottomNonce = null,
    Object? toneAudio = freezed,
    Object? blipAudio = freezed,
  }) {
    return _then(_$TrainingSessionStateImpl(
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
      poolId: freezed == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentDemonstration: freezed == currentDemonstration
          ? _value.currentDemonstration
          : currentDemonstration // ignore: cast_nullable_to_non_nullable
              as Demonstration?,
      activeDemonstration: freezed == activeDemonstration
          ? _value.activeDemonstration
          : activeDemonstration // ignore: cast_nullable_to_non_nullable
              as Demonstration?,
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
      originalWindowSize: freezed == originalWindowSize
          ? _value.originalWindowSize
          : originalWindowSize // ignore: cast_nullable_to_non_nullable
              as Size?,
      loadingSftData: null == loadingSftData
          ? _value.loadingSftData
          : loadingSftData // ignore: cast_nullable_to_non_nullable
              as bool,
      recordingState: null == recordingState
          ? _value.recordingState
          : recordingState // ignore: cast_nullable_to_non_nullable
              as RecordingState,
      chatMessages: null == chatMessages
          ? _value._chatMessages
          : chatMessages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      typingMessage: freezed == typingMessage
          ? _value.typingMessage
          : typingMessage // ignore: cast_nullable_to_non_nullable
              as TypingMessage?,
      isWaitingForResponse: null == isWaitingForResponse
          ? _value.isWaitingForResponse
          : isWaitingForResponse // ignore: cast_nullable_to_non_nullable
              as bool,
      hoveredMessageIndex: freezed == hoveredMessageIndex
          ? _value.hoveredMessageIndex
          : hoveredMessageIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedRanges: null == deletedRanges
          ? _value._deletedRanges
          : deletedRanges // ignore: cast_nullable_to_non_nullable
              as List<DeletedRange>,
      originalSftData: freezed == originalSftData
          ? _value._originalSftData
          : originalSftData // ignore: cast_nullable_to_non_nullable
              as List<SftMessage>?,
      app: freezed == app
          ? _value.app
          : app // ignore: cast_nullable_to_non_nullable
              as AppInfo?,
      scrollToBottomNonce: null == scrollToBottomNonce
          ? _value.scrollToBottomNonce
          : scrollToBottomNonce // ignore: cast_nullable_to_non_nullable
              as int,
      toneAudio: freezed == toneAudio
          ? _value.toneAudio
          : toneAudio // ignore: cast_nullable_to_non_nullable
              as AudioPlayer?,
      blipAudio: freezed == blipAudio
          ? _value.blipAudio
          : blipAudio // ignore: cast_nullable_to_non_nullable
              as AudioPlayer?,
    ));
  }
}

/// @nodoc

class _$TrainingSessionStateImpl extends _TrainingSessionState {
  const _$TrainingSessionStateImpl(
      {this.prompt,
      this.poolId,
      this.currentDemonstration,
      this.activeDemonstration,
      this.recordingLoading = false,
      this.recordingProcessing = false,
      this.showUploadConfirmModal = false,
      this.currentRecordingId,
      this.isUploading = false,
      this.originalWindowSize,
      this.loadingSftData = false,
      this.recordingState = RecordingState.off,
      final List<Message> chatMessages = const [],
      this.typingMessage = null,
      this.isWaitingForResponse = false,
      this.hoveredMessageIndex = null,
      final List<DeletedRange> deletedRanges = const [],
      final List<SftMessage>? originalSftData = null,
      this.app,
      this.scrollToBottomNonce = 0,
      this.toneAudio,
      this.blipAudio})
      : _chatMessages = chatMessages,
        _deletedRanges = deletedRanges,
        _originalSftData = originalSftData,
        super._();

  @override
  final String? prompt;
  @override
  final String? poolId;
  @override
  final Demonstration? currentDemonstration;
  @override
  final Demonstration? activeDemonstration;
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
  final Size? originalWindowSize;
  @override
  @JsonKey()
  final bool loadingSftData;
  @override
  @JsonKey()
  final RecordingState recordingState;
  final List<Message> _chatMessages;
  @override
  @JsonKey()
  List<Message> get chatMessages {
    if (_chatMessages is EqualUnmodifiableListView) return _chatMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatMessages);
  }

  @override
  @JsonKey()
  final TypingMessage? typingMessage;
  @override
  @JsonKey()
  final bool isWaitingForResponse;
  @override
  @JsonKey()
  final int? hoveredMessageIndex;
  final List<DeletedRange> _deletedRanges;
  @override
  @JsonKey()
  List<DeletedRange> get deletedRanges {
    if (_deletedRanges is EqualUnmodifiableListView) return _deletedRanges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deletedRanges);
  }

  final List<SftMessage>? _originalSftData;
  @override
  @JsonKey()
  List<SftMessage>? get originalSftData {
    final value = _originalSftData;
    if (value == null) return null;
    if (_originalSftData is EqualUnmodifiableListView) return _originalSftData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AppInfo? app;
  @override
  @JsonKey()
  final int scrollToBottomNonce;
  @override
  final AudioPlayer? toneAudio;
  @override
  final AudioPlayer? blipAudio;

  @override
  String toString() {
    return 'TrainingSessionState(prompt: $prompt, poolId: $poolId, currentDemonstration: $currentDemonstration, activeDemonstration: $activeDemonstration, recordingLoading: $recordingLoading, recordingProcessing: $recordingProcessing, showUploadConfirmModal: $showUploadConfirmModal, currentRecordingId: $currentRecordingId, isUploading: $isUploading, originalWindowSize: $originalWindowSize, loadingSftData: $loadingSftData, recordingState: $recordingState, chatMessages: $chatMessages, typingMessage: $typingMessage, isWaitingForResponse: $isWaitingForResponse, hoveredMessageIndex: $hoveredMessageIndex, deletedRanges: $deletedRanges, originalSftData: $originalSftData, app: $app, scrollToBottomNonce: $scrollToBottomNonce, toneAudio: $toneAudio, blipAudio: $blipAudio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainingSessionStateImpl &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.poolId, poolId) || other.poolId == poolId) &&
            (identical(other.currentDemonstration, currentDemonstration) ||
                other.currentDemonstration == currentDemonstration) &&
            (identical(other.activeDemonstration, activeDemonstration) ||
                other.activeDemonstration == activeDemonstration) &&
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
            (identical(other.originalWindowSize, originalWindowSize) ||
                other.originalWindowSize == originalWindowSize) &&
            (identical(other.loadingSftData, loadingSftData) ||
                other.loadingSftData == loadingSftData) &&
            (identical(other.recordingState, recordingState) ||
                other.recordingState == recordingState) &&
            const DeepCollectionEquality()
                .equals(other._chatMessages, _chatMessages) &&
            (identical(other.typingMessage, typingMessage) ||
                other.typingMessage == typingMessage) &&
            (identical(other.isWaitingForResponse, isWaitingForResponse) ||
                other.isWaitingForResponse == isWaitingForResponse) &&
            (identical(other.hoveredMessageIndex, hoveredMessageIndex) ||
                other.hoveredMessageIndex == hoveredMessageIndex) &&
            const DeepCollectionEquality()
                .equals(other._deletedRanges, _deletedRanges) &&
            const DeepCollectionEquality()
                .equals(other._originalSftData, _originalSftData) &&
            (identical(other.app, app) || other.app == app) &&
            (identical(other.scrollToBottomNonce, scrollToBottomNonce) ||
                other.scrollToBottomNonce == scrollToBottomNonce) &&
            (identical(other.toneAudio, toneAudio) ||
                other.toneAudio == toneAudio) &&
            (identical(other.blipAudio, blipAudio) ||
                other.blipAudio == blipAudio));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        prompt,
        poolId,
        currentDemonstration,
        activeDemonstration,
        recordingLoading,
        recordingProcessing,
        showUploadConfirmModal,
        currentRecordingId,
        isUploading,
        originalWindowSize,
        loadingSftData,
        recordingState,
        const DeepCollectionEquality().hash(_chatMessages),
        typingMessage,
        isWaitingForResponse,
        hoveredMessageIndex,
        const DeepCollectionEquality().hash(_deletedRanges),
        const DeepCollectionEquality().hash(_originalSftData),
        app,
        scrollToBottomNonce,
        toneAudio,
        blipAudio
      ]);

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
      {final String? prompt,
      final String? poolId,
      final Demonstration? currentDemonstration,
      final Demonstration? activeDemonstration,
      final bool recordingLoading,
      final bool recordingProcessing,
      final bool showUploadConfirmModal,
      final String? currentRecordingId,
      final bool isUploading,
      final Size? originalWindowSize,
      final bool loadingSftData,
      final RecordingState recordingState,
      final List<Message> chatMessages,
      final TypingMessage? typingMessage,
      final bool isWaitingForResponse,
      final int? hoveredMessageIndex,
      final List<DeletedRange> deletedRanges,
      final List<SftMessage>? originalSftData,
      final AppInfo? app,
      final int scrollToBottomNonce,
      final AudioPlayer? toneAudio,
      final AudioPlayer? blipAudio}) = _$TrainingSessionStateImpl;
  const _TrainingSessionState._() : super._();

  @override
  String? get prompt;
  @override
  String? get poolId;
  @override
  Demonstration? get currentDemonstration;
  @override
  Demonstration? get activeDemonstration;
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
  Size? get originalWindowSize;
  @override
  bool get loadingSftData;
  @override
  RecordingState get recordingState;
  @override
  List<Message> get chatMessages;
  @override
  TypingMessage? get typingMessage;
  @override
  bool get isWaitingForResponse;
  @override
  int? get hoveredMessageIndex;
  @override
  List<DeletedRange> get deletedRanges;
  @override
  List<SftMessage>? get originalSftData;
  @override
  AppInfo? get app;
  @override
  int get scrollToBottomNonce;
  @override
  AudioPlayer? get toneAudio;
  @override
  AudioPlayer? get blipAudio;

  /// Create a copy of TrainingSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainingSessionStateImplCopyWith<_$TrainingSessionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
