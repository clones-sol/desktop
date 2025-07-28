// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demonstration.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$demonstrationRepositoryHash() =>
    r'767576a35190991444fe6ee70394bd518d3ccb4b';

/// See also [demonstrationRepository].
@ProviderFor(demonstrationRepository)
final demonstrationRepositoryProvider =
    AutoDisposeProvider<DemonstrationRepositoryImpl>.internal(
  demonstrationRepository,
  name: r'demonstrationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$demonstrationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DemonstrationRepositoryRef
    = AutoDisposeProviderRef<DemonstrationRepositoryImpl>;
String _$generateDemonstrationHash() =>
    r'37bd3d646f8631e97d7ee5f75641cbbfe3236475';

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

/// See also [generateDemonstration].
@ProviderFor(generateDemonstration)
const generateDemonstrationProvider = GenerateDemonstrationFamily();

/// See also [generateDemonstration].
class GenerateDemonstrationFamily extends Family<AsyncValue<Demonstration>> {
  /// See also [generateDemonstration].
  const GenerateDemonstrationFamily();

  /// See also [generateDemonstration].
  GenerateDemonstrationProvider call({
    required String prompt,
    required String address,
    String? poolId,
    String? taskId,
  }) {
    return GenerateDemonstrationProvider(
      prompt: prompt,
      address: address,
      poolId: poolId,
      taskId: taskId,
    );
  }

  @override
  GenerateDemonstrationProvider getProviderOverride(
    covariant GenerateDemonstrationProvider provider,
  ) {
    return call(
      prompt: provider.prompt,
      address: provider.address,
      poolId: provider.poolId,
      taskId: provider.taskId,
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
  String? get name => r'generateDemonstrationProvider';
}

/// See also [generateDemonstration].
class GenerateDemonstrationProvider
    extends AutoDisposeFutureProvider<Demonstration> {
  /// See also [generateDemonstration].
  GenerateDemonstrationProvider({
    required String prompt,
    required String address,
    String? poolId,
    String? taskId,
  }) : this._internal(
          (ref) => generateDemonstration(
            ref as GenerateDemonstrationRef,
            prompt: prompt,
            address: address,
            poolId: poolId,
            taskId: taskId,
          ),
          from: generateDemonstrationProvider,
          name: r'generateDemonstrationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$generateDemonstrationHash,
          dependencies: GenerateDemonstrationFamily._dependencies,
          allTransitiveDependencies:
              GenerateDemonstrationFamily._allTransitiveDependencies,
          prompt: prompt,
          address: address,
          poolId: poolId,
          taskId: taskId,
        );

  GenerateDemonstrationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.prompt,
    required this.address,
    required this.poolId,
    required this.taskId,
  }) : super.internal();

  final String prompt;
  final String address;
  final String? poolId;
  final String? taskId;

  @override
  Override overrideWith(
    FutureOr<Demonstration> Function(GenerateDemonstrationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GenerateDemonstrationProvider._internal(
        (ref) => create(ref as GenerateDemonstrationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        prompt: prompt,
        address: address,
        poolId: poolId,
        taskId: taskId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Demonstration> createElement() {
    return _GenerateDemonstrationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GenerateDemonstrationProvider &&
        other.prompt == prompt &&
        other.address == address &&
        other.poolId == poolId &&
        other.taskId == taskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, prompt.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);
    hash = _SystemHash.combine(hash, poolId.hashCode);
    hash = _SystemHash.combine(hash, taskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GenerateDemonstrationRef on AutoDisposeFutureProviderRef<Demonstration> {
  /// The parameter `prompt` of this provider.
  String get prompt;

  /// The parameter `address` of this provider.
  String get address;

  /// The parameter `poolId` of this provider.
  String? get poolId;

  /// The parameter `taskId` of this provider.
  String? get taskId;
}

class _GenerateDemonstrationProviderElement
    extends AutoDisposeFutureProviderElement<Demonstration>
    with GenerateDemonstrationRef {
  _GenerateDemonstrationProviderElement(super.provider);

  @override
  String get prompt => (origin as GenerateDemonstrationProvider).prompt;
  @override
  String get address => (origin as GenerateDemonstrationProvider).address;
  @override
  String? get poolId => (origin as GenerateDemonstrationProvider).poolId;
  @override
  String? get taskId => (origin as GenerateDemonstrationProvider).taskId;
}

String _$checkDemonstrationProgressHash() =>
    r'881257afb388c035395bb24d50cd28552626a2a7';

/// See also [checkDemonstrationProgress].
@ProviderFor(checkDemonstrationProgress)
const checkDemonstrationProgressProvider = CheckDemonstrationProgressFamily();

/// See also [checkDemonstrationProgress].
class CheckDemonstrationProgressFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [checkDemonstrationProgress].
  const CheckDemonstrationProgressFamily();

  /// See also [checkDemonstrationProgress].
  CheckDemonstrationProgressProvider call({
    required Demonstration demonstration,
  }) {
    return CheckDemonstrationProgressProvider(
      demonstration: demonstration,
    );
  }

  @override
  CheckDemonstrationProgressProvider getProviderOverride(
    covariant CheckDemonstrationProgressProvider provider,
  ) {
    return call(
      demonstration: provider.demonstration,
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
  String? get name => r'checkDemonstrationProgressProvider';
}

/// See also [checkDemonstrationProgress].
class CheckDemonstrationProgressProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [checkDemonstrationProgress].
  CheckDemonstrationProgressProvider({
    required Demonstration demonstration,
  }) : this._internal(
          (ref) => checkDemonstrationProgress(
            ref as CheckDemonstrationProgressRef,
            demonstration: demonstration,
          ),
          from: checkDemonstrationProgressProvider,
          name: r'checkDemonstrationProgressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkDemonstrationProgressHash,
          dependencies: CheckDemonstrationProgressFamily._dependencies,
          allTransitiveDependencies:
              CheckDemonstrationProgressFamily._allTransitiveDependencies,
          demonstration: demonstration,
        );

  CheckDemonstrationProgressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.demonstration,
  }) : super.internal();

  final Demonstration demonstration;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(
            CheckDemonstrationProgressRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CheckDemonstrationProgressProvider._internal(
        (ref) => create(ref as CheckDemonstrationProgressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        demonstration: demonstration,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _CheckDemonstrationProgressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckDemonstrationProgressProvider &&
        other.demonstration == demonstration;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, demonstration.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CheckDemonstrationProgressRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `demonstration` of this provider.
  Demonstration get demonstration;
}

class _CheckDemonstrationProgressProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with CheckDemonstrationProgressRef {
  _CheckDemonstrationProgressProviderElement(super.provider);

  @override
  Demonstration get demonstration =>
      (origin as CheckDemonstrationProgressProvider).demonstration;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
