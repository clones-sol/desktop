// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blacklist.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$blacklistRepositoryHash() =>
    r'becfd817951e41660bca7002e8e335ca9869da8a';

/// See also [blacklistRepository].
@ProviderFor(blacklistRepository)
final blacklistRepositoryProvider =
    AutoDisposeProvider<BlacklistRepositoryImpl>.internal(
  blacklistRepository,
  name: r'blacklistRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$blacklistRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BlacklistRepositoryRef
    = AutoDisposeProviderRef<BlacklistRepositoryImpl>;
String _$getBlacklistHash() => r'f1c3c23939d4c8cbeb8bf0050fc8d324e8cdb18a';

/// See also [getBlacklist].
@ProviderFor(getBlacklist)
final getBlacklistProvider = AutoDisposeFutureProvider<List<String>>.internal(
  getBlacklist,
  name: r'getBlacklistProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getBlacklistHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetBlacklistRef = AutoDisposeFutureProviderRef<List<String>>;
String _$addAppHash() => r'71cb7cf522d1aee90bde1d6831ac4e996586792e';

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

/// See also [addApp].
@ProviderFor(addApp)
const addAppProvider = AddAppFamily();

/// See also [addApp].
class AddAppFamily extends Family<AsyncValue<void>> {
  /// See also [addApp].
  const AddAppFamily();

  /// See also [addApp].
  AddAppProvider call(
    String appName,
  ) {
    return AddAppProvider(
      appName,
    );
  }

  @override
  AddAppProvider getProviderOverride(
    covariant AddAppProvider provider,
  ) {
    return call(
      provider.appName,
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
  String? get name => r'addAppProvider';
}

/// See also [addApp].
class AddAppProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addApp].
  AddAppProvider(
    String appName,
  ) : this._internal(
          (ref) => addApp(
            ref as AddAppRef,
            appName,
          ),
          from: addAppProvider,
          name: r'addAppProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addAppHash,
          dependencies: AddAppFamily._dependencies,
          allTransitiveDependencies: AddAppFamily._allTransitiveDependencies,
          appName: appName,
        );

  AddAppProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appName,
  }) : super.internal();

  final String appName;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddAppRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddAppProvider._internal(
        (ref) => create(ref as AddAppRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appName: appName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddAppProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddAppProvider && other.appName == appName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddAppRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `appName` of this provider.
  String get appName;
}

class _AddAppProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddAppRef {
  _AddAppProviderElement(super.provider);

  @override
  String get appName => (origin as AddAppProvider).appName;
}

String _$removeAppHash() => r'4645052fd30dcc09d9c79d7e0ed775f6cecb9fb9';

/// See also [removeApp].
@ProviderFor(removeApp)
const removeAppProvider = RemoveAppFamily();

/// See also [removeApp].
class RemoveAppFamily extends Family<AsyncValue<void>> {
  /// See also [removeApp].
  const RemoveAppFamily();

  /// See also [removeApp].
  RemoveAppProvider call(
    String appName,
  ) {
    return RemoveAppProvider(
      appName,
    );
  }

  @override
  RemoveAppProvider getProviderOverride(
    covariant RemoveAppProvider provider,
  ) {
    return call(
      provider.appName,
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
  String? get name => r'removeAppProvider';
}

/// See also [removeApp].
class RemoveAppProvider extends AutoDisposeFutureProvider<void> {
  /// See also [removeApp].
  RemoveAppProvider(
    String appName,
  ) : this._internal(
          (ref) => removeApp(
            ref as RemoveAppRef,
            appName,
          ),
          from: removeAppProvider,
          name: r'removeAppProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeAppHash,
          dependencies: RemoveAppFamily._dependencies,
          allTransitiveDependencies: RemoveAppFamily._allTransitiveDependencies,
          appName: appName,
        );

  RemoveAppProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appName,
  }) : super.internal();

  final String appName;

  @override
  Override overrideWith(
    FutureOr<void> Function(RemoveAppRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemoveAppProvider._internal(
        (ref) => create(ref as RemoveAppRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appName: appName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RemoveAppProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveAppProvider && other.appName == appName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RemoveAppRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `appName` of this provider.
  String get appName;
}

class _RemoveAppProviderElement extends AutoDisposeFutureProviderElement<void>
    with RemoveAppRef {
  _RemoveAppProviderElement(super.provider);

  @override
  String get appName => (origin as RemoveAppProvider).appName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
