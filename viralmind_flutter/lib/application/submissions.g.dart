// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submissions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$submissionsRepositoryHash() =>
    r'63e139706c455b9e25126b5f0547025cb549e4c6';

/// See also [submissionsRepository].
@ProviderFor(submissionsRepository)
final submissionsRepositoryProvider =
    AutoDisposeProvider<SubmissionsRepositoryImpl>.internal(
  submissionsRepository,
  name: r'submissionsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$submissionsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SubmissionsRepositoryRef
    = AutoDisposeProviderRef<SubmissionsRepositoryImpl>;
String _$getSubmissionStatusHash() =>
    r'733b52713d3ffcfe7351237f9a0f0a438ad73665';

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

/// See also [getSubmissionStatus].
@ProviderFor(getSubmissionStatus)
const getSubmissionStatusProvider = GetSubmissionStatusFamily();

/// See also [getSubmissionStatus].
class GetSubmissionStatusFamily extends Family<AsyncValue<SubmissionStatus>> {
  /// See also [getSubmissionStatus].
  const GetSubmissionStatusFamily();

  /// See also [getSubmissionStatus].
  GetSubmissionStatusProvider call({
    required String submissionId,
  }) {
    return GetSubmissionStatusProvider(
      submissionId: submissionId,
    );
  }

  @override
  GetSubmissionStatusProvider getProviderOverride(
    covariant GetSubmissionStatusProvider provider,
  ) {
    return call(
      submissionId: provider.submissionId,
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
  String? get name => r'getSubmissionStatusProvider';
}

/// See also [getSubmissionStatus].
class GetSubmissionStatusProvider
    extends AutoDisposeFutureProvider<SubmissionStatus> {
  /// See also [getSubmissionStatus].
  GetSubmissionStatusProvider({
    required String submissionId,
  }) : this._internal(
          (ref) => getSubmissionStatus(
            ref as GetSubmissionStatusRef,
            submissionId: submissionId,
          ),
          from: getSubmissionStatusProvider,
          name: r'getSubmissionStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSubmissionStatusHash,
          dependencies: GetSubmissionStatusFamily._dependencies,
          allTransitiveDependencies:
              GetSubmissionStatusFamily._allTransitiveDependencies,
          submissionId: submissionId,
        );

  GetSubmissionStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.submissionId,
  }) : super.internal();

  final String submissionId;

  @override
  Override overrideWith(
    FutureOr<SubmissionStatus> Function(GetSubmissionStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSubmissionStatusProvider._internal(
        (ref) => create(ref as GetSubmissionStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        submissionId: submissionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SubmissionStatus> createElement() {
    return _GetSubmissionStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSubmissionStatusProvider &&
        other.submissionId == submissionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, submissionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetSubmissionStatusRef on AutoDisposeFutureProviderRef<SubmissionStatus> {
  /// The parameter `submissionId` of this provider.
  String get submissionId;
}

class _GetSubmissionStatusProviderElement
    extends AutoDisposeFutureProviderElement<SubmissionStatus>
    with GetSubmissionStatusRef {
  _GetSubmissionStatusProviderElement(super.provider);

  @override
  String get submissionId =>
      (origin as GetSubmissionStatusProvider).submissionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
