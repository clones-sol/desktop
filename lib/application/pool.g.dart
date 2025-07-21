// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pool.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$poolsRepositoryHash() => r'46ff4152e19fa4ef8ac914b6627aae3e0499c502';

/// See also [poolsRepository].
@ProviderFor(poolsRepository)
final poolsRepositoryProvider =
    AutoDisposeProvider<PoolsRepositoryImpl>.internal(
  poolsRepository,
  name: r'poolsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$poolsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PoolsRepositoryRef = AutoDisposeProviderRef<PoolsRepositoryImpl>;
String _$listPoolsHash() => r'fe6ea3d687fa9e4d82d3641d04d842cf4d5d31c2';

/// See also [listPools].
@ProviderFor(listPools)
final listPoolsProvider =
    AutoDisposeFutureProvider<List<TrainingPool>>.internal(
  listPools,
  name: r'listPoolsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$listPoolsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ListPoolsRef = AutoDisposeFutureProviderRef<List<TrainingPool>>;
String _$poolHash() => r'e4444e30d0aa4565b392d5bc273bfd0f385ecde0';

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

/// See also [pool].
@ProviderFor(pool)
const poolProvider = PoolFamily();

/// See also [pool].
class PoolFamily extends Family<AsyncValue<TrainingPool>> {
  /// See also [pool].
  const PoolFamily();

  /// See also [pool].
  PoolProvider call(
    String poolId,
  ) {
    return PoolProvider(
      poolId,
    );
  }

  @override
  PoolProvider getProviderOverride(
    covariant PoolProvider provider,
  ) {
    return call(
      provider.poolId,
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
  String? get name => r'poolProvider';
}

/// See also [pool].
class PoolProvider extends AutoDisposeFutureProvider<TrainingPool> {
  /// See also [pool].
  PoolProvider(
    String poolId,
  ) : this._internal(
          (ref) => pool(
            ref as PoolRef,
            poolId,
          ),
          from: poolProvider,
          name: r'poolProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$poolHash,
          dependencies: PoolFamily._dependencies,
          allTransitiveDependencies: PoolFamily._allTransitiveDependencies,
          poolId: poolId,
        );

  PoolProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.poolId,
  }) : super.internal();

  final String poolId;

  @override
  Override overrideWith(
    FutureOr<TrainingPool> Function(PoolRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PoolProvider._internal(
        (ref) => create(ref as PoolRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        poolId: poolId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TrainingPool> createElement() {
    return _PoolProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PoolProvider && other.poolId == poolId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, poolId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PoolRef on AutoDisposeFutureProviderRef<TrainingPool> {
  /// The parameter `poolId` of this provider.
  String get poolId;
}

class _PoolProviderElement
    extends AutoDisposeFutureProviderElement<TrainingPool> with PoolRef {
  _PoolProviderElement(super.provider);

  @override
  String get poolId => (origin as PoolProvider).poolId;
}

String _$refreshPoolHash() => r'df8fc607052d7087612ebd0363138c49d98dbb0d';

/// See also [refreshPool].
@ProviderFor(refreshPool)
const refreshPoolProvider = RefreshPoolFamily();

/// See also [refreshPool].
class RefreshPoolFamily extends Family<AsyncValue<TrainingPool>> {
  /// See also [refreshPool].
  const RefreshPoolFamily();

  /// See also [refreshPool].
  RefreshPoolProvider call({
    required String poolId,
  }) {
    return RefreshPoolProvider(
      poolId: poolId,
    );
  }

  @override
  RefreshPoolProvider getProviderOverride(
    covariant RefreshPoolProvider provider,
  ) {
    return call(
      poolId: provider.poolId,
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
  String? get name => r'refreshPoolProvider';
}

/// See also [refreshPool].
class RefreshPoolProvider extends AutoDisposeFutureProvider<TrainingPool> {
  /// See also [refreshPool].
  RefreshPoolProvider({
    required String poolId,
  }) : this._internal(
          (ref) => refreshPool(
            ref as RefreshPoolRef,
            poolId: poolId,
          ),
          from: refreshPoolProvider,
          name: r'refreshPoolProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$refreshPoolHash,
          dependencies: RefreshPoolFamily._dependencies,
          allTransitiveDependencies:
              RefreshPoolFamily._allTransitiveDependencies,
          poolId: poolId,
        );

  RefreshPoolProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.poolId,
  }) : super.internal();

  final String poolId;

  @override
  Override overrideWith(
    FutureOr<TrainingPool> Function(RefreshPoolRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RefreshPoolProvider._internal(
        (ref) => create(ref as RefreshPoolRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        poolId: poolId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TrainingPool> createElement() {
    return _RefreshPoolProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RefreshPoolProvider && other.poolId == poolId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, poolId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RefreshPoolRef on AutoDisposeFutureProviderRef<TrainingPool> {
  /// The parameter `poolId` of this provider.
  String get poolId;
}

class _RefreshPoolProviderElement
    extends AutoDisposeFutureProviderElement<TrainingPool> with RefreshPoolRef {
  _RefreshPoolProviderElement(super.provider);

  @override
  String get poolId => (origin as RefreshPoolProvider).poolId;
}

String _$updatePoolHash() => r'77ca953e5c565a9bb79395e43fc64298553b0fba';

/// See also [updatePool].
@ProviderFor(updatePool)
const updatePoolProvider = UpdatePoolFamily();

/// See also [updatePool].
class UpdatePoolFamily extends Family<AsyncValue<void>> {
  /// See also [updatePool].
  const UpdatePoolFamily();

  /// See also [updatePool].
  UpdatePoolProvider call({
    required String poolId,
    String? poolName,
    TrainingPoolStatus? status,
    String? skills,
    double? pricePerDemo,
    UploadLimit? uploadLimit,
    List<ForgeApp>? apps,
  }) {
    return UpdatePoolProvider(
      poolId: poolId,
      poolName: poolName,
      status: status,
      skills: skills,
      pricePerDemo: pricePerDemo,
      uploadLimit: uploadLimit,
      apps: apps,
    );
  }

  @override
  UpdatePoolProvider getProviderOverride(
    covariant UpdatePoolProvider provider,
  ) {
    return call(
      poolId: provider.poolId,
      poolName: provider.poolName,
      status: provider.status,
      skills: provider.skills,
      pricePerDemo: provider.pricePerDemo,
      uploadLimit: provider.uploadLimit,
      apps: provider.apps,
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
  String? get name => r'updatePoolProvider';
}

/// See also [updatePool].
class UpdatePoolProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updatePool].
  UpdatePoolProvider({
    required String poolId,
    String? poolName,
    TrainingPoolStatus? status,
    String? skills,
    double? pricePerDemo,
    UploadLimit? uploadLimit,
    List<ForgeApp>? apps,
  }) : this._internal(
          (ref) => updatePool(
            ref as UpdatePoolRef,
            poolId: poolId,
            poolName: poolName,
            status: status,
            skills: skills,
            pricePerDemo: pricePerDemo,
            uploadLimit: uploadLimit,
            apps: apps,
          ),
          from: updatePoolProvider,
          name: r'updatePoolProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updatePoolHash,
          dependencies: UpdatePoolFamily._dependencies,
          allTransitiveDependencies:
              UpdatePoolFamily._allTransitiveDependencies,
          poolId: poolId,
          poolName: poolName,
          status: status,
          skills: skills,
          pricePerDemo: pricePerDemo,
          uploadLimit: uploadLimit,
          apps: apps,
        );

  UpdatePoolProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.poolId,
    required this.poolName,
    required this.status,
    required this.skills,
    required this.pricePerDemo,
    required this.uploadLimit,
    required this.apps,
  }) : super.internal();

  final String poolId;
  final String? poolName;
  final TrainingPoolStatus? status;
  final String? skills;
  final double? pricePerDemo;
  final UploadLimit? uploadLimit;
  final List<ForgeApp>? apps;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdatePoolRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdatePoolProvider._internal(
        (ref) => create(ref as UpdatePoolRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        poolId: poolId,
        poolName: poolName,
        status: status,
        skills: skills,
        pricePerDemo: pricePerDemo,
        uploadLimit: uploadLimit,
        apps: apps,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdatePoolProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdatePoolProvider &&
        other.poolId == poolId &&
        other.poolName == poolName &&
        other.status == status &&
        other.skills == skills &&
        other.pricePerDemo == pricePerDemo &&
        other.uploadLimit == uploadLimit &&
        other.apps == apps;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, poolId.hashCode);
    hash = _SystemHash.combine(hash, poolName.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);
    hash = _SystemHash.combine(hash, skills.hashCode);
    hash = _SystemHash.combine(hash, pricePerDemo.hashCode);
    hash = _SystemHash.combine(hash, uploadLimit.hashCode);
    hash = _SystemHash.combine(hash, apps.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdatePoolRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `poolId` of this provider.
  String get poolId;

  /// The parameter `poolName` of this provider.
  String? get poolName;

  /// The parameter `status` of this provider.
  TrainingPoolStatus? get status;

  /// The parameter `skills` of this provider.
  String? get skills;

  /// The parameter `pricePerDemo` of this provider.
  double? get pricePerDemo;

  /// The parameter `uploadLimit` of this provider.
  UploadLimit? get uploadLimit;

  /// The parameter `apps` of this provider.
  List<ForgeApp>? get apps;
}

class _UpdatePoolProviderElement extends AutoDisposeFutureProviderElement<void>
    with UpdatePoolRef {
  _UpdatePoolProviderElement(super.provider);

  @override
  String get poolId => (origin as UpdatePoolProvider).poolId;
  @override
  String? get poolName => (origin as UpdatePoolProvider).poolName;
  @override
  TrainingPoolStatus? get status => (origin as UpdatePoolProvider).status;
  @override
  String? get skills => (origin as UpdatePoolProvider).skills;
  @override
  double? get pricePerDemo => (origin as UpdatePoolProvider).pricePerDemo;
  @override
  UploadLimit? get uploadLimit => (origin as UpdatePoolProvider).uploadLimit;
  @override
  List<ForgeApp>? get apps => (origin as UpdatePoolProvider).apps;
}

String _$getRewardHash() => r'18f5597f8226a9a413c75586098ba4dd8ee061ec';

/// See also [getReward].
@ProviderFor(getReward)
const getRewardProvider = GetRewardFamily();

/// See also [getReward].
class GetRewardFamily extends Family<AsyncValue<RewardInfo>> {
  /// See also [getReward].
  const GetRewardFamily();

  /// See also [getReward].
  GetRewardProvider call({
    required String poolId,
    String? taskId,
  }) {
    return GetRewardProvider(
      poolId: poolId,
      taskId: taskId,
    );
  }

  @override
  GetRewardProvider getProviderOverride(
    covariant GetRewardProvider provider,
  ) {
    return call(
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
  String? get name => r'getRewardProvider';
}

/// See also [getReward].
class GetRewardProvider extends AutoDisposeFutureProvider<RewardInfo> {
  /// See also [getReward].
  GetRewardProvider({
    required String poolId,
    String? taskId,
  }) : this._internal(
          (ref) => getReward(
            ref as GetRewardRef,
            poolId: poolId,
            taskId: taskId,
          ),
          from: getRewardProvider,
          name: r'getRewardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getRewardHash,
          dependencies: GetRewardFamily._dependencies,
          allTransitiveDependencies: GetRewardFamily._allTransitiveDependencies,
          poolId: poolId,
          taskId: taskId,
        );

  GetRewardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.poolId,
    required this.taskId,
  }) : super.internal();

  final String poolId;
  final String? taskId;

  @override
  Override overrideWith(
    FutureOr<RewardInfo> Function(GetRewardRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetRewardProvider._internal(
        (ref) => create(ref as GetRewardRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        poolId: poolId,
        taskId: taskId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RewardInfo> createElement() {
    return _GetRewardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetRewardProvider &&
        other.poolId == poolId &&
        other.taskId == taskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, poolId.hashCode);
    hash = _SystemHash.combine(hash, taskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetRewardRef on AutoDisposeFutureProviderRef<RewardInfo> {
  /// The parameter `poolId` of this provider.
  String get poolId;

  /// The parameter `taskId` of this provider.
  String? get taskId;
}

class _GetRewardProviderElement
    extends AutoDisposeFutureProviderElement<RewardInfo> with GetRewardRef {
  _GetRewardProviderElement(super.provider);

  @override
  String get poolId => (origin as GetRewardProvider).poolId;
  @override
  String? get taskId => (origin as GetRewardProvider).taskId;
}

String _$createPoolWithAppsHash() =>
    r'1f0f6468be224cc3c46e8a82147efeabedc4f61c';

/// See also [createPoolWithApps].
@ProviderFor(createPoolWithApps)
const createPoolWithAppsProvider = CreatePoolWithAppsFamily();

/// See also [createPoolWithApps].
class CreatePoolWithAppsFamily extends Family<AsyncValue<TrainingPool>> {
  /// See also [createPoolWithApps].
  const CreatePoolWithAppsFamily();

  /// See also [createPoolWithApps].
  CreatePoolWithAppsProvider call({
    required String poolName,
    required String skills,
    required String tokenSymbol,
    required List<ForgeApp> apps,
    required String ownerAddress,
  }) {
    return CreatePoolWithAppsProvider(
      poolName: poolName,
      skills: skills,
      tokenSymbol: tokenSymbol,
      apps: apps,
      ownerAddress: ownerAddress,
    );
  }

  @override
  CreatePoolWithAppsProvider getProviderOverride(
    covariant CreatePoolWithAppsProvider provider,
  ) {
    return call(
      poolName: provider.poolName,
      skills: provider.skills,
      tokenSymbol: provider.tokenSymbol,
      apps: provider.apps,
      ownerAddress: provider.ownerAddress,
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
  String? get name => r'createPoolWithAppsProvider';
}

/// See also [createPoolWithApps].
class CreatePoolWithAppsProvider
    extends AutoDisposeFutureProvider<TrainingPool> {
  /// See also [createPoolWithApps].
  CreatePoolWithAppsProvider({
    required String poolName,
    required String skills,
    required String tokenSymbol,
    required List<ForgeApp> apps,
    required String ownerAddress,
  }) : this._internal(
          (ref) => createPoolWithApps(
            ref as CreatePoolWithAppsRef,
            poolName: poolName,
            skills: skills,
            tokenSymbol: tokenSymbol,
            apps: apps,
            ownerAddress: ownerAddress,
          ),
          from: createPoolWithAppsProvider,
          name: r'createPoolWithAppsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createPoolWithAppsHash,
          dependencies: CreatePoolWithAppsFamily._dependencies,
          allTransitiveDependencies:
              CreatePoolWithAppsFamily._allTransitiveDependencies,
          poolName: poolName,
          skills: skills,
          tokenSymbol: tokenSymbol,
          apps: apps,
          ownerAddress: ownerAddress,
        );

  CreatePoolWithAppsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.poolName,
    required this.skills,
    required this.tokenSymbol,
    required this.apps,
    required this.ownerAddress,
  }) : super.internal();

  final String poolName;
  final String skills;
  final String tokenSymbol;
  final List<ForgeApp> apps;
  final String ownerAddress;

  @override
  Override overrideWith(
    FutureOr<TrainingPool> Function(CreatePoolWithAppsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreatePoolWithAppsProvider._internal(
        (ref) => create(ref as CreatePoolWithAppsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        poolName: poolName,
        skills: skills,
        tokenSymbol: tokenSymbol,
        apps: apps,
        ownerAddress: ownerAddress,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TrainingPool> createElement() {
    return _CreatePoolWithAppsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreatePoolWithAppsProvider &&
        other.poolName == poolName &&
        other.skills == skills &&
        other.tokenSymbol == tokenSymbol &&
        other.apps == apps &&
        other.ownerAddress == ownerAddress;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, poolName.hashCode);
    hash = _SystemHash.combine(hash, skills.hashCode);
    hash = _SystemHash.combine(hash, tokenSymbol.hashCode);
    hash = _SystemHash.combine(hash, apps.hashCode);
    hash = _SystemHash.combine(hash, ownerAddress.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreatePoolWithAppsRef on AutoDisposeFutureProviderRef<TrainingPool> {
  /// The parameter `poolName` of this provider.
  String get poolName;

  /// The parameter `skills` of this provider.
  String get skills;

  /// The parameter `tokenSymbol` of this provider.
  String get tokenSymbol;

  /// The parameter `apps` of this provider.
  List<ForgeApp> get apps;

  /// The parameter `ownerAddress` of this provider.
  String get ownerAddress;
}

class _CreatePoolWithAppsProviderElement
    extends AutoDisposeFutureProviderElement<TrainingPool>
    with CreatePoolWithAppsRef {
  _CreatePoolWithAppsProviderElement(super.provider);

  @override
  String get poolName => (origin as CreatePoolWithAppsProvider).poolName;
  @override
  String get skills => (origin as CreatePoolWithAppsProvider).skills;
  @override
  String get tokenSymbol => (origin as CreatePoolWithAppsProvider).tokenSymbol;
  @override
  List<ForgeApp> get apps => (origin as CreatePoolWithAppsProvider).apps;
  @override
  String get ownerAddress =>
      (origin as CreatePoolWithAppsProvider).ownerAddress;
}

String _$getSupportedTokensHash() =>
    r'3b4de68b911021e116862eff3a07d2016678303c';

/// See also [getSupportedTokens].
@ProviderFor(getSupportedTokens)
final getSupportedTokensProvider =
    AutoDisposeFutureProvider<List<SupportedToken>>.internal(
  getSupportedTokens,
  name: r'getSupportedTokensProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSupportedTokensHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetSupportedTokensRef
    = AutoDisposeFutureProviderRef<List<SupportedToken>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
