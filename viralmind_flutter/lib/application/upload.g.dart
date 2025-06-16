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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
