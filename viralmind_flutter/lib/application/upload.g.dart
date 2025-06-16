// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$uploadRepositoryHash() => r'aed54e0a082d1812dc8119ad12434fe73478cbed';

/// See also [uploadRepository].
@ProviderFor(uploadRepository)
final uploadRepositoryProvider =
    AutoDisposeProvider<UploadRepositoryImpl>.internal(
  uploadRepository,
  name: r'uploadRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$uploadRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UploadRepositoryRef = AutoDisposeProviderRef<UploadRepositoryImpl>;
String _$isUploadDataAllowedHash() =>
    r'12b84f4826d16f5f5a355ecaa8510db6d679b160';

/// See also [isUploadDataAllowed].
@ProviderFor(isUploadDataAllowed)
final isUploadDataAllowedProvider = AutoDisposeFutureProvider<bool>.internal(
  isUploadDataAllowed,
  name: r'isUploadDataAllowedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isUploadDataAllowedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsUploadDataAllowedRef = AutoDisposeFutureProviderRef<bool>;
String _$getRecordingZipHash() => r'60cb841a0197734c3177fa349b71d3533a7d5b1a';

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

/// See also [getRecordingZip].
@ProviderFor(getRecordingZip)
const getRecordingZipProvider = GetRecordingZipFamily();

/// See also [getRecordingZip].
class GetRecordingZipFamily extends Family<AsyncValue<Uint8List>> {
  /// See also [getRecordingZip].
  const GetRecordingZipFamily();

  /// See also [getRecordingZip].
  GetRecordingZipProvider call(
    String recordingId,
  ) {
    return GetRecordingZipProvider(
      recordingId,
    );
  }

  @override
  GetRecordingZipProvider getProviderOverride(
    covariant GetRecordingZipProvider provider,
  ) {
    return call(
      provider.recordingId,
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
  String? get name => r'getRecordingZipProvider';
}

/// See also [getRecordingZip].
class GetRecordingZipProvider extends AutoDisposeFutureProvider<Uint8List> {
  /// See also [getRecordingZip].
  GetRecordingZipProvider(
    String recordingId,
  ) : this._internal(
          (ref) => getRecordingZip(
            ref as GetRecordingZipRef,
            recordingId,
          ),
          from: getRecordingZipProvider,
          name: r'getRecordingZipProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getRecordingZipHash,
          dependencies: GetRecordingZipFamily._dependencies,
          allTransitiveDependencies:
              GetRecordingZipFamily._allTransitiveDependencies,
          recordingId: recordingId,
        );

  GetRecordingZipProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recordingId,
  }) : super.internal();

  final String recordingId;

  @override
  Override overrideWith(
    FutureOr<Uint8List> Function(GetRecordingZipRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetRecordingZipProvider._internal(
        (ref) => create(ref as GetRecordingZipRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recordingId: recordingId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Uint8List> createElement() {
    return _GetRecordingZipProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetRecordingZipProvider && other.recordingId == recordingId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recordingId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetRecordingZipRef on AutoDisposeFutureProviderRef<Uint8List> {
  /// The parameter `recordingId` of this provider.
  String get recordingId;
}

class _GetRecordingZipProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List>
    with GetRecordingZipRef {
  _GetRecordingZipProviderElement(super.provider);

  @override
  String get recordingId => (origin as GetRecordingZipProvider).recordingId;
}

String _$initUploadHash() => r'4f02d27050d56b6440c43d63874400ad5fd0a1fc';

/// See also [initUpload].
@ProviderFor(initUpload)
const initUploadProvider = InitUploadFamily();

/// See also [initUpload].
class InitUploadFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [initUpload].
  const InitUploadFamily();

  /// See also [initUpload].
  InitUploadProvider call(
    UploadMetadata metadata,
    int totalChunks,
  ) {
    return InitUploadProvider(
      metadata,
      totalChunks,
    );
  }

  @override
  InitUploadProvider getProviderOverride(
    covariant InitUploadProvider provider,
  ) {
    return call(
      provider.metadata,
      provider.totalChunks,
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
  String? get name => r'initUploadProvider';
}

/// See also [initUpload].
class InitUploadProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [initUpload].
  InitUploadProvider(
    UploadMetadata metadata,
    int totalChunks,
  ) : this._internal(
          (ref) => initUpload(
            ref as InitUploadRef,
            metadata,
            totalChunks,
          ),
          from: initUploadProvider,
          name: r'initUploadProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$initUploadHash,
          dependencies: InitUploadFamily._dependencies,
          allTransitiveDependencies:
              InitUploadFamily._allTransitiveDependencies,
          metadata: metadata,
          totalChunks: totalChunks,
        );

  InitUploadProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.metadata,
    required this.totalChunks,
  }) : super.internal();

  final UploadMetadata metadata;
  final int totalChunks;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(InitUploadRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InitUploadProvider._internal(
        (ref) => create(ref as InitUploadRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        metadata: metadata,
        totalChunks: totalChunks,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _InitUploadProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InitUploadProvider &&
        other.metadata == metadata &&
        other.totalChunks == totalChunks;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, metadata.hashCode);
    hash = _SystemHash.combine(hash, totalChunks.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InitUploadRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `metadata` of this provider.
  UploadMetadata get metadata;

  /// The parameter `totalChunks` of this provider.
  int get totalChunks;
}

class _InitUploadProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with InitUploadRef {
  _InitUploadProviderElement(super.provider);

  @override
  UploadMetadata get metadata => (origin as InitUploadProvider).metadata;
  @override
  int get totalChunks => (origin as InitUploadProvider).totalChunks;
}

String _$uploadChunkHash() => r'cacec7d204d69fe56c084de589b99d19ca407b64';

/// See also [uploadChunk].
@ProviderFor(uploadChunk)
const uploadChunkProvider = UploadChunkFamily();

/// See also [uploadChunk].
class UploadChunkFamily extends Family<AsyncValue<UploadProgress>> {
  /// See also [uploadChunk].
  const UploadChunkFamily();

  /// See also [uploadChunk].
  UploadChunkProvider call({
    required String uploadId,
    required Uint8List chunk,
    required int chunkIndex,
  }) {
    return UploadChunkProvider(
      uploadId: uploadId,
      chunk: chunk,
      chunkIndex: chunkIndex,
    );
  }

  @override
  UploadChunkProvider getProviderOverride(
    covariant UploadChunkProvider provider,
  ) {
    return call(
      uploadId: provider.uploadId,
      chunk: provider.chunk,
      chunkIndex: provider.chunkIndex,
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
  String? get name => r'uploadChunkProvider';
}

/// See also [uploadChunk].
class UploadChunkProvider extends AutoDisposeFutureProvider<UploadProgress> {
  /// See also [uploadChunk].
  UploadChunkProvider({
    required String uploadId,
    required Uint8List chunk,
    required int chunkIndex,
  }) : this._internal(
          (ref) => uploadChunk(
            ref as UploadChunkRef,
            uploadId: uploadId,
            chunk: chunk,
            chunkIndex: chunkIndex,
          ),
          from: uploadChunkProvider,
          name: r'uploadChunkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadChunkHash,
          dependencies: UploadChunkFamily._dependencies,
          allTransitiveDependencies:
              UploadChunkFamily._allTransitiveDependencies,
          uploadId: uploadId,
          chunk: chunk,
          chunkIndex: chunkIndex,
        );

  UploadChunkProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uploadId,
    required this.chunk,
    required this.chunkIndex,
  }) : super.internal();

  final String uploadId;
  final Uint8List chunk;
  final int chunkIndex;

  @override
  Override overrideWith(
    FutureOr<UploadProgress> Function(UploadChunkRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadChunkProvider._internal(
        (ref) => create(ref as UploadChunkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uploadId: uploadId,
        chunk: chunk,
        chunkIndex: chunkIndex,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UploadProgress> createElement() {
    return _UploadChunkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadChunkProvider &&
        other.uploadId == uploadId &&
        other.chunk == chunk &&
        other.chunkIndex == chunkIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uploadId.hashCode);
    hash = _SystemHash.combine(hash, chunk.hashCode);
    hash = _SystemHash.combine(hash, chunkIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UploadChunkRef on AutoDisposeFutureProviderRef<UploadProgress> {
  /// The parameter `uploadId` of this provider.
  String get uploadId;

  /// The parameter `chunk` of this provider.
  Uint8List get chunk;

  /// The parameter `chunkIndex` of this provider.
  int get chunkIndex;
}

class _UploadChunkProviderElement
    extends AutoDisposeFutureProviderElement<UploadProgress>
    with UploadChunkRef {
  _UploadChunkProviderElement(super.provider);

  @override
  String get uploadId => (origin as UploadChunkProvider).uploadId;
  @override
  Uint8List get chunk => (origin as UploadChunkProvider).chunk;
  @override
  int get chunkIndex => (origin as UploadChunkProvider).chunkIndex;
}

String _$getUploadStatusHash() => r'91a3a3986ab7ffc9ca4ef7f36e72e89b05aa2ef1';

/// See also [getUploadStatus].
@ProviderFor(getUploadStatus)
const getUploadStatusProvider = GetUploadStatusFamily();

/// See also [getUploadStatus].
class GetUploadStatusFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [getUploadStatus].
  const GetUploadStatusFamily();

  /// See also [getUploadStatus].
  GetUploadStatusProvider call(
    String uploadId,
  ) {
    return GetUploadStatusProvider(
      uploadId,
    );
  }

  @override
  GetUploadStatusProvider getProviderOverride(
    covariant GetUploadStatusProvider provider,
  ) {
    return call(
      provider.uploadId,
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
  String? get name => r'getUploadStatusProvider';
}

/// See also [getUploadStatus].
class GetUploadStatusProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [getUploadStatus].
  GetUploadStatusProvider(
    String uploadId,
  ) : this._internal(
          (ref) => getUploadStatus(
            ref as GetUploadStatusRef,
            uploadId,
          ),
          from: getUploadStatusProvider,
          name: r'getUploadStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUploadStatusHash,
          dependencies: GetUploadStatusFamily._dependencies,
          allTransitiveDependencies:
              GetUploadStatusFamily._allTransitiveDependencies,
          uploadId: uploadId,
        );

  GetUploadStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uploadId,
  }) : super.internal();

  final String uploadId;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(GetUploadStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUploadStatusProvider._internal(
        (ref) => create(ref as GetUploadStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uploadId: uploadId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _GetUploadStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUploadStatusProvider && other.uploadId == uploadId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uploadId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetUploadStatusRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `uploadId` of this provider.
  String get uploadId;
}

class _GetUploadStatusProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with GetUploadStatusRef {
  _GetUploadStatusProviderElement(super.provider);

  @override
  String get uploadId => (origin as GetUploadStatusProvider).uploadId;
}

String _$completeUploadHash() => r'e93968675dad23d0d14cda48923811033bfc9cb6';

/// See also [completeUpload].
@ProviderFor(completeUpload)
const completeUploadProvider = CompleteUploadFamily();

/// See also [completeUpload].
class CompleteUploadFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [completeUpload].
  const CompleteUploadFamily();

  /// See also [completeUpload].
  CompleteUploadProvider call(
    String uploadId,
  ) {
    return CompleteUploadProvider(
      uploadId,
    );
  }

  @override
  CompleteUploadProvider getProviderOverride(
    covariant CompleteUploadProvider provider,
  ) {
    return call(
      provider.uploadId,
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
  String? get name => r'completeUploadProvider';
}

/// See also [completeUpload].
class CompleteUploadProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [completeUpload].
  CompleteUploadProvider(
    String uploadId,
  ) : this._internal(
          (ref) => completeUpload(
            ref as CompleteUploadRef,
            uploadId,
          ),
          from: completeUploadProvider,
          name: r'completeUploadProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$completeUploadHash,
          dependencies: CompleteUploadFamily._dependencies,
          allTransitiveDependencies:
              CompleteUploadFamily._allTransitiveDependencies,
          uploadId: uploadId,
        );

  CompleteUploadProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uploadId,
  }) : super.internal();

  final String uploadId;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(CompleteUploadRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CompleteUploadProvider._internal(
        (ref) => create(ref as CompleteUploadRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uploadId: uploadId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _CompleteUploadProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CompleteUploadProvider && other.uploadId == uploadId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uploadId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CompleteUploadRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `uploadId` of this provider.
  String get uploadId;
}

class _CompleteUploadProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with CompleteUploadRef {
  _CompleteUploadProviderElement(super.provider);

  @override
  String get uploadId => (origin as CompleteUploadProvider).uploadId;
}

String _$cancelUploadHash() => r'25e6af09a3621a0aad2c14d96a79834e965b2a09';

/// See also [cancelUpload].
@ProviderFor(cancelUpload)
const cancelUploadProvider = CancelUploadFamily();

/// See also [cancelUpload].
class CancelUploadFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [cancelUpload].
  const CancelUploadFamily();

  /// See also [cancelUpload].
  CancelUploadProvider call(
    String uploadId,
  ) {
    return CancelUploadProvider(
      uploadId,
    );
  }

  @override
  CancelUploadProvider getProviderOverride(
    covariant CancelUploadProvider provider,
  ) {
    return call(
      provider.uploadId,
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
  String? get name => r'cancelUploadProvider';
}

/// See also [cancelUpload].
class CancelUploadProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [cancelUpload].
  CancelUploadProvider(
    String uploadId,
  ) : this._internal(
          (ref) => cancelUpload(
            ref as CancelUploadRef,
            uploadId,
          ),
          from: cancelUploadProvider,
          name: r'cancelUploadProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cancelUploadHash,
          dependencies: CancelUploadFamily._dependencies,
          allTransitiveDependencies:
              CancelUploadFamily._allTransitiveDependencies,
          uploadId: uploadId,
        );

  CancelUploadProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uploadId,
  }) : super.internal();

  final String uploadId;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(CancelUploadRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CancelUploadProvider._internal(
        (ref) => create(ref as CancelUploadRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uploadId: uploadId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _CancelUploadProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CancelUploadProvider && other.uploadId == uploadId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uploadId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CancelUploadRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `uploadId` of this provider.
  String get uploadId;
}

class _CancelUploadProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with CancelUploadRef {
  _CancelUploadProviderElement(super.provider);

  @override
  String get uploadId => (origin as CancelUploadProvider).uploadId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
