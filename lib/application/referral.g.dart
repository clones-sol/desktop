// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$referralRepositoryHash() =>
    r'27f8f29f6bfe8a3e5835ab232311c721ad29f4d1';

/// See also [referralRepository].
@ProviderFor(referralRepository)
final referralRepositoryProvider =
    AutoDisposeProvider<ReferralRepository>.internal(
  referralRepository,
  name: r'referralRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$referralRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReferralRepositoryRef = AutoDisposeProviderRef<ReferralRepository>;
String _$getReferralInfoHash() => r'573414753b262420447697a673c72f2f82c3deaf';

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

/// See also [getReferralInfo].
@ProviderFor(getReferralInfo)
const getReferralInfoProvider = GetReferralInfoFamily();

/// See also [getReferralInfo].
class GetReferralInfoFamily extends Family<AsyncValue<ReferralInfo?>> {
  /// See also [getReferralInfo].
  const GetReferralInfoFamily();

  /// See also [getReferralInfo].
  GetReferralInfoProvider call(
    String walletAddress,
  ) {
    return GetReferralInfoProvider(
      walletAddress,
    );
  }

  @override
  GetReferralInfoProvider getProviderOverride(
    covariant GetReferralInfoProvider provider,
  ) {
    return call(
      provider.walletAddress,
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
  String? get name => r'getReferralInfoProvider';
}

/// See also [getReferralInfo].
class GetReferralInfoProvider extends AutoDisposeFutureProvider<ReferralInfo?> {
  /// See also [getReferralInfo].
  GetReferralInfoProvider(
    String walletAddress,
  ) : this._internal(
          (ref) => getReferralInfo(
            ref as GetReferralInfoRef,
            walletAddress,
          ),
          from: getReferralInfoProvider,
          name: r'getReferralInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getReferralInfoHash,
          dependencies: GetReferralInfoFamily._dependencies,
          allTransitiveDependencies:
              GetReferralInfoFamily._allTransitiveDependencies,
          walletAddress: walletAddress,
        );

  GetReferralInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.walletAddress,
  }) : super.internal();

  final String walletAddress;

  @override
  Override overrideWith(
    FutureOr<ReferralInfo?> Function(GetReferralInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetReferralInfoProvider._internal(
        (ref) => create(ref as GetReferralInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        walletAddress: walletAddress,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ReferralInfo?> createElement() {
    return _GetReferralInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetReferralInfoProvider &&
        other.walletAddress == walletAddress;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, walletAddress.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetReferralInfoRef on AutoDisposeFutureProviderRef<ReferralInfo?> {
  /// The parameter `walletAddress` of this provider.
  String get walletAddress;
}

class _GetReferralInfoProviderElement
    extends AutoDisposeFutureProviderElement<ReferralInfo?>
    with GetReferralInfoRef {
  _GetReferralInfoProviderElement(super.provider);

  @override
  String get walletAddress => (origin as GetReferralInfoProvider).walletAddress;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
