// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apps.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appsRepositoryHash() => r'00f96fe79c6deb88024ad39b8ea601003dcb8951';

/// See also [appsRepository].
@ProviderFor(appsRepository)
final appsRepositoryProvider = AutoDisposeProvider<AppsRepositoryImpl>.internal(
  appsRepository,
  name: r'appsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppsRepositoryRef = AutoDisposeProviderRef<AppsRepositoryImpl>;
String _$generateAppsHash() => r'4f27724cb95ada91bb4a22b01d7d05dd712343aa';

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

/// See also [generateApps].
@ProviderFor(generateApps)
const generateAppsProvider = GenerateAppsFamily();

/// See also [generateApps].
class GenerateAppsFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [generateApps].
  const GenerateAppsFamily();

  /// See also [generateApps].
  GenerateAppsProvider call({
    required String prompt,
  }) {
    return GenerateAppsProvider(
      prompt: prompt,
    );
  }

  @override
  GenerateAppsProvider getProviderOverride(
    covariant GenerateAppsProvider provider,
  ) {
    return call(
      prompt: provider.prompt,
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
  String? get name => r'generateAppsProvider';
}

/// See also [generateApps].
class GenerateAppsProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [generateApps].
  GenerateAppsProvider({
    required String prompt,
  }) : this._internal(
          (ref) => generateApps(
            ref as GenerateAppsRef,
            prompt: prompt,
          ),
          from: generateAppsProvider,
          name: r'generateAppsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$generateAppsHash,
          dependencies: GenerateAppsFamily._dependencies,
          allTransitiveDependencies:
              GenerateAppsFamily._allTransitiveDependencies,
          prompt: prompt,
        );

  GenerateAppsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.prompt,
  }) : super.internal();

  final String prompt;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(GenerateAppsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GenerateAppsProvider._internal(
        (ref) => create(ref as GenerateAppsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        prompt: prompt,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _GenerateAppsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GenerateAppsProvider && other.prompt == prompt;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, prompt.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GenerateAppsRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `prompt` of this provider.
  String get prompt;
}

class _GenerateAppsProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with GenerateAppsRef {
  _GenerateAppsProviderElement(super.provider);

  @override
  String get prompt => (origin as GenerateAppsProvider).prompt;
}

String _$getAppsForHistoryHash() => r'8f7969bcd4f6bdf81b952f4535fbaaf9936fa04d';

/// See also [getAppsForHistory].
@ProviderFor(getAppsForHistory)
final getAppsForHistoryProvider =
    AutoDisposeFutureProvider<List<ForgeApp>>.internal(
  getAppsForHistory,
  name: r'getAppsForHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAppsForHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAppsForHistoryRef = AutoDisposeFutureProviderRef<List<ForgeApp>>;
String _$getAppsForSkillsHash() => r'5b39dc02d34fb7654baefece62043a055965516d';

/// See also [getAppsForSkills].
@ProviderFor(getAppsForSkills)
final getAppsForSkillsProvider =
    AutoDisposeFutureProvider<List<ForgeApp>>.internal(
  getAppsForSkills,
  name: r'getAppsForSkillsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAppsForSkillsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAppsForSkillsRef = AutoDisposeFutureProviderRef<List<ForgeApp>>;
String _$getAppsForFactoryHash() => r'85fcf5a28f059a446cbbb7c87b7515c78e63ef3b';

/// See also [getAppsForFactory].
@ProviderFor(getAppsForFactory)
const getAppsForFactoryProvider = GetAppsForFactoryFamily();

/// See also [getAppsForFactory].
class GetAppsForFactoryFamily extends Family<AsyncValue<List<ForgeApp>>> {
  /// See also [getAppsForFactory].
  const GetAppsForFactoryFamily();

  /// See also [getAppsForFactory].
  GetAppsForFactoryProvider call({
    required FactoryFilter filter,
  }) {
    return GetAppsForFactoryProvider(
      filter: filter,
    );
  }

  @override
  GetAppsForFactoryProvider getProviderOverride(
    covariant GetAppsForFactoryProvider provider,
  ) {
    return call(
      filter: provider.filter,
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
  String? get name => r'getAppsForFactoryProvider';
}

/// See also [getAppsForFactory].
class GetAppsForFactoryProvider
    extends AutoDisposeFutureProvider<List<ForgeApp>> {
  /// See also [getAppsForFactory].
  GetAppsForFactoryProvider({
    required FactoryFilter filter,
  }) : this._internal(
          (ref) => getAppsForFactory(
            ref as GetAppsForFactoryRef,
            filter: filter,
          ),
          from: getAppsForFactoryProvider,
          name: r'getAppsForFactoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAppsForFactoryHash,
          dependencies: GetAppsForFactoryFamily._dependencies,
          allTransitiveDependencies:
              GetAppsForFactoryFamily._allTransitiveDependencies,
          filter: filter,
        );

  GetAppsForFactoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final FactoryFilter filter;

  @override
  Override overrideWith(
    FutureOr<List<ForgeApp>> Function(GetAppsForFactoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAppsForFactoryProvider._internal(
        (ref) => create(ref as GetAppsForFactoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filter: filter,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ForgeApp>> createElement() {
    return _GetAppsForFactoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAppsForFactoryProvider && other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAppsForFactoryRef on AutoDisposeFutureProviderRef<List<ForgeApp>> {
  /// The parameter `filter` of this provider.
  FactoryFilter get filter;
}

class _GetAppsForFactoryProviderElement
    extends AutoDisposeFutureProviderElement<List<ForgeApp>>
    with GetAppsForFactoryRef {
  _GetAppsForFactoryProviderElement(super.provider);

  @override
  FactoryFilter get filter => (origin as GetAppsForFactoryProvider).filter;
}

String _$getFactoryCategoriesHash() =>
    r'db400870d957e66004e026b8b66c2ed573bf2382';

/// See also [getFactoryCategories].
@ProviderFor(getFactoryCategories)
final getFactoryCategoriesProvider =
    AutoDisposeFutureProvider<List<String>>.internal(
  getFactoryCategories,
  name: r'getFactoryCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getFactoryCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetFactoryCategoriesRef = AutoDisposeFutureProviderRef<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
