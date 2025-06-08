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

String _$getAppsForGymHash() => r'1b7c4bd9009f65158b779a408ff723b5b0cbc208';

/// See also [getAppsForGym].
@ProviderFor(getAppsForGym)
const getAppsForGymProvider = GetAppsForGymFamily();

/// See also [getAppsForGym].
class GetAppsForGymFamily extends Family<AsyncValue<List<ForgeApp>>> {
  /// See also [getAppsForGym].
  const GetAppsForGymFamily();

  /// See also [getAppsForGym].
  GetAppsForGymProvider call({
    Map<String, dynamic>? filter,
  }) {
    return GetAppsForGymProvider(
      filter: filter,
    );
  }

  @override
  GetAppsForGymProvider getProviderOverride(
    covariant GetAppsForGymProvider provider,
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
  String? get name => r'getAppsForGymProvider';
}

/// See also [getAppsForGym].
class GetAppsForGymProvider extends AutoDisposeFutureProvider<List<ForgeApp>> {
  /// See also [getAppsForGym].
  GetAppsForGymProvider({
    Map<String, dynamic>? filter,
  }) : this._internal(
          (ref) => getAppsForGym(
            ref as GetAppsForGymRef,
            filter: filter,
          ),
          from: getAppsForGymProvider,
          name: r'getAppsForGymProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAppsForGymHash,
          dependencies: GetAppsForGymFamily._dependencies,
          allTransitiveDependencies:
              GetAppsForGymFamily._allTransitiveDependencies,
          filter: filter,
        );

  GetAppsForGymProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final Map<String, dynamic>? filter;

  @override
  Override overrideWith(
    FutureOr<List<ForgeApp>> Function(GetAppsForGymRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAppsForGymProvider._internal(
        (ref) => create(ref as GetAppsForGymRef),
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
    return _GetAppsForGymProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAppsForGymProvider && other.filter == filter;
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
mixin GetAppsForGymRef on AutoDisposeFutureProviderRef<List<ForgeApp>> {
  /// The parameter `filter` of this provider.
  Map<String, dynamic>? get filter;
}

class _GetAppsForGymProviderElement
    extends AutoDisposeFutureProviderElement<List<ForgeApp>>
    with GetAppsForGymRef {
  _GetAppsForGymProviderElement(super.provider);

  @override
  Map<String, dynamic>? get filter => (origin as GetAppsForGymProvider).filter;
}

String _$getGymCategoriesHash() => r'7f5f177d7cf9735cdffe7718ed4b10e8878e383f';

/// See also [getGymCategories].
@ProviderFor(getGymCategories)
final getGymCategoriesProvider =
    AutoDisposeFutureProvider<List<String>>.internal(
  getGymCategories,
  name: r'getGymCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getGymCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetGymCategoriesRef = AutoDisposeFutureProviderRef<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
