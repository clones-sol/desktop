// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gas.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gasRepositoryHash() => r'ac68c02e0b9c56c518f4ee81df8449ed2f44fa9a';

/// See also [gasRepository].
@ProviderFor(gasRepository)
final gasRepositoryProvider = AutoDisposeProvider<GasRepositoryImpl>.internal(
  gasRepository,
  name: r'gasRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gasRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GasRepositoryRef = AutoDisposeProviderRef<GasRepositoryImpl>;
String _$estimateGasHash() => r'ff9527105bad2a2fa070af6463d6eac6e65d48c8';

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

/// See also [estimateGas].
@ProviderFor(estimateGas)
const estimateGasProvider = EstimateGasFamily();

/// See also [estimateGas].
class EstimateGasFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [estimateGas].
  const EstimateGasFamily();

  /// See also [estimateGas].
  EstimateGasProvider call({
    required List<ClaimData> claims,
    required String fromAddress,
  }) {
    return EstimateGasProvider(
      claims: claims,
      fromAddress: fromAddress,
    );
  }

  @override
  EstimateGasProvider getProviderOverride(
    covariant EstimateGasProvider provider,
  ) {
    return call(
      claims: provider.claims,
      fromAddress: provider.fromAddress,
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
  String? get name => r'estimateGasProvider';
}

/// See also [estimateGas].
class EstimateGasProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [estimateGas].
  EstimateGasProvider({
    required List<ClaimData> claims,
    required String fromAddress,
  }) : this._internal(
          (ref) => estimateGas(
            ref as EstimateGasRef,
            claims: claims,
            fromAddress: fromAddress,
          ),
          from: estimateGasProvider,
          name: r'estimateGasProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$estimateGasHash,
          dependencies: EstimateGasFamily._dependencies,
          allTransitiveDependencies:
              EstimateGasFamily._allTransitiveDependencies,
          claims: claims,
          fromAddress: fromAddress,
        );

  EstimateGasProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.claims,
    required this.fromAddress,
  }) : super.internal();

  final List<ClaimData> claims;
  final String fromAddress;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(EstimateGasRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EstimateGasProvider._internal(
        (ref) => create(ref as EstimateGasRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        claims: claims,
        fromAddress: fromAddress,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _EstimateGasProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EstimateGasProvider &&
        other.claims == claims &&
        other.fromAddress == fromAddress;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, claims.hashCode);
    hash = _SystemHash.combine(hash, fromAddress.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EstimateGasRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `claims` of this provider.
  List<ClaimData> get claims;

  /// The parameter `fromAddress` of this provider.
  String get fromAddress;
}

class _EstimateGasProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with EstimateGasRef {
  _EstimateGasProviderElement(super.provider);

  @override
  List<ClaimData> get claims => (origin as EstimateGasProvider).claims;
  @override
  String get fromAddress => (origin as EstimateGasProvider).fromAddress;
}

String _$analyzeGasCostHash() => r'a2c1929a5a382285066d37b5d903a6a1c6a61318';

/// See also [analyzeGasCost].
@ProviderFor(analyzeGasCost)
const analyzeGasCostProvider = AnalyzeGasCostFamily();

/// See also [analyzeGasCost].
class AnalyzeGasCostFamily extends Family<AsyncValue<GasAnalysis>> {
  /// See also [analyzeGasCost].
  const AnalyzeGasCostFamily();

  /// See also [analyzeGasCost].
  AnalyzeGasCostProvider call({
    required List<ClaimData> claims,
    required String fromAddress,
    double tokenPriceUsd = 1.0,
  }) {
    return AnalyzeGasCostProvider(
      claims: claims,
      fromAddress: fromAddress,
      tokenPriceUsd: tokenPriceUsd,
    );
  }

  @override
  AnalyzeGasCostProvider getProviderOverride(
    covariant AnalyzeGasCostProvider provider,
  ) {
    return call(
      claims: provider.claims,
      fromAddress: provider.fromAddress,
      tokenPriceUsd: provider.tokenPriceUsd,
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
  String? get name => r'analyzeGasCostProvider';
}

/// See also [analyzeGasCost].
class AnalyzeGasCostProvider extends AutoDisposeFutureProvider<GasAnalysis> {
  /// See also [analyzeGasCost].
  AnalyzeGasCostProvider({
    required List<ClaimData> claims,
    required String fromAddress,
    double tokenPriceUsd = 1.0,
  }) : this._internal(
          (ref) => analyzeGasCost(
            ref as AnalyzeGasCostRef,
            claims: claims,
            fromAddress: fromAddress,
            tokenPriceUsd: tokenPriceUsd,
          ),
          from: analyzeGasCostProvider,
          name: r'analyzeGasCostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$analyzeGasCostHash,
          dependencies: AnalyzeGasCostFamily._dependencies,
          allTransitiveDependencies:
              AnalyzeGasCostFamily._allTransitiveDependencies,
          claims: claims,
          fromAddress: fromAddress,
          tokenPriceUsd: tokenPriceUsd,
        );

  AnalyzeGasCostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.claims,
    required this.fromAddress,
    required this.tokenPriceUsd,
  }) : super.internal();

  final List<ClaimData> claims;
  final String fromAddress;
  final double tokenPriceUsd;

  @override
  Override overrideWith(
    FutureOr<GasAnalysis> Function(AnalyzeGasCostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AnalyzeGasCostProvider._internal(
        (ref) => create(ref as AnalyzeGasCostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        claims: claims,
        fromAddress: fromAddress,
        tokenPriceUsd: tokenPriceUsd,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GasAnalysis> createElement() {
    return _AnalyzeGasCostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnalyzeGasCostProvider &&
        other.claims == claims &&
        other.fromAddress == fromAddress &&
        other.tokenPriceUsd == tokenPriceUsd;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, claims.hashCode);
    hash = _SystemHash.combine(hash, fromAddress.hashCode);
    hash = _SystemHash.combine(hash, tokenPriceUsd.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AnalyzeGasCostRef on AutoDisposeFutureProviderRef<GasAnalysis> {
  /// The parameter `claims` of this provider.
  List<ClaimData> get claims;

  /// The parameter `fromAddress` of this provider.
  String get fromAddress;

  /// The parameter `tokenPriceUsd` of this provider.
  double get tokenPriceUsd;
}

class _AnalyzeGasCostProviderElement
    extends AutoDisposeFutureProviderElement<GasAnalysis>
    with AnalyzeGasCostRef {
  _AnalyzeGasCostProviderElement(super.provider);

  @override
  List<ClaimData> get claims => (origin as AnalyzeGasCostProvider).claims;
  @override
  String get fromAddress => (origin as AnalyzeGasCostProvider).fromAddress;
  @override
  double get tokenPriceUsd => (origin as AnalyzeGasCostProvider).tokenPriceUsd;
}

String _$optimizeBatchSizeHash() => r'9f6a0f7eacfb9dcaaaa54676791916cafbce1631';

/// See also [optimizeBatchSize].
@ProviderFor(optimizeBatchSize)
const optimizeBatchSizeProvider = OptimizeBatchSizeFamily();

/// See also [optimizeBatchSize].
class OptimizeBatchSizeFamily extends Family<AsyncValue<BatchOptimization>> {
  /// See also [optimizeBatchSize].
  const OptimizeBatchSizeFamily();

  /// See also [optimizeBatchSize].
  OptimizeBatchSizeProvider call({
    required List<ClaimData> claims,
    required String fromAddress,
    double maxGasCostUsd = 50.0,
  }) {
    return OptimizeBatchSizeProvider(
      claims: claims,
      fromAddress: fromAddress,
      maxGasCostUsd: maxGasCostUsd,
    );
  }

  @override
  OptimizeBatchSizeProvider getProviderOverride(
    covariant OptimizeBatchSizeProvider provider,
  ) {
    return call(
      claims: provider.claims,
      fromAddress: provider.fromAddress,
      maxGasCostUsd: provider.maxGasCostUsd,
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
  String? get name => r'optimizeBatchSizeProvider';
}

/// See also [optimizeBatchSize].
class OptimizeBatchSizeProvider
    extends AutoDisposeFutureProvider<BatchOptimization> {
  /// See also [optimizeBatchSize].
  OptimizeBatchSizeProvider({
    required List<ClaimData> claims,
    required String fromAddress,
    double maxGasCostUsd = 50.0,
  }) : this._internal(
          (ref) => optimizeBatchSize(
            ref as OptimizeBatchSizeRef,
            claims: claims,
            fromAddress: fromAddress,
            maxGasCostUsd: maxGasCostUsd,
          ),
          from: optimizeBatchSizeProvider,
          name: r'optimizeBatchSizeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$optimizeBatchSizeHash,
          dependencies: OptimizeBatchSizeFamily._dependencies,
          allTransitiveDependencies:
              OptimizeBatchSizeFamily._allTransitiveDependencies,
          claims: claims,
          fromAddress: fromAddress,
          maxGasCostUsd: maxGasCostUsd,
        );

  OptimizeBatchSizeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.claims,
    required this.fromAddress,
    required this.maxGasCostUsd,
  }) : super.internal();

  final List<ClaimData> claims;
  final String fromAddress;
  final double maxGasCostUsd;

  @override
  Override overrideWith(
    FutureOr<BatchOptimization> Function(OptimizeBatchSizeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OptimizeBatchSizeProvider._internal(
        (ref) => create(ref as OptimizeBatchSizeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        claims: claims,
        fromAddress: fromAddress,
        maxGasCostUsd: maxGasCostUsd,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BatchOptimization> createElement() {
    return _OptimizeBatchSizeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OptimizeBatchSizeProvider &&
        other.claims == claims &&
        other.fromAddress == fromAddress &&
        other.maxGasCostUsd == maxGasCostUsd;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, claims.hashCode);
    hash = _SystemHash.combine(hash, fromAddress.hashCode);
    hash = _SystemHash.combine(hash, maxGasCostUsd.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OptimizeBatchSizeRef on AutoDisposeFutureProviderRef<BatchOptimization> {
  /// The parameter `claims` of this provider.
  List<ClaimData> get claims;

  /// The parameter `fromAddress` of this provider.
  String get fromAddress;

  /// The parameter `maxGasCostUsd` of this provider.
  double get maxGasCostUsd;
}

class _OptimizeBatchSizeProviderElement
    extends AutoDisposeFutureProviderElement<BatchOptimization>
    with OptimizeBatchSizeRef {
  _OptimizeBatchSizeProviderElement(super.provider);

  @override
  List<ClaimData> get claims => (origin as OptimizeBatchSizeProvider).claims;
  @override
  String get fromAddress => (origin as OptimizeBatchSizeProvider).fromAddress;
  @override
  double get maxGasCostUsd =>
      (origin as OptimizeBatchSizeProvider).maxGasCostUsd;
}

String _$getGasAdviceHash() => r'7a2558e906abea240b114da581e62df7f50ed917';

/// See also [getGasAdvice].
@ProviderFor(getGasAdvice)
final getGasAdviceProvider = AutoDisposeFutureProvider<GasPriceAdvice>.internal(
  getGasAdvice,
  name: r'getGasAdviceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getGasAdviceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetGasAdviceRef = AutoDisposeFutureProviderRef<GasPriceAdvice>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
