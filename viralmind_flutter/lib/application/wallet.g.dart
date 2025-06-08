// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$walletRepositoryHash() => r'60fdeaec48d0d2ca0190f0a9a5c22f5f90be8148';

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
String _$walletAddressHash() => r'3453ecc4289656e69cf09bb0b597794360e0c4d4';

/// See also [walletAddress].
@ProviderFor(walletAddress)
final walletAddressProvider = AutoDisposeFutureProvider<String?>.internal(
  walletAddress,
  name: r'walletAddressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$walletAddressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WalletAddressRef = AutoDisposeFutureProviderRef<String?>;
String _$getBalanceHash() => r'f464a2b086d736ea280ce9840168ebe21be1e471';

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

/// See also [getBalance].
@ProviderFor(getBalance)
const getBalanceProvider = GetBalanceFamily();

/// See also [getBalance].
class GetBalanceFamily extends Family<AsyncValue<double>> {
  /// See also [getBalance].
  const GetBalanceFamily();

  /// See also [getBalance].
  GetBalanceProvider call({
    required String address,
  }) {
    return GetBalanceProvider(
      address: address,
    );
  }

  @override
  GetBalanceProvider getProviderOverride(
    covariant GetBalanceProvider provider,
  ) {
    return call(
      address: provider.address,
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
  String? get name => r'getBalanceProvider';
}

/// See also [getBalance].
class GetBalanceProvider extends AutoDisposeFutureProvider<double> {
  /// See also [getBalance].
  GetBalanceProvider({
    required String address,
  }) : this._internal(
          (ref) => getBalance(
            ref as GetBalanceRef,
            address: address,
          ),
          from: getBalanceProvider,
          name: r'getBalanceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getBalanceHash,
          dependencies: GetBalanceFamily._dependencies,
          allTransitiveDependencies:
              GetBalanceFamily._allTransitiveDependencies,
          address: address,
        );

  GetBalanceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.address,
  }) : super.internal();

  final String address;

  @override
  Override overrideWith(
    FutureOr<double> Function(GetBalanceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetBalanceProvider._internal(
        (ref) => create(ref as GetBalanceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        address: address,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<double> createElement() {
    return _GetBalanceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetBalanceProvider && other.address == address;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetBalanceRef on AutoDisposeFutureProviderRef<double> {
  /// The parameter `address` of this provider.
  String get address;
}

class _GetBalanceProviderElement
    extends AutoDisposeFutureProviderElement<double> with GetBalanceRef {
  _GetBalanceProviderElement(super.provider);

  @override
  String get address => (origin as GetBalanceProvider).address;
}

String _$checkConnectionHash() => r'959d1c7394873e923088bc4b90e9ba6c6b401be4';

/// See also [checkConnection].
@ProviderFor(checkConnection)
const checkConnectionProvider = CheckConnectionFamily();

/// See also [checkConnection].
class CheckConnectionFamily
    extends Family<AsyncValue<({bool connected, String? address})>> {
  /// See also [checkConnection].
  const CheckConnectionFamily();

  /// See also [checkConnection].
  CheckConnectionProvider call(
    String token,
  ) {
    return CheckConnectionProvider(
      token,
    );
  }

  @override
  CheckConnectionProvider getProviderOverride(
    covariant CheckConnectionProvider provider,
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
  String? get name => r'checkConnectionProvider';
}

/// See also [checkConnection].
class CheckConnectionProvider
    extends AutoDisposeFutureProvider<({bool connected, String? address})> {
  /// See also [checkConnection].
  CheckConnectionProvider(
    String token,
  ) : this._internal(
          (ref) => checkConnection(
            ref as CheckConnectionRef,
            token,
          ),
          from: checkConnectionProvider,
          name: r'checkConnectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkConnectionHash,
          dependencies: CheckConnectionFamily._dependencies,
          allTransitiveDependencies:
              CheckConnectionFamily._allTransitiveDependencies,
          token: token,
        );

  CheckConnectionProvider._internal(
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
            CheckConnectionRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CheckConnectionProvider._internal(
        (ref) => create(ref as CheckConnectionRef),
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
    return _CheckConnectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckConnectionProvider && other.token == token;
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
mixin CheckConnectionRef
    on AutoDisposeFutureProviderRef<({bool connected, String? address})> {
  /// The parameter `token` of this provider.
  String get token;
}

class _CheckConnectionProviderElement extends AutoDisposeFutureProviderElement<
    ({bool connected, String? address})> with CheckConnectionRef {
  _CheckConnectionProviderElement(super.provider);

  @override
  String get token => (origin as CheckConnectionProvider).token;
}

String _$getNicknameHash() => r'7d0160c63a5c07f15dae7143bbd900518482756a';

/// See also [getNickname].
@ProviderFor(getNickname)
const getNicknameProvider = GetNicknameFamily();

/// See also [getNickname].
class GetNicknameFamily extends Family<AsyncValue<String?>> {
  /// See also [getNickname].
  const GetNicknameFamily();

  /// See also [getNickname].
  GetNicknameProvider call({
    required String address,
  }) {
    return GetNicknameProvider(
      address: address,
    );
  }

  @override
  GetNicknameProvider getProviderOverride(
    covariant GetNicknameProvider provider,
  ) {
    return call(
      address: provider.address,
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
  String? get name => r'getNicknameProvider';
}

/// See also [getNickname].
class GetNicknameProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [getNickname].
  GetNicknameProvider({
    required String address,
  }) : this._internal(
          (ref) => getNickname(
            ref as GetNicknameRef,
            address: address,
          ),
          from: getNicknameProvider,
          name: r'getNicknameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getNicknameHash,
          dependencies: GetNicknameFamily._dependencies,
          allTransitiveDependencies:
              GetNicknameFamily._allTransitiveDependencies,
          address: address,
        );

  GetNicknameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.address,
  }) : super.internal();

  final String address;

  @override
  Override overrideWith(
    FutureOr<String?> Function(GetNicknameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetNicknameProvider._internal(
        (ref) => create(ref as GetNicknameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        address: address,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _GetNicknameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetNicknameProvider && other.address == address;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetNicknameRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `address` of this provider.
  String get address;
}

class _GetNicknameProviderElement
    extends AutoDisposeFutureProviderElement<String?> with GetNicknameRef {
  _GetNicknameProviderElement(super.provider);

  @override
  String get address => (origin as GetNicknameProvider).address;
}

String _$saveNicknameHash() => r'5715b40f1e6013458f94824568c809f582f9cfa3';

/// See also [saveNickname].
@ProviderFor(saveNickname)
const saveNicknameProvider = SaveNicknameFamily();

/// See also [saveNickname].
class SaveNicknameFamily extends Family<AsyncValue<void>> {
  /// See also [saveNickname].
  const SaveNicknameFamily();

  /// See also [saveNickname].
  SaveNicknameProvider call({
    required String address,
    required String nickname,
  }) {
    return SaveNicknameProvider(
      address: address,
      nickname: nickname,
    );
  }

  @override
  SaveNicknameProvider getProviderOverride(
    covariant SaveNicknameProvider provider,
  ) {
    return call(
      address: provider.address,
      nickname: provider.nickname,
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
  String? get name => r'saveNicknameProvider';
}

/// See also [saveNickname].
class SaveNicknameProvider extends AutoDisposeFutureProvider<void> {
  /// See also [saveNickname].
  SaveNicknameProvider({
    required String address,
    required String nickname,
  }) : this._internal(
          (ref) => saveNickname(
            ref as SaveNicknameRef,
            address: address,
            nickname: nickname,
          ),
          from: saveNicknameProvider,
          name: r'saveNicknameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveNicknameHash,
          dependencies: SaveNicknameFamily._dependencies,
          allTransitiveDependencies:
              SaveNicknameFamily._allTransitiveDependencies,
          address: address,
          nickname: nickname,
        );

  SaveNicknameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.address,
    required this.nickname,
  }) : super.internal();

  final String address;
  final String nickname;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveNicknameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveNicknameProvider._internal(
        (ref) => create(ref as SaveNicknameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        address: address,
        nickname: nickname,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveNicknameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveNicknameProvider &&
        other.address == address &&
        other.nickname == nickname;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);
    hash = _SystemHash.combine(hash, nickname.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SaveNicknameRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `address` of this provider.
  String get address;

  /// The parameter `nickname` of this provider.
  String get nickname;
}

class _SaveNicknameProviderElement
    extends AutoDisposeFutureProviderElement<void> with SaveNicknameRef {
  _SaveNicknameProviderElement(super.provider);

  @override
  String get address => (origin as SaveNicknameProvider).address;
  @override
  String get nickname => (origin as SaveNicknameProvider).nickname;
}

String _$setNicknameHash() => r'cfe7a4a23b3d34cbb10e3935388f3cae2ad75494';

/// See also [setNickname].
@ProviderFor(setNickname)
const setNicknameProvider = SetNicknameFamily();

/// See also [setNickname].
class SetNicknameFamily extends Family<AsyncValue<String>> {
  /// See also [setNickname].
  const SetNicknameFamily();

  /// See also [setNickname].
  SetNicknameProvider call({
    required String address,
    required String nickname,
  }) {
    return SetNicknameProvider(
      address: address,
      nickname: nickname,
    );
  }

  @override
  SetNicknameProvider getProviderOverride(
    covariant SetNicknameProvider provider,
  ) {
    return call(
      address: provider.address,
      nickname: provider.nickname,
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
  String? get name => r'setNicknameProvider';
}

/// See also [setNickname].
class SetNicknameProvider extends AutoDisposeFutureProvider<String> {
  /// See also [setNickname].
  SetNicknameProvider({
    required String address,
    required String nickname,
  }) : this._internal(
          (ref) => setNickname(
            ref as SetNicknameRef,
            address: address,
            nickname: nickname,
          ),
          from: setNicknameProvider,
          name: r'setNicknameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setNicknameHash,
          dependencies: SetNicknameFamily._dependencies,
          allTransitiveDependencies:
              SetNicknameFamily._allTransitiveDependencies,
          address: address,
          nickname: nickname,
        );

  SetNicknameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.address,
    required this.nickname,
  }) : super.internal();

  final String address;
  final String nickname;

  @override
  Override overrideWith(
    FutureOr<String> Function(SetNicknameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetNicknameProvider._internal(
        (ref) => create(ref as SetNicknameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        address: address,
        nickname: nickname,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _SetNicknameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetNicknameProvider &&
        other.address == address &&
        other.nickname == nickname;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);
    hash = _SystemHash.combine(hash, nickname.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SetNicknameRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `address` of this provider.
  String get address;

  /// The parameter `nickname` of this provider.
  String get nickname;
}

class _SetNicknameProviderElement
    extends AutoDisposeFutureProviderElement<String> with SetNicknameRef {
  _SetNicknameProviderElement(super.provider);

  @override
  String get address => (origin as SetNicknameProvider).address;
  @override
  String get nickname => (origin as SetNicknameProvider).nickname;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
