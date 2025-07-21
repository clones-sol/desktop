// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$agentRepositoryHash() => r'ab0bd43b918fbfdb233e97599e5b83b04e9cee53';

/// See also [agentRepository].
@ProviderFor(agentRepository)
final agentRepositoryProvider =
    AutoDisposeProvider<AgentRepositoryImpl>.internal(
  agentRepository,
  name: r'agentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$agentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AgentRepositoryRef = AutoDisposeProviderRef<AgentRepositoryImpl>;
String _$createAgentHash() => r'e87251835edc8dfe7b144f2a61f8ff5bc996ae14';

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

/// See also [createAgent].
@ProviderFor(createAgent)
const createAgentProvider = CreateAgentFamily();

/// See also [createAgent].
class CreateAgentFamily extends Family<AsyncValue<GymAgent>> {
  /// See also [createAgent].
  const CreateAgentFamily();

  /// See also [createAgent].
  CreateAgentProvider call({
    required String poolId,
    required String agentName,
    required String ticker,
    required String description,
    String? logoUrl,
    required AgentTokenomics tokenomics,
    required AgentLegal legal,
    String? customUrl,
    String? huggingFaceApiKey,
  }) {
    return CreateAgentProvider(
      poolId: poolId,
      agentName: agentName,
      ticker: ticker,
      description: description,
      logoUrl: logoUrl,
      tokenomics: tokenomics,
      legal: legal,
      customUrl: customUrl,
      huggingFaceApiKey: huggingFaceApiKey,
    );
  }

  @override
  CreateAgentProvider getProviderOverride(
    covariant CreateAgentProvider provider,
  ) {
    return call(
      poolId: provider.poolId,
      agentName: provider.agentName,
      ticker: provider.ticker,
      description: provider.description,
      logoUrl: provider.logoUrl,
      tokenomics: provider.tokenomics,
      legal: provider.legal,
      customUrl: provider.customUrl,
      huggingFaceApiKey: provider.huggingFaceApiKey,
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
  String? get name => r'createAgentProvider';
}

/// See also [createAgent].
class CreateAgentProvider extends AutoDisposeFutureProvider<GymAgent> {
  /// See also [createAgent].
  CreateAgentProvider({
    required String poolId,
    required String agentName,
    required String ticker,
    required String description,
    String? logoUrl,
    required AgentTokenomics tokenomics,
    required AgentLegal legal,
    String? customUrl,
    String? huggingFaceApiKey,
  }) : this._internal(
          (ref) => createAgent(
            ref as CreateAgentRef,
            poolId: poolId,
            agentName: agentName,
            ticker: ticker,
            description: description,
            logoUrl: logoUrl,
            tokenomics: tokenomics,
            legal: legal,
            customUrl: customUrl,
            huggingFaceApiKey: huggingFaceApiKey,
          ),
          from: createAgentProvider,
          name: r'createAgentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createAgentHash,
          dependencies: CreateAgentFamily._dependencies,
          allTransitiveDependencies:
              CreateAgentFamily._allTransitiveDependencies,
          poolId: poolId,
          agentName: agentName,
          ticker: ticker,
          description: description,
          logoUrl: logoUrl,
          tokenomics: tokenomics,
          legal: legal,
          customUrl: customUrl,
          huggingFaceApiKey: huggingFaceApiKey,
        );

  CreateAgentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.poolId,
    required this.agentName,
    required this.ticker,
    required this.description,
    required this.logoUrl,
    required this.tokenomics,
    required this.legal,
    required this.customUrl,
    required this.huggingFaceApiKey,
  }) : super.internal();

  final String poolId;
  final String agentName;
  final String ticker;
  final String description;
  final String? logoUrl;
  final AgentTokenomics tokenomics;
  final AgentLegal legal;
  final String? customUrl;
  final String? huggingFaceApiKey;

  @override
  Override overrideWith(
    FutureOr<GymAgent> Function(CreateAgentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateAgentProvider._internal(
        (ref) => create(ref as CreateAgentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        poolId: poolId,
        agentName: agentName,
        ticker: ticker,
        description: description,
        logoUrl: logoUrl,
        tokenomics: tokenomics,
        legal: legal,
        customUrl: customUrl,
        huggingFaceApiKey: huggingFaceApiKey,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GymAgent> createElement() {
    return _CreateAgentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateAgentProvider &&
        other.poolId == poolId &&
        other.agentName == agentName &&
        other.ticker == ticker &&
        other.description == description &&
        other.logoUrl == logoUrl &&
        other.tokenomics == tokenomics &&
        other.legal == legal &&
        other.customUrl == customUrl &&
        other.huggingFaceApiKey == huggingFaceApiKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, poolId.hashCode);
    hash = _SystemHash.combine(hash, agentName.hashCode);
    hash = _SystemHash.combine(hash, ticker.hashCode);
    hash = _SystemHash.combine(hash, description.hashCode);
    hash = _SystemHash.combine(hash, logoUrl.hashCode);
    hash = _SystemHash.combine(hash, tokenomics.hashCode);
    hash = _SystemHash.combine(hash, legal.hashCode);
    hash = _SystemHash.combine(hash, customUrl.hashCode);
    hash = _SystemHash.combine(hash, huggingFaceApiKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateAgentRef on AutoDisposeFutureProviderRef<GymAgent> {
  /// The parameter `poolId` of this provider.
  String get poolId;

  /// The parameter `agentName` of this provider.
  String get agentName;

  /// The parameter `ticker` of this provider.
  String get ticker;

  /// The parameter `description` of this provider.
  String get description;

  /// The parameter `logoUrl` of this provider.
  String? get logoUrl;

  /// The parameter `tokenomics` of this provider.
  AgentTokenomics get tokenomics;

  /// The parameter `legal` of this provider.
  AgentLegal get legal;

  /// The parameter `customUrl` of this provider.
  String? get customUrl;

  /// The parameter `huggingFaceApiKey` of this provider.
  String? get huggingFaceApiKey;
}

class _CreateAgentProviderElement
    extends AutoDisposeFutureProviderElement<GymAgent> with CreateAgentRef {
  _CreateAgentProviderElement(super.provider);

  @override
  String get poolId => (origin as CreateAgentProvider).poolId;
  @override
  String get agentName => (origin as CreateAgentProvider).agentName;
  @override
  String get ticker => (origin as CreateAgentProvider).ticker;
  @override
  String get description => (origin as CreateAgentProvider).description;
  @override
  String? get logoUrl => (origin as CreateAgentProvider).logoUrl;
  @override
  AgentTokenomics get tokenomics => (origin as CreateAgentProvider).tokenomics;
  @override
  AgentLegal get legal => (origin as CreateAgentProvider).legal;
  @override
  String? get customUrl => (origin as CreateAgentProvider).customUrl;
  @override
  String? get huggingFaceApiKey =>
      (origin as CreateAgentProvider).huggingFaceApiKey;
}

String _$getAgentByPoolIdHash() => r'd9455b80bbf088ebd128513ce9ae6dc4b3f306b9';

/// See also [getAgentByPoolId].
@ProviderFor(getAgentByPoolId)
const getAgentByPoolIdProvider = GetAgentByPoolIdFamily();

/// See also [getAgentByPoolId].
class GetAgentByPoolIdFamily extends Family<AsyncValue<GymAgent?>> {
  /// See also [getAgentByPoolId].
  const GetAgentByPoolIdFamily();

  /// See also [getAgentByPoolId].
  GetAgentByPoolIdProvider call(
    String poolId,
  ) {
    return GetAgentByPoolIdProvider(
      poolId,
    );
  }

  @override
  GetAgentByPoolIdProvider getProviderOverride(
    covariant GetAgentByPoolIdProvider provider,
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
  String? get name => r'getAgentByPoolIdProvider';
}

/// See also [getAgentByPoolId].
class GetAgentByPoolIdProvider extends AutoDisposeFutureProvider<GymAgent?> {
  /// See also [getAgentByPoolId].
  GetAgentByPoolIdProvider(
    String poolId,
  ) : this._internal(
          (ref) => getAgentByPoolId(
            ref as GetAgentByPoolIdRef,
            poolId,
          ),
          from: getAgentByPoolIdProvider,
          name: r'getAgentByPoolIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAgentByPoolIdHash,
          dependencies: GetAgentByPoolIdFamily._dependencies,
          allTransitiveDependencies:
              GetAgentByPoolIdFamily._allTransitiveDependencies,
          poolId: poolId,
        );

  GetAgentByPoolIdProvider._internal(
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
    FutureOr<GymAgent?> Function(GetAgentByPoolIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAgentByPoolIdProvider._internal(
        (ref) => create(ref as GetAgentByPoolIdRef),
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
  AutoDisposeFutureProviderElement<GymAgent?> createElement() {
    return _GetAgentByPoolIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAgentByPoolIdProvider && other.poolId == poolId;
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
mixin GetAgentByPoolIdRef on AutoDisposeFutureProviderRef<GymAgent?> {
  /// The parameter `poolId` of this provider.
  String get poolId;
}

class _GetAgentByPoolIdProviderElement
    extends AutoDisposeFutureProviderElement<GymAgent?>
    with GetAgentByPoolIdRef {
  _GetAgentByPoolIdProviderElement(super.provider);

  @override
  String get poolId => (origin as GetAgentByPoolIdProvider).poolId;
}

String _$listAgentsHash() => r'53bb9dd4d9a939c353a255a425ac8edb44389e52';

/// See also [listAgents].
@ProviderFor(listAgents)
final listAgentsProvider = AutoDisposeFutureProvider<List<GymAgent>>.internal(
  listAgents,
  name: r'listAgentsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$listAgentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ListAgentsRef = AutoDisposeFutureProviderRef<List<GymAgent>>;
String _$updateAgentHash() => r'6b4b3a56e53d432e1f97235c6ebbecffff54a3c2';

/// See also [updateAgent].
@ProviderFor(updateAgent)
const updateAgentProvider = UpdateAgentFamily();

/// See also [updateAgent].
class UpdateAgentFamily extends Family<AsyncValue<GymAgent>> {
  /// See also [updateAgent].
  const UpdateAgentFamily();

  /// See also [updateAgent].
  UpdateAgentProvider call({
    required String agentId,
    String? agentName,
    String? description,
    String? logoUrl,
    String? customUrl,
    String? huggingFaceApiKey,
  }) {
    return UpdateAgentProvider(
      agentId: agentId,
      agentName: agentName,
      description: description,
      logoUrl: logoUrl,
      customUrl: customUrl,
      huggingFaceApiKey: huggingFaceApiKey,
    );
  }

  @override
  UpdateAgentProvider getProviderOverride(
    covariant UpdateAgentProvider provider,
  ) {
    return call(
      agentId: provider.agentId,
      agentName: provider.agentName,
      description: provider.description,
      logoUrl: provider.logoUrl,
      customUrl: provider.customUrl,
      huggingFaceApiKey: provider.huggingFaceApiKey,
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
  String? get name => r'updateAgentProvider';
}

/// See also [updateAgent].
class UpdateAgentProvider extends AutoDisposeFutureProvider<GymAgent> {
  /// See also [updateAgent].
  UpdateAgentProvider({
    required String agentId,
    String? agentName,
    String? description,
    String? logoUrl,
    String? customUrl,
    String? huggingFaceApiKey,
  }) : this._internal(
          (ref) => updateAgent(
            ref as UpdateAgentRef,
            agentId: agentId,
            agentName: agentName,
            description: description,
            logoUrl: logoUrl,
            customUrl: customUrl,
            huggingFaceApiKey: huggingFaceApiKey,
          ),
          from: updateAgentProvider,
          name: r'updateAgentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateAgentHash,
          dependencies: UpdateAgentFamily._dependencies,
          allTransitiveDependencies:
              UpdateAgentFamily._allTransitiveDependencies,
          agentId: agentId,
          agentName: agentName,
          description: description,
          logoUrl: logoUrl,
          customUrl: customUrl,
          huggingFaceApiKey: huggingFaceApiKey,
        );

  UpdateAgentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
    required this.agentName,
    required this.description,
    required this.logoUrl,
    required this.customUrl,
    required this.huggingFaceApiKey,
  }) : super.internal();

  final String agentId;
  final String? agentName;
  final String? description;
  final String? logoUrl;
  final String? customUrl;
  final String? huggingFaceApiKey;

  @override
  Override overrideWith(
    FutureOr<GymAgent> Function(UpdateAgentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateAgentProvider._internal(
        (ref) => create(ref as UpdateAgentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
        agentName: agentName,
        description: description,
        logoUrl: logoUrl,
        customUrl: customUrl,
        huggingFaceApiKey: huggingFaceApiKey,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GymAgent> createElement() {
    return _UpdateAgentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateAgentProvider &&
        other.agentId == agentId &&
        other.agentName == agentName &&
        other.description == description &&
        other.logoUrl == logoUrl &&
        other.customUrl == customUrl &&
        other.huggingFaceApiKey == huggingFaceApiKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);
    hash = _SystemHash.combine(hash, agentName.hashCode);
    hash = _SystemHash.combine(hash, description.hashCode);
    hash = _SystemHash.combine(hash, logoUrl.hashCode);
    hash = _SystemHash.combine(hash, customUrl.hashCode);
    hash = _SystemHash.combine(hash, huggingFaceApiKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateAgentRef on AutoDisposeFutureProviderRef<GymAgent> {
  /// The parameter `agentId` of this provider.
  String get agentId;

  /// The parameter `agentName` of this provider.
  String? get agentName;

  /// The parameter `description` of this provider.
  String? get description;

  /// The parameter `logoUrl` of this provider.
  String? get logoUrl;

  /// The parameter `customUrl` of this provider.
  String? get customUrl;

  /// The parameter `huggingFaceApiKey` of this provider.
  String? get huggingFaceApiKey;
}

class _UpdateAgentProviderElement
    extends AutoDisposeFutureProviderElement<GymAgent> with UpdateAgentRef {
  _UpdateAgentProviderElement(super.provider);

  @override
  String get agentId => (origin as UpdateAgentProvider).agentId;
  @override
  String? get agentName => (origin as UpdateAgentProvider).agentName;
  @override
  String? get description => (origin as UpdateAgentProvider).description;
  @override
  String? get logoUrl => (origin as UpdateAgentProvider).logoUrl;
  @override
  String? get customUrl => (origin as UpdateAgentProvider).customUrl;
  @override
  String? get huggingFaceApiKey =>
      (origin as UpdateAgentProvider).huggingFaceApiKey;
}

String _$deployAgentHash() => r'92931e26e16ddf35fbb2efa780d1a5d9738a4e99';

/// See also [deployAgent].
@ProviderFor(deployAgent)
const deployAgentProvider = DeployAgentFamily();

/// See also [deployAgent].
class DeployAgentFamily extends Family<AsyncValue<GymAgent>> {
  /// See also [deployAgent].
  const DeployAgentFamily();

  /// See also [deployAgent].
  DeployAgentProvider call(
    String agentId,
  ) {
    return DeployAgentProvider(
      agentId,
    );
  }

  @override
  DeployAgentProvider getProviderOverride(
    covariant DeployAgentProvider provider,
  ) {
    return call(
      provider.agentId,
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
  String? get name => r'deployAgentProvider';
}

/// See also [deployAgent].
class DeployAgentProvider extends AutoDisposeFutureProvider<GymAgent> {
  /// See also [deployAgent].
  DeployAgentProvider(
    String agentId,
  ) : this._internal(
          (ref) => deployAgent(
            ref as DeployAgentRef,
            agentId,
          ),
          from: deployAgentProvider,
          name: r'deployAgentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deployAgentHash,
          dependencies: DeployAgentFamily._dependencies,
          allTransitiveDependencies:
              DeployAgentFamily._allTransitiveDependencies,
          agentId: agentId,
        );

  DeployAgentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
  }) : super.internal();

  final String agentId;

  @override
  Override overrideWith(
    FutureOr<GymAgent> Function(DeployAgentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeployAgentProvider._internal(
        (ref) => create(ref as DeployAgentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GymAgent> createElement() {
    return _DeployAgentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeployAgentProvider && other.agentId == agentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeployAgentRef on AutoDisposeFutureProviderRef<GymAgent> {
  /// The parameter `agentId` of this provider.
  String get agentId;
}

class _DeployAgentProviderElement
    extends AutoDisposeFutureProviderElement<GymAgent> with DeployAgentRef {
  _DeployAgentProviderElement(super.provider);

  @override
  String get agentId => (origin as DeployAgentProvider).agentId;
}

String _$cancelDeploymentHash() => r'2468579c0a47a1fe2e0f6c686fbfb6bd8a3b5a0c';

/// See also [cancelDeployment].
@ProviderFor(cancelDeployment)
const cancelDeploymentProvider = CancelDeploymentFamily();

/// See also [cancelDeployment].
class CancelDeploymentFamily extends Family<AsyncValue<GymAgent>> {
  /// See also [cancelDeployment].
  const CancelDeploymentFamily();

  /// See also [cancelDeployment].
  CancelDeploymentProvider call(
    String agentId,
  ) {
    return CancelDeploymentProvider(
      agentId,
    );
  }

  @override
  CancelDeploymentProvider getProviderOverride(
    covariant CancelDeploymentProvider provider,
  ) {
    return call(
      provider.agentId,
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
  String? get name => r'cancelDeploymentProvider';
}

/// See also [cancelDeployment].
class CancelDeploymentProvider extends AutoDisposeFutureProvider<GymAgent> {
  /// See also [cancelDeployment].
  CancelDeploymentProvider(
    String agentId,
  ) : this._internal(
          (ref) => cancelDeployment(
            ref as CancelDeploymentRef,
            agentId,
          ),
          from: cancelDeploymentProvider,
          name: r'cancelDeploymentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cancelDeploymentHash,
          dependencies: CancelDeploymentFamily._dependencies,
          allTransitiveDependencies:
              CancelDeploymentFamily._allTransitiveDependencies,
          agentId: agentId,
        );

  CancelDeploymentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
  }) : super.internal();

  final String agentId;

  @override
  Override overrideWith(
    FutureOr<GymAgent> Function(CancelDeploymentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CancelDeploymentProvider._internal(
        (ref) => create(ref as CancelDeploymentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GymAgent> createElement() {
    return _CancelDeploymentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CancelDeploymentProvider && other.agentId == agentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CancelDeploymentRef on AutoDisposeFutureProviderRef<GymAgent> {
  /// The parameter `agentId` of this provider.
  String get agentId;
}

class _CancelDeploymentProviderElement
    extends AutoDisposeFutureProviderElement<GymAgent>
    with CancelDeploymentRef {
  _CancelDeploymentProviderElement(super.provider);

  @override
  String get agentId => (origin as CancelDeploymentProvider).agentId;
}

String _$retryDeploymentHash() => r'71c7cdf320da7268a2aba16dd68e872f018f91b3';

/// See also [retryDeployment].
@ProviderFor(retryDeployment)
const retryDeploymentProvider = RetryDeploymentFamily();

/// See also [retryDeployment].
class RetryDeploymentFamily extends Family<AsyncValue<GymAgent>> {
  /// See also [retryDeployment].
  const RetryDeploymentFamily();

  /// See also [retryDeployment].
  RetryDeploymentProvider call(
    String agentId,
  ) {
    return RetryDeploymentProvider(
      agentId,
    );
  }

  @override
  RetryDeploymentProvider getProviderOverride(
    covariant RetryDeploymentProvider provider,
  ) {
    return call(
      provider.agentId,
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
  String? get name => r'retryDeploymentProvider';
}

/// See also [retryDeployment].
class RetryDeploymentProvider extends AutoDisposeFutureProvider<GymAgent> {
  /// See also [retryDeployment].
  RetryDeploymentProvider(
    String agentId,
  ) : this._internal(
          (ref) => retryDeployment(
            ref as RetryDeploymentRef,
            agentId,
          ),
          from: retryDeploymentProvider,
          name: r'retryDeploymentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$retryDeploymentHash,
          dependencies: RetryDeploymentFamily._dependencies,
          allTransitiveDependencies:
              RetryDeploymentFamily._allTransitiveDependencies,
          agentId: agentId,
        );

  RetryDeploymentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
  }) : super.internal();

  final String agentId;

  @override
  Override overrideWith(
    FutureOr<GymAgent> Function(RetryDeploymentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RetryDeploymentProvider._internal(
        (ref) => create(ref as RetryDeploymentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GymAgent> createElement() {
    return _RetryDeploymentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RetryDeploymentProvider && other.agentId == agentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RetryDeploymentRef on AutoDisposeFutureProviderRef<GymAgent> {
  /// The parameter `agentId` of this provider.
  String get agentId;
}

class _RetryDeploymentProviderElement
    extends AutoDisposeFutureProviderElement<GymAgent> with RetryDeploymentRef {
  _RetryDeploymentProviderElement(super.provider);

  @override
  String get agentId => (origin as RetryDeploymentProvider).agentId;
}

String _$deactivateAgentHash() => r'b8ae99a898951422e20b938d18430de3090bcfc9';

/// See also [deactivateAgent].
@ProviderFor(deactivateAgent)
const deactivateAgentProvider = DeactivateAgentFamily();

/// See also [deactivateAgent].
class DeactivateAgentFamily extends Family<AsyncValue<GymAgent>> {
  /// See also [deactivateAgent].
  const DeactivateAgentFamily();

  /// See also [deactivateAgent].
  DeactivateAgentProvider call(
    String agentId,
  ) {
    return DeactivateAgentProvider(
      agentId,
    );
  }

  @override
  DeactivateAgentProvider getProviderOverride(
    covariant DeactivateAgentProvider provider,
  ) {
    return call(
      provider.agentId,
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
  String? get name => r'deactivateAgentProvider';
}

/// See also [deactivateAgent].
class DeactivateAgentProvider extends AutoDisposeFutureProvider<GymAgent> {
  /// See also [deactivateAgent].
  DeactivateAgentProvider(
    String agentId,
  ) : this._internal(
          (ref) => deactivateAgent(
            ref as DeactivateAgentRef,
            agentId,
          ),
          from: deactivateAgentProvider,
          name: r'deactivateAgentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deactivateAgentHash,
          dependencies: DeactivateAgentFamily._dependencies,
          allTransitiveDependencies:
              DeactivateAgentFamily._allTransitiveDependencies,
          agentId: agentId,
        );

  DeactivateAgentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
  }) : super.internal();

  final String agentId;

  @override
  Override overrideWith(
    FutureOr<GymAgent> Function(DeactivateAgentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeactivateAgentProvider._internal(
        (ref) => create(ref as DeactivateAgentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GymAgent> createElement() {
    return _DeactivateAgentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeactivateAgentProvider && other.agentId == agentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeactivateAgentRef on AutoDisposeFutureProviderRef<GymAgent> {
  /// The parameter `agentId` of this provider.
  String get agentId;
}

class _DeactivateAgentProviderElement
    extends AutoDisposeFutureProviderElement<GymAgent> with DeactivateAgentRef {
  _DeactivateAgentProviderElement(super.provider);

  @override
  String get agentId => (origin as DeactivateAgentProvider).agentId;
}

String _$archiveAgentHash() => r'e9d1b28af7043604ae7bb0146fb52eb2a51701b2';

/// See also [archiveAgent].
@ProviderFor(archiveAgent)
const archiveAgentProvider = ArchiveAgentFamily();

/// See also [archiveAgent].
class ArchiveAgentFamily extends Family<AsyncValue<GymAgent>> {
  /// See also [archiveAgent].
  const ArchiveAgentFamily();

  /// See also [archiveAgent].
  ArchiveAgentProvider call(
    String agentId,
  ) {
    return ArchiveAgentProvider(
      agentId,
    );
  }

  @override
  ArchiveAgentProvider getProviderOverride(
    covariant ArchiveAgentProvider provider,
  ) {
    return call(
      provider.agentId,
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
  String? get name => r'archiveAgentProvider';
}

/// See also [archiveAgent].
class ArchiveAgentProvider extends AutoDisposeFutureProvider<GymAgent> {
  /// See also [archiveAgent].
  ArchiveAgentProvider(
    String agentId,
  ) : this._internal(
          (ref) => archiveAgent(
            ref as ArchiveAgentRef,
            agentId,
          ),
          from: archiveAgentProvider,
          name: r'archiveAgentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$archiveAgentHash,
          dependencies: ArchiveAgentFamily._dependencies,
          allTransitiveDependencies:
              ArchiveAgentFamily._allTransitiveDependencies,
          agentId: agentId,
        );

  ArchiveAgentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
  }) : super.internal();

  final String agentId;

  @override
  Override overrideWith(
    FutureOr<GymAgent> Function(ArchiveAgentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ArchiveAgentProvider._internal(
        (ref) => create(ref as ArchiveAgentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GymAgent> createElement() {
    return _ArchiveAgentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArchiveAgentProvider && other.agentId == agentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ArchiveAgentRef on AutoDisposeFutureProviderRef<GymAgent> {
  /// The parameter `agentId` of this provider.
  String get agentId;
}

class _ArchiveAgentProviderElement
    extends AutoDisposeFutureProviderElement<GymAgent> with ArchiveAgentRef {
  _ArchiveAgentProviderElement(super.provider);

  @override
  String get agentId => (origin as ArchiveAgentProvider).agentId;
}

String _$getUnsignedTransactionHash() =>
    r'5d6d10ceb0bbdca21eb034474747ec24cf36dcae';

/// See also [getUnsignedTransaction].
@ProviderFor(getUnsignedTransaction)
const getUnsignedTransactionProvider = GetUnsignedTransactionFamily();

/// See also [getUnsignedTransaction].
class GetUnsignedTransactionFamily
    extends Family<AsyncValue<UnsignedTransaction>> {
  /// See also [getUnsignedTransaction].
  const GetUnsignedTransactionFamily();

  /// See also [getUnsignedTransaction].
  GetUnsignedTransactionProvider call({
    required String agentId,
    required AgentTransactionType type,
  }) {
    return GetUnsignedTransactionProvider(
      agentId: agentId,
      type: type,
    );
  }

  @override
  GetUnsignedTransactionProvider getProviderOverride(
    covariant GetUnsignedTransactionProvider provider,
  ) {
    return call(
      agentId: provider.agentId,
      type: provider.type,
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
  String? get name => r'getUnsignedTransactionProvider';
}

/// See also [getUnsignedTransaction].
class GetUnsignedTransactionProvider
    extends AutoDisposeFutureProvider<UnsignedTransaction> {
  /// See also [getUnsignedTransaction].
  GetUnsignedTransactionProvider({
    required String agentId,
    required AgentTransactionType type,
  }) : this._internal(
          (ref) => getUnsignedTransaction(
            ref as GetUnsignedTransactionRef,
            agentId: agentId,
            type: type,
          ),
          from: getUnsignedTransactionProvider,
          name: r'getUnsignedTransactionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUnsignedTransactionHash,
          dependencies: GetUnsignedTransactionFamily._dependencies,
          allTransitiveDependencies:
              GetUnsignedTransactionFamily._allTransitiveDependencies,
          agentId: agentId,
          type: type,
        );

  GetUnsignedTransactionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
    required this.type,
  }) : super.internal();

  final String agentId;
  final AgentTransactionType type;

  @override
  Override overrideWith(
    FutureOr<UnsignedTransaction> Function(GetUnsignedTransactionRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUnsignedTransactionProvider._internal(
        (ref) => create(ref as GetUnsignedTransactionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UnsignedTransaction> createElement() {
    return _GetUnsignedTransactionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUnsignedTransactionProvider &&
        other.agentId == agentId &&
        other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetUnsignedTransactionRef
    on AutoDisposeFutureProviderRef<UnsignedTransaction> {
  /// The parameter `agentId` of this provider.
  String get agentId;

  /// The parameter `type` of this provider.
  AgentTransactionType get type;
}

class _GetUnsignedTransactionProviderElement
    extends AutoDisposeFutureProviderElement<UnsignedTransaction>
    with GetUnsignedTransactionRef {
  _GetUnsignedTransactionProviderElement(super.provider);

  @override
  String get agentId => (origin as GetUnsignedTransactionProvider).agentId;
  @override
  AgentTransactionType get type =>
      (origin as GetUnsignedTransactionProvider).type;
}

String _$submitTransactionHash() => r'9f6f33bffac2be23877afcb0caa6efb894e3c32c';

/// See also [submitTransaction].
@ProviderFor(submitTransaction)
const submitTransactionProvider = SubmitTransactionFamily();

/// See also [submitTransaction].
class SubmitTransactionFamily extends Family<AsyncValue<SubmitTxResponse>> {
  /// See also [submitTransaction].
  const SubmitTransactionFamily();

  /// See also [submitTransaction].
  SubmitTransactionProvider call({
    required String agentId,
    required AgentTransactionType type,
    required String signedTransaction,
    required String idempotencyKey,
  }) {
    return SubmitTransactionProvider(
      agentId: agentId,
      type: type,
      signedTransaction: signedTransaction,
      idempotencyKey: idempotencyKey,
    );
  }

  @override
  SubmitTransactionProvider getProviderOverride(
    covariant SubmitTransactionProvider provider,
  ) {
    return call(
      agentId: provider.agentId,
      type: provider.type,
      signedTransaction: provider.signedTransaction,
      idempotencyKey: provider.idempotencyKey,
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
  String? get name => r'submitTransactionProvider';
}

/// See also [submitTransaction].
class SubmitTransactionProvider
    extends AutoDisposeFutureProvider<SubmitTxResponse> {
  /// See also [submitTransaction].
  SubmitTransactionProvider({
    required String agentId,
    required AgentTransactionType type,
    required String signedTransaction,
    required String idempotencyKey,
  }) : this._internal(
          (ref) => submitTransaction(
            ref as SubmitTransactionRef,
            agentId: agentId,
            type: type,
            signedTransaction: signedTransaction,
            idempotencyKey: idempotencyKey,
          ),
          from: submitTransactionProvider,
          name: r'submitTransactionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submitTransactionHash,
          dependencies: SubmitTransactionFamily._dependencies,
          allTransitiveDependencies:
              SubmitTransactionFamily._allTransitiveDependencies,
          agentId: agentId,
          type: type,
          signedTransaction: signedTransaction,
          idempotencyKey: idempotencyKey,
        );

  SubmitTransactionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
    required this.type,
    required this.signedTransaction,
    required this.idempotencyKey,
  }) : super.internal();

  final String agentId;
  final AgentTransactionType type;
  final String signedTransaction;
  final String idempotencyKey;

  @override
  Override overrideWith(
    FutureOr<SubmitTxResponse> Function(SubmitTransactionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmitTransactionProvider._internal(
        (ref) => create(ref as SubmitTransactionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
        type: type,
        signedTransaction: signedTransaction,
        idempotencyKey: idempotencyKey,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SubmitTxResponse> createElement() {
    return _SubmitTransactionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmitTransactionProvider &&
        other.agentId == agentId &&
        other.type == type &&
        other.signedTransaction == signedTransaction &&
        other.idempotencyKey == idempotencyKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, signedTransaction.hashCode);
    hash = _SystemHash.combine(hash, idempotencyKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SubmitTransactionRef on AutoDisposeFutureProviderRef<SubmitTxResponse> {
  /// The parameter `agentId` of this provider.
  String get agentId;

  /// The parameter `type` of this provider.
  AgentTransactionType get type;

  /// The parameter `signedTransaction` of this provider.
  String get signedTransaction;

  /// The parameter `idempotencyKey` of this provider.
  String get idempotencyKey;
}

class _SubmitTransactionProviderElement
    extends AutoDisposeFutureProviderElement<SubmitTxResponse>
    with SubmitTransactionRef {
  _SubmitTransactionProviderElement(super.provider);

  @override
  String get agentId => (origin as SubmitTransactionProvider).agentId;
  @override
  AgentTransactionType get type => (origin as SubmitTransactionProvider).type;
  @override
  String get signedTransaction =>
      (origin as SubmitTransactionProvider).signedTransaction;
  @override
  String get idempotencyKey =>
      (origin as SubmitTransactionProvider).idempotencyKey;
}

String _$addAgentVersionHash() => r'a2265e80cc6271efd3238761518dc363127221d8';

/// See also [addAgentVersion].
@ProviderFor(addAgentVersion)
const addAgentVersionProvider = AddAgentVersionFamily();

/// See also [addAgentVersion].
class AddAgentVersionFamily extends Family<AsyncValue<GymAgent>> {
  /// See also [addAgentVersion].
  const AddAgentVersionFamily();

  /// See also [addAgentVersion].
  AddAgentVersionProvider call({
    required String agentId,
    required String versionTag,
    String? customUrl,
    String? huggingFaceApiKey,
  }) {
    return AddAgentVersionProvider(
      agentId: agentId,
      versionTag: versionTag,
      customUrl: customUrl,
      huggingFaceApiKey: huggingFaceApiKey,
    );
  }

  @override
  AddAgentVersionProvider getProviderOverride(
    covariant AddAgentVersionProvider provider,
  ) {
    return call(
      agentId: provider.agentId,
      versionTag: provider.versionTag,
      customUrl: provider.customUrl,
      huggingFaceApiKey: provider.huggingFaceApiKey,
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
  String? get name => r'addAgentVersionProvider';
}

/// See also [addAgentVersion].
class AddAgentVersionProvider extends AutoDisposeFutureProvider<GymAgent> {
  /// See also [addAgentVersion].
  AddAgentVersionProvider({
    required String agentId,
    required String versionTag,
    String? customUrl,
    String? huggingFaceApiKey,
  }) : this._internal(
          (ref) => addAgentVersion(
            ref as AddAgentVersionRef,
            agentId: agentId,
            versionTag: versionTag,
            customUrl: customUrl,
            huggingFaceApiKey: huggingFaceApiKey,
          ),
          from: addAgentVersionProvider,
          name: r'addAgentVersionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addAgentVersionHash,
          dependencies: AddAgentVersionFamily._dependencies,
          allTransitiveDependencies:
              AddAgentVersionFamily._allTransitiveDependencies,
          agentId: agentId,
          versionTag: versionTag,
          customUrl: customUrl,
          huggingFaceApiKey: huggingFaceApiKey,
        );

  AddAgentVersionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
    required this.versionTag,
    required this.customUrl,
    required this.huggingFaceApiKey,
  }) : super.internal();

  final String agentId;
  final String versionTag;
  final String? customUrl;
  final String? huggingFaceApiKey;

  @override
  Override overrideWith(
    FutureOr<GymAgent> Function(AddAgentVersionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddAgentVersionProvider._internal(
        (ref) => create(ref as AddAgentVersionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
        versionTag: versionTag,
        customUrl: customUrl,
        huggingFaceApiKey: huggingFaceApiKey,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GymAgent> createElement() {
    return _AddAgentVersionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddAgentVersionProvider &&
        other.agentId == agentId &&
        other.versionTag == versionTag &&
        other.customUrl == customUrl &&
        other.huggingFaceApiKey == huggingFaceApiKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);
    hash = _SystemHash.combine(hash, versionTag.hashCode);
    hash = _SystemHash.combine(hash, customUrl.hashCode);
    hash = _SystemHash.combine(hash, huggingFaceApiKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddAgentVersionRef on AutoDisposeFutureProviderRef<GymAgent> {
  /// The parameter `agentId` of this provider.
  String get agentId;

  /// The parameter `versionTag` of this provider.
  String get versionTag;

  /// The parameter `customUrl` of this provider.
  String? get customUrl;

  /// The parameter `huggingFaceApiKey` of this provider.
  String? get huggingFaceApiKey;
}

class _AddAgentVersionProviderElement
    extends AutoDisposeFutureProviderElement<GymAgent> with AddAgentVersionRef {
  _AddAgentVersionProviderElement(super.provider);

  @override
  String get agentId => (origin as AddAgentVersionProvider).agentId;
  @override
  String get versionTag => (origin as AddAgentVersionProvider).versionTag;
  @override
  String? get customUrl => (origin as AddAgentVersionProvider).customUrl;
  @override
  String? get huggingFaceApiKey =>
      (origin as AddAgentVersionProvider).huggingFaceApiKey;
}

String _$setActiveVersionHash() => r'0c3e4a145adea4ec364d1280774152eb5fe938b2';

/// See also [setActiveVersion].
@ProviderFor(setActiveVersion)
const setActiveVersionProvider = SetActiveVersionFamily();

/// See also [setActiveVersion].
class SetActiveVersionFamily extends Family<AsyncValue<GymAgent>> {
  /// See also [setActiveVersion].
  const SetActiveVersionFamily();

  /// See also [setActiveVersion].
  SetActiveVersionProvider call({
    required String agentId,
    required String versionTag,
  }) {
    return SetActiveVersionProvider(
      agentId: agentId,
      versionTag: versionTag,
    );
  }

  @override
  SetActiveVersionProvider getProviderOverride(
    covariant SetActiveVersionProvider provider,
  ) {
    return call(
      agentId: provider.agentId,
      versionTag: provider.versionTag,
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
  String? get name => r'setActiveVersionProvider';
}

/// See also [setActiveVersion].
class SetActiveVersionProvider extends AutoDisposeFutureProvider<GymAgent> {
  /// See also [setActiveVersion].
  SetActiveVersionProvider({
    required String agentId,
    required String versionTag,
  }) : this._internal(
          (ref) => setActiveVersion(
            ref as SetActiveVersionRef,
            agentId: agentId,
            versionTag: versionTag,
          ),
          from: setActiveVersionProvider,
          name: r'setActiveVersionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setActiveVersionHash,
          dependencies: SetActiveVersionFamily._dependencies,
          allTransitiveDependencies:
              SetActiveVersionFamily._allTransitiveDependencies,
          agentId: agentId,
          versionTag: versionTag,
        );

  SetActiveVersionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
    required this.versionTag,
  }) : super.internal();

  final String agentId;
  final String versionTag;

  @override
  Override overrideWith(
    FutureOr<GymAgent> Function(SetActiveVersionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetActiveVersionProvider._internal(
        (ref) => create(ref as SetActiveVersionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
        versionTag: versionTag,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GymAgent> createElement() {
    return _SetActiveVersionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetActiveVersionProvider &&
        other.agentId == agentId &&
        other.versionTag == versionTag;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);
    hash = _SystemHash.combine(hash, versionTag.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SetActiveVersionRef on AutoDisposeFutureProviderRef<GymAgent> {
  /// The parameter `agentId` of this provider.
  String get agentId;

  /// The parameter `versionTag` of this provider.
  String get versionTag;
}

class _SetActiveVersionProviderElement
    extends AutoDisposeFutureProviderElement<GymAgent>
    with SetActiveVersionRef {
  _SetActiveVersionProviderElement(super.provider);

  @override
  String get agentId => (origin as SetActiveVersionProvider).agentId;
  @override
  String get versionTag => (origin as SetActiveVersionProvider).versionTag;
}

String _$getAgentHealthHash() => r'44e906499c987e0f3f8f62e9ab93f678fe545c8d';

/// See also [getAgentHealth].
@ProviderFor(getAgentHealth)
const getAgentHealthProvider = GetAgentHealthFamily();

/// See also [getAgentHealth].
class GetAgentHealthFamily extends Family<AsyncValue<AgentHealth>> {
  /// See also [getAgentHealth].
  const GetAgentHealthFamily();

  /// See also [getAgentHealth].
  GetAgentHealthProvider call(
    String agentId,
  ) {
    return GetAgentHealthProvider(
      agentId,
    );
  }

  @override
  GetAgentHealthProvider getProviderOverride(
    covariant GetAgentHealthProvider provider,
  ) {
    return call(
      provider.agentId,
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
  String? get name => r'getAgentHealthProvider';
}

/// See also [getAgentHealth].
class GetAgentHealthProvider extends AutoDisposeFutureProvider<AgentHealth> {
  /// See also [getAgentHealth].
  GetAgentHealthProvider(
    String agentId,
  ) : this._internal(
          (ref) => getAgentHealth(
            ref as GetAgentHealthRef,
            agentId,
          ),
          from: getAgentHealthProvider,
          name: r'getAgentHealthProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAgentHealthHash,
          dependencies: GetAgentHealthFamily._dependencies,
          allTransitiveDependencies:
              GetAgentHealthFamily._allTransitiveDependencies,
          agentId: agentId,
        );

  GetAgentHealthProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
  }) : super.internal();

  final String agentId;

  @override
  Override overrideWith(
    FutureOr<AgentHealth> Function(GetAgentHealthRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAgentHealthProvider._internal(
        (ref) => create(ref as GetAgentHealthRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AgentHealth> createElement() {
    return _GetAgentHealthProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAgentHealthProvider && other.agentId == agentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAgentHealthRef on AutoDisposeFutureProviderRef<AgentHealth> {
  /// The parameter `agentId` of this provider.
  String get agentId;
}

class _GetAgentHealthProviderElement
    extends AutoDisposeFutureProviderElement<AgentHealth>
    with GetAgentHealthRef {
  _GetAgentHealthProviderElement(super.provider);

  @override
  String get agentId => (origin as GetAgentHealthProvider).agentId;
}

String _$getAgentMetricsHash() => r'9416f405faec4600f2847fac83e7abb56ed57be8';

/// See also [getAgentMetrics].
@ProviderFor(getAgentMetrics)
const getAgentMetricsProvider = GetAgentMetricsFamily();

/// See also [getAgentMetrics].
class GetAgentMetricsFamily extends Family<AsyncValue<AgentMetrics>> {
  /// See also [getAgentMetrics].
  const GetAgentMetricsFamily();

  /// See also [getAgentMetrics].
  GetAgentMetricsProvider call({
    required String agentId,
    String? timeframe,
    String? versionTag,
  }) {
    return GetAgentMetricsProvider(
      agentId: agentId,
      timeframe: timeframe,
      versionTag: versionTag,
    );
  }

  @override
  GetAgentMetricsProvider getProviderOverride(
    covariant GetAgentMetricsProvider provider,
  ) {
    return call(
      agentId: provider.agentId,
      timeframe: provider.timeframe,
      versionTag: provider.versionTag,
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
  String? get name => r'getAgentMetricsProvider';
}

/// See also [getAgentMetrics].
class GetAgentMetricsProvider extends AutoDisposeFutureProvider<AgentMetrics> {
  /// See also [getAgentMetrics].
  GetAgentMetricsProvider({
    required String agentId,
    String? timeframe,
    String? versionTag,
  }) : this._internal(
          (ref) => getAgentMetrics(
            ref as GetAgentMetricsRef,
            agentId: agentId,
            timeframe: timeframe,
            versionTag: versionTag,
          ),
          from: getAgentMetricsProvider,
          name: r'getAgentMetricsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAgentMetricsHash,
          dependencies: GetAgentMetricsFamily._dependencies,
          allTransitiveDependencies:
              GetAgentMetricsFamily._allTransitiveDependencies,
          agentId: agentId,
          timeframe: timeframe,
          versionTag: versionTag,
        );

  GetAgentMetricsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
    required this.timeframe,
    required this.versionTag,
  }) : super.internal();

  final String agentId;
  final String? timeframe;
  final String? versionTag;

  @override
  Override overrideWith(
    FutureOr<AgentMetrics> Function(GetAgentMetricsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAgentMetricsProvider._internal(
        (ref) => create(ref as GetAgentMetricsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
        timeframe: timeframe,
        versionTag: versionTag,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AgentMetrics> createElement() {
    return _GetAgentMetricsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAgentMetricsProvider &&
        other.agentId == agentId &&
        other.timeframe == timeframe &&
        other.versionTag == versionTag;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);
    hash = _SystemHash.combine(hash, timeframe.hashCode);
    hash = _SystemHash.combine(hash, versionTag.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAgentMetricsRef on AutoDisposeFutureProviderRef<AgentMetrics> {
  /// The parameter `agentId` of this provider.
  String get agentId;

  /// The parameter `timeframe` of this provider.
  String? get timeframe;

  /// The parameter `versionTag` of this provider.
  String? get versionTag;
}

class _GetAgentMetricsProviderElement
    extends AutoDisposeFutureProviderElement<AgentMetrics>
    with GetAgentMetricsRef {
  _GetAgentMetricsProviderElement(super.provider);

  @override
  String get agentId => (origin as GetAgentMetricsProvider).agentId;
  @override
  String? get timeframe => (origin as GetAgentMetricsProvider).timeframe;
  @override
  String? get versionTag => (origin as GetAgentMetricsProvider).versionTag;
}

String _$searchAgentsHash() => r'41770be0b280acc6014f25d1c3388b32454be854';

/// See also [searchAgents].
@ProviderFor(searchAgents)
const searchAgentsProvider = SearchAgentsFamily();

/// See also [searchAgents].
class SearchAgentsFamily extends Family<AsyncValue<AgentSearchResponse>> {
  /// See also [searchAgents].
  const SearchAgentsFamily();

  /// See also [searchAgents].
  SearchAgentsProvider call({
    String? query,
    String? sortBy,
    int? limit,
    int? offset,
  }) {
    return SearchAgentsProvider(
      query: query,
      sortBy: sortBy,
      limit: limit,
      offset: offset,
    );
  }

  @override
  SearchAgentsProvider getProviderOverride(
    covariant SearchAgentsProvider provider,
  ) {
    return call(
      query: provider.query,
      sortBy: provider.sortBy,
      limit: provider.limit,
      offset: provider.offset,
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
  String? get name => r'searchAgentsProvider';
}

/// See also [searchAgents].
class SearchAgentsProvider
    extends AutoDisposeFutureProvider<AgentSearchResponse> {
  /// See also [searchAgents].
  SearchAgentsProvider({
    String? query,
    String? sortBy,
    int? limit,
    int? offset,
  }) : this._internal(
          (ref) => searchAgents(
            ref as SearchAgentsRef,
            query: query,
            sortBy: sortBy,
            limit: limit,
            offset: offset,
          ),
          from: searchAgentsProvider,
          name: r'searchAgentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchAgentsHash,
          dependencies: SearchAgentsFamily._dependencies,
          allTransitiveDependencies:
              SearchAgentsFamily._allTransitiveDependencies,
          query: query,
          sortBy: sortBy,
          limit: limit,
          offset: offset,
        );

  SearchAgentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
    required this.sortBy,
    required this.limit,
    required this.offset,
  }) : super.internal();

  final String? query;
  final String? sortBy;
  final int? limit;
  final int? offset;

  @override
  Override overrideWith(
    FutureOr<AgentSearchResponse> Function(SearchAgentsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchAgentsProvider._internal(
        (ref) => create(ref as SearchAgentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
        sortBy: sortBy,
        limit: limit,
        offset: offset,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AgentSearchResponse> createElement() {
    return _SearchAgentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchAgentsProvider &&
        other.query == query &&
        other.sortBy == sortBy &&
        other.limit == limit &&
        other.offset == offset;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);
    hash = _SystemHash.combine(hash, sortBy.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, offset.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchAgentsRef on AutoDisposeFutureProviderRef<AgentSearchResponse> {
  /// The parameter `query` of this provider.
  String? get query;

  /// The parameter `sortBy` of this provider.
  String? get sortBy;

  /// The parameter `limit` of this provider.
  int? get limit;

  /// The parameter `offset` of this provider.
  int? get offset;
}

class _SearchAgentsProviderElement
    extends AutoDisposeFutureProviderElement<AgentSearchResponse>
    with SearchAgentsRef {
  _SearchAgentsProviderElement(super.provider);

  @override
  String? get query => (origin as SearchAgentsProvider).query;
  @override
  String? get sortBy => (origin as SearchAgentsProvider).sortBy;
  @override
  int? get limit => (origin as SearchAgentsProvider).limit;
  @override
  int? get offset => (origin as SearchAgentsProvider).offset;
}

String _$agentSocketServiceHash() =>
    r'5312d87c30762178d00d063da0269a3d617d4879';

/// See also [agentSocketService].
@ProviderFor(agentSocketService)
final agentSocketServiceProvider = Provider<AgentSocketService>.internal(
  agentSocketService,
  name: r'agentSocketServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$agentSocketServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AgentSocketServiceRef = ProviderRef<AgentSocketService>;
String _$agentUpdatesHash() => r'c8faad389bd926b12b8afc3076f914f3c9490f4b';

/// See also [agentUpdates].
@ProviderFor(agentUpdates)
const agentUpdatesProvider = AgentUpdatesFamily();

/// See also [agentUpdates].
class AgentUpdatesFamily extends Family<AsyncValue<AgentSocketMessage>> {
  /// See also [agentUpdates].
  const AgentUpdatesFamily();

  /// See also [agentUpdates].
  AgentUpdatesProvider call(
    String agentId,
  ) {
    return AgentUpdatesProvider(
      agentId,
    );
  }

  @override
  AgentUpdatesProvider getProviderOverride(
    covariant AgentUpdatesProvider provider,
  ) {
    return call(
      provider.agentId,
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
  String? get name => r'agentUpdatesProvider';
}

/// See also [agentUpdates].
class AgentUpdatesProvider
    extends AutoDisposeStreamProvider<AgentSocketMessage> {
  /// See also [agentUpdates].
  AgentUpdatesProvider(
    String agentId,
  ) : this._internal(
          (ref) => agentUpdates(
            ref as AgentUpdatesRef,
            agentId,
          ),
          from: agentUpdatesProvider,
          name: r'agentUpdatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$agentUpdatesHash,
          dependencies: AgentUpdatesFamily._dependencies,
          allTransitiveDependencies:
              AgentUpdatesFamily._allTransitiveDependencies,
          agentId: agentId,
        );

  AgentUpdatesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
  }) : super.internal();

  final String agentId;

  @override
  Override overrideWith(
    Stream<AgentSocketMessage> Function(AgentUpdatesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AgentUpdatesProvider._internal(
        (ref) => create(ref as AgentUpdatesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<AgentSocketMessage> createElement() {
    return _AgentUpdatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AgentUpdatesProvider && other.agentId == agentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AgentUpdatesRef on AutoDisposeStreamProviderRef<AgentSocketMessage> {
  /// The parameter `agentId` of this provider.
  String get agentId;
}

class _AgentUpdatesProviderElement
    extends AutoDisposeStreamProviderElement<AgentSocketMessage>
    with AgentUpdatesRef {
  _AgentUpdatesProviderElement(super.provider);

  @override
  String get agentId => (origin as AgentUpdatesProvider).agentId;
}

String _$agentByPoolIdHash() => r'4b9459a4cafea0e1017b901e91f017b0e7a77a23';

/// See also [agentByPoolId].
@ProviderFor(agentByPoolId)
const agentByPoolIdProvider = AgentByPoolIdFamily();

/// See also [agentByPoolId].
class AgentByPoolIdFamily extends Family<AsyncValue<GymAgent?>> {
  /// See also [agentByPoolId].
  const AgentByPoolIdFamily();

  /// See also [agentByPoolId].
  AgentByPoolIdProvider call(
    String poolId,
  ) {
    return AgentByPoolIdProvider(
      poolId,
    );
  }

  @override
  AgentByPoolIdProvider getProviderOverride(
    covariant AgentByPoolIdProvider provider,
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
  String? get name => r'agentByPoolIdProvider';
}

/// See also [agentByPoolId].
class AgentByPoolIdProvider extends AutoDisposeFutureProvider<GymAgent?> {
  /// See also [agentByPoolId].
  AgentByPoolIdProvider(
    String poolId,
  ) : this._internal(
          (ref) => agentByPoolId(
            ref as AgentByPoolIdRef,
            poolId,
          ),
          from: agentByPoolIdProvider,
          name: r'agentByPoolIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$agentByPoolIdHash,
          dependencies: AgentByPoolIdFamily._dependencies,
          allTransitiveDependencies:
              AgentByPoolIdFamily._allTransitiveDependencies,
          poolId: poolId,
        );

  AgentByPoolIdProvider._internal(
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
    FutureOr<GymAgent?> Function(AgentByPoolIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AgentByPoolIdProvider._internal(
        (ref) => create(ref as AgentByPoolIdRef),
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
  AutoDisposeFutureProviderElement<GymAgent?> createElement() {
    return _AgentByPoolIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AgentByPoolIdProvider && other.poolId == poolId;
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
mixin AgentByPoolIdRef on AutoDisposeFutureProviderRef<GymAgent?> {
  /// The parameter `poolId` of this provider.
  String get poolId;
}

class _AgentByPoolIdProviderElement
    extends AutoDisposeFutureProviderElement<GymAgent?> with AgentByPoolIdRef {
  _AgentByPoolIdProviderElement(super.provider);

  @override
  String get poolId => (origin as AgentByPoolIdProvider).poolId;
}

String _$initiateDeploymentHash() =>
    r'92690da703326d2c2ba36f112ca808b293184018';

/// See also [initiateDeployment].
@ProviderFor(initiateDeployment)
const initiateDeploymentProvider = InitiateDeploymentFamily();

/// See also [initiateDeployment].
class InitiateDeploymentFamily extends Family<AsyncValue<GymAgent>> {
  /// See also [initiateDeployment].
  const InitiateDeploymentFamily();

  /// See also [initiateDeployment].
  InitiateDeploymentProvider call(
    String agentId,
  ) {
    return InitiateDeploymentProvider(
      agentId,
    );
  }

  @override
  InitiateDeploymentProvider getProviderOverride(
    covariant InitiateDeploymentProvider provider,
  ) {
    return call(
      provider.agentId,
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
  String? get name => r'initiateDeploymentProvider';
}

/// See also [initiateDeployment].
class InitiateDeploymentProvider extends AutoDisposeFutureProvider<GymAgent> {
  /// See also [initiateDeployment].
  InitiateDeploymentProvider(
    String agentId,
  ) : this._internal(
          (ref) => initiateDeployment(
            ref as InitiateDeploymentRef,
            agentId,
          ),
          from: initiateDeploymentProvider,
          name: r'initiateDeploymentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$initiateDeploymentHash,
          dependencies: InitiateDeploymentFamily._dependencies,
          allTransitiveDependencies:
              InitiateDeploymentFamily._allTransitiveDependencies,
          agentId: agentId,
        );

  InitiateDeploymentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
  }) : super.internal();

  final String agentId;

  @override
  Override overrideWith(
    FutureOr<GymAgent> Function(InitiateDeploymentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InitiateDeploymentProvider._internal(
        (ref) => create(ref as InitiateDeploymentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GymAgent> createElement() {
    return _InitiateDeploymentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InitiateDeploymentProvider && other.agentId == agentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InitiateDeploymentRef on AutoDisposeFutureProviderRef<GymAgent> {
  /// The parameter `agentId` of this provider.
  String get agentId;
}

class _InitiateDeploymentProviderElement
    extends AutoDisposeFutureProviderElement<GymAgent>
    with InitiateDeploymentRef {
  _InitiateDeploymentProviderElement(super.provider);

  @override
  String get agentId => (origin as InitiateDeploymentProvider).agentId;
}

String _$retryAgentDeploymentHash() =>
    r'2482153f1f45621779089cabc6ac65318778c48b';

/// See also [retryAgentDeployment].
@ProviderFor(retryAgentDeployment)
const retryAgentDeploymentProvider = RetryAgentDeploymentFamily();

/// See also [retryAgentDeployment].
class RetryAgentDeploymentFamily extends Family<AsyncValue<GymAgent>> {
  /// See also [retryAgentDeployment].
  const RetryAgentDeploymentFamily();

  /// See also [retryAgentDeployment].
  RetryAgentDeploymentProvider call(
    String agentId,
  ) {
    return RetryAgentDeploymentProvider(
      agentId,
    );
  }

  @override
  RetryAgentDeploymentProvider getProviderOverride(
    covariant RetryAgentDeploymentProvider provider,
  ) {
    return call(
      provider.agentId,
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
  String? get name => r'retryAgentDeploymentProvider';
}

/// See also [retryAgentDeployment].
class RetryAgentDeploymentProvider extends AutoDisposeFutureProvider<GymAgent> {
  /// See also [retryAgentDeployment].
  RetryAgentDeploymentProvider(
    String agentId,
  ) : this._internal(
          (ref) => retryAgentDeployment(
            ref as RetryAgentDeploymentRef,
            agentId,
          ),
          from: retryAgentDeploymentProvider,
          name: r'retryAgentDeploymentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$retryAgentDeploymentHash,
          dependencies: RetryAgentDeploymentFamily._dependencies,
          allTransitiveDependencies:
              RetryAgentDeploymentFamily._allTransitiveDependencies,
          agentId: agentId,
        );

  RetryAgentDeploymentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
  }) : super.internal();

  final String agentId;

  @override
  Override overrideWith(
    FutureOr<GymAgent> Function(RetryAgentDeploymentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RetryAgentDeploymentProvider._internal(
        (ref) => create(ref as RetryAgentDeploymentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GymAgent> createElement() {
    return _RetryAgentDeploymentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RetryAgentDeploymentProvider && other.agentId == agentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RetryAgentDeploymentRef on AutoDisposeFutureProviderRef<GymAgent> {
  /// The parameter `agentId` of this provider.
  String get agentId;
}

class _RetryAgentDeploymentProviderElement
    extends AutoDisposeFutureProviderElement<GymAgent>
    with RetryAgentDeploymentRef {
  _RetryAgentDeploymentProviderElement(super.provider);

  @override
  String get agentId => (origin as RetryAgentDeploymentProvider).agentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
