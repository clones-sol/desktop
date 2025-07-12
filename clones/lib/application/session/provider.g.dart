// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkWalletConnectionHash() =>
    r'429a4ffbf3f60cc4da867a1672c0d44c0f172216';

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

/// See also [checkWalletConnection].
@ProviderFor(checkWalletConnection)
const checkWalletConnectionProvider = CheckWalletConnectionFamily();

/// See also [checkWalletConnection].
class CheckWalletConnectionFamily
    extends Family<AsyncValue<({bool connected, String? address})>> {
  /// See also [checkWalletConnection].
  const CheckWalletConnectionFamily();

  /// See also [checkWalletConnection].
  CheckWalletConnectionProvider call(
    String token,
  ) {
    return CheckWalletConnectionProvider(
      token,
    );
  }

  @override
  CheckWalletConnectionProvider getProviderOverride(
    covariant CheckWalletConnectionProvider provider,
  ) {
    return call(
      provider.token,
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
  String? get name => r'checkWalletConnectionProvider';
}

/// See also [checkWalletConnection].
class CheckWalletConnectionProvider
    extends AutoDisposeFutureProvider<({bool connected, String? address})> {
  /// See also [checkWalletConnection].
  CheckWalletConnectionProvider(
    String token,
  ) : this._internal(
          (ref) => checkWalletConnection(
            ref as CheckWalletConnectionRef,
            token,
          ),
          from: checkWalletConnectionProvider,
          name: r'checkWalletConnectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkWalletConnectionHash,
          dependencies: CheckWalletConnectionFamily._dependencies,
          allTransitiveDependencies:
              CheckWalletConnectionFamily._allTransitiveDependencies,
          token: token,
        );

  CheckWalletConnectionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
  }) : super.internal();

  final String token;

  @override
  Override overrideWith(
    FutureOr<({bool connected, String? address})> Function(
            CheckWalletConnectionRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CheckWalletConnectionProvider._internal(
        (ref) => create(ref as CheckWalletConnectionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<({bool connected, String? address})>
      createElement() {
    return _CheckWalletConnectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckWalletConnectionProvider && other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CheckWalletConnectionRef
    on AutoDisposeFutureProviderRef<({bool connected, String? address})> {
  /// The parameter `token` of this provider.
  String get token;
}

class _CheckWalletConnectionProviderElement
    extends AutoDisposeFutureProviderElement<
        ({bool connected, String? address})> with CheckWalletConnectionRef {
  _CheckWalletConnectionProviderElement(super.provider);

  @override
  String get token => (origin as CheckWalletConnectionProvider).token;
}

String _$walletRepositoryHash() => r'1a8ff16f4150be00fefd59b17e15e38ec937b09b';

/// See also [walletRepository].
@ProviderFor(walletRepository)
final walletRepositoryProvider =
    AutoDisposeProvider<WalletRepositoryImpl>.internal(
  walletRepository,
  name: r'walletRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$walletRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WalletRepositoryRef = AutoDisposeProviderRef<WalletRepositoryImpl>;
String _$sessionNotifierHash() => r'f14c8dc9377a47cde2f723f888085f09f39b30f1';

/// See also [SessionNotifier].
@ProviderFor(SessionNotifier)
final sessionNotifierProvider =
    AutoDisposeNotifierProvider<SessionNotifier, Session>.internal(
  SessionNotifier.new,
  name: r'sessionNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sessionNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SessionNotifier = AutoDisposeNotifier<Session>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
