// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recordingRepositoryHash() =>
    r'6bbf7e38888e5910b2fc42833e5a00c0429b4ad6';

/// See also [recordingRepository].
@ProviderFor(recordingRepository)
final recordingRepositoryProvider =
    AutoDisposeProvider<RecordingRepositoryImpl>.internal(
  recordingRepository,
  name: r'recordingRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recordingRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecordingRepositoryRef
    = AutoDisposeProviderRef<RecordingRepositoryImpl>;
String _$startRecordingHash() => r'8d23ec30c9e91e71cb1ad63f6316ff5d0fd84bc1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [startRecording].
@ProviderFor(startRecording)
const startRecordingProvider = StartRecordingFamily();

/// See also [startRecording].
class StartRecordingFamily extends Family<AsyncValue<void>> {
  /// See also [startRecording].
  const StartRecordingFamily();

  /// See also [startRecording].
  StartRecordingProvider call({
    Quest? quest,
    int fps = 30,
  }) {
    return StartRecordingProvider(
      quest: quest,
      fps: fps,
    );
  }

  @override
  StartRecordingProvider getProviderOverride(
    covariant StartRecordingProvider provider,
  ) {
    return call(
      quest: provider.quest,
      fps: provider.fps,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'startRecordingProvider';
}

/// See also [startRecording].
class StartRecordingProvider extends AutoDisposeFutureProvider<void> {
  /// See also [startRecording].
  StartRecordingProvider({
    Quest? quest,
    int fps = 30,
  }) : this._internal(
          (ref) => startRecording(
            ref as StartRecordingRef,
            quest: quest,
            fps: fps,
          ),
          from: startRecordingProvider,
          name: r'startRecordingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$startRecordingHash,
          dependencies: StartRecordingFamily._dependencies,
          allTransitiveDependencies:
              StartRecordingFamily._allTransitiveDependencies,
          quest: quest,
          fps: fps,
        );

  StartRecordingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quest,
    required this.fps,
  }) : super.internal();

  final Quest? quest;
  final int fps;

  @override
  Override overrideWith(
    FutureOr<void> Function(StartRecordingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StartRecordingProvider._internal(
        (ref) => create(ref as StartRecordingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quest: quest,
        fps: fps,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _StartRecordingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StartRecordingProvider &&
        other.quest == quest &&
        other.fps == fps;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quest.hashCode);
    hash = _SystemHash.combine(hash, fps.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StartRecordingRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `quest` of this provider.
  Quest? get quest;

  /// The parameter `fps` of this provider.
  int get fps;
}

class _StartRecordingProviderElement
    extends AutoDisposeFutureProviderElement<void> with StartRecordingRef {
  _StartRecordingProviderElement(super.provider);

  @override
  Quest? get quest => (origin as StartRecordingProvider).quest;
  @override
  int get fps => (origin as StartRecordingProvider).fps;
}

String _$stopRecordingHash() => r'a1fd31d92b6301d39ab11206454daf74173b2bb7';

/// See also [stopRecording].
@ProviderFor(stopRecording)
const stopRecordingProvider = StopRecordingFamily();

/// See also [stopRecording].
class StopRecordingFamily extends Family<AsyncValue<String>> {
  /// See also [stopRecording].
  const StopRecordingFamily();

  /// See also [stopRecording].
  StopRecordingProvider call({
    String? reason,
  }) {
    return StopRecordingProvider(
      reason: reason,
    );
  }

  @override
  StopRecordingProvider getProviderOverride(
    covariant StopRecordingProvider provider,
  ) {
    return call(
      reason: provider.reason,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'stopRecordingProvider';
}

/// See also [stopRecording].
class StopRecordingProvider extends AutoDisposeFutureProvider<String> {
  /// See also [stopRecording].
  StopRecordingProvider({
    String? reason,
  }) : this._internal(
          (ref) => stopRecording(
            ref as StopRecordingRef,
            reason: reason,
          ),
          from: stopRecordingProvider,
          name: r'stopRecordingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stopRecordingHash,
          dependencies: StopRecordingFamily._dependencies,
          allTransitiveDependencies:
              StopRecordingFamily._allTransitiveDependencies,
          reason: reason,
        );

  StopRecordingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.reason,
  }) : super.internal();

  final String? reason;

  @override
  Override overrideWith(
    FutureOr<String> Function(StopRecordingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StopRecordingProvider._internal(
        (ref) => create(ref as StopRecordingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        reason: reason,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _StopRecordingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StopRecordingProvider && other.reason == reason;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, reason.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StopRecordingRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `reason` of this provider.
  String? get reason;
}

class _StopRecordingProviderElement
    extends AutoDisposeFutureProviderElement<String> with StopRecordingRef {
  _StopRecordingProviderElement(super.provider);

  @override
  String? get reason => (origin as StopRecordingProvider).reason;
}

String _$writeRecordingFileHash() =>
    r'cbb7f3f9671485df7779455c6f51df4a30cc2f9a';

/// See also [writeRecordingFile].
@ProviderFor(writeRecordingFile)
const writeRecordingFileProvider = WriteRecordingFileFamily();

/// See also [writeRecordingFile].
class WriteRecordingFileFamily extends Family<AsyncValue<void>> {
  /// See also [writeRecordingFile].
  const WriteRecordingFileFamily();

  /// See also [writeRecordingFile].
  WriteRecordingFileProvider call({
    required String recordingId,
    required String filename,
    required String content,
  }) {
    return WriteRecordingFileProvider(
      recordingId: recordingId,
      filename: filename,
      content: content,
    );
  }

  @override
  WriteRecordingFileProvider getProviderOverride(
    covariant WriteRecordingFileProvider provider,
  ) {
    return call(
      recordingId: provider.recordingId,
      filename: provider.filename,
      content: provider.content,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'writeRecordingFileProvider';
}

/// See also [writeRecordingFile].
class WriteRecordingFileProvider extends AutoDisposeFutureProvider<void> {
  /// See also [writeRecordingFile].
  WriteRecordingFileProvider({
    required String recordingId,
    required String filename,
    required String content,
  }) : this._internal(
          (ref) => writeRecordingFile(
            ref as WriteRecordingFileRef,
            recordingId: recordingId,
            filename: filename,
            content: content,
          ),
          from: writeRecordingFileProvider,
          name: r'writeRecordingFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$writeRecordingFileHash,
          dependencies: WriteRecordingFileFamily._dependencies,
          allTransitiveDependencies:
              WriteRecordingFileFamily._allTransitiveDependencies,
          recordingId: recordingId,
          filename: filename,
          content: content,
        );

  WriteRecordingFileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recordingId,
    required this.filename,
    required this.content,
  }) : super.internal();

  final String recordingId;
  final String filename;
  final String content;

  @override
  Override overrideWith(
    FutureOr<void> Function(WriteRecordingFileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WriteRecordingFileProvider._internal(
        (ref) => create(ref as WriteRecordingFileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recordingId: recordingId,
        filename: filename,
        content: content,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _WriteRecordingFileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WriteRecordingFileProvider &&
        other.recordingId == recordingId &&
        other.filename == filename &&
        other.content == content;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recordingId.hashCode);
    hash = _SystemHash.combine(hash, filename.hashCode);
    hash = _SystemHash.combine(hash, content.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WriteRecordingFileRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `recordingId` of this provider.
  String get recordingId;

  /// The parameter `filename` of this provider.
  String get filename;

  /// The parameter `content` of this provider.
  String get content;
}

class _WriteRecordingFileProviderElement
    extends AutoDisposeFutureProviderElement<void> with WriteRecordingFileRef {
  _WriteRecordingFileProviderElement(super.provider);

  @override
  String get recordingId => (origin as WriteRecordingFileProvider).recordingId;
  @override
  String get filename => (origin as WriteRecordingFileProvider).filename;
  @override
  String get content => (origin as WriteRecordingFileProvider).content;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
