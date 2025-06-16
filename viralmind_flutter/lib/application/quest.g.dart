// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questRepositoryHash() => r'20772bbe8143add35d22a5bf9a0a76ef692af27e';

/// See also [questRepository].
@ProviderFor(questRepository)
final questRepositoryProvider =
    AutoDisposeProvider<QuestRepositoryImpl>.internal(
  questRepository,
  name: r'questRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$questRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef QuestRepositoryRef = AutoDisposeProviderRef<QuestRepositoryImpl>;
String _$generateQuestHash() => r'48941140f7d6eabcc953b251d17943e82fe0f478';

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

/// See also [generateQuest].
@ProviderFor(generateQuest)
const generateQuestProvider = GenerateQuestFamily();

/// See also [generateQuest].
class GenerateQuestFamily extends Family<AsyncValue<Quest>> {
  /// See also [generateQuest].
  const GenerateQuestFamily();

  /// See also [generateQuest].
  GenerateQuestProvider call({
    required String prompt,
    required String address,
    String? poolId,
    String? taskId,
  }) {
    return GenerateQuestProvider(
      prompt: prompt,
      address: address,
      poolId: poolId,
      taskId: taskId,
    );
  }

  @override
  GenerateQuestProvider getProviderOverride(
    covariant GenerateQuestProvider provider,
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
  String? get name => r'generateQuestProvider';
}

/// See also [generateQuest].
class GenerateQuestProvider extends AutoDisposeFutureProvider<Quest> {
  /// See also [generateQuest].
  GenerateQuestProvider({
    required String prompt,
    required String address,
    String? poolId,
    String? taskId,
  }) : this._internal(
          (ref) => generateQuest(
            ref as GenerateQuestRef,
            prompt: prompt,
            address: address,
            poolId: poolId,
            taskId: taskId,
          ),
          from: generateQuestProvider,
          name: r'generateQuestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$generateQuestHash,
          dependencies: GenerateQuestFamily._dependencies,
          allTransitiveDependencies:
              GenerateQuestFamily._allTransitiveDependencies,
          prompt: prompt,
          address: address,
          poolId: poolId,
          taskId: taskId,
        );

  GenerateQuestProvider._internal(
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
    FutureOr<Quest> Function(GenerateQuestRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GenerateQuestProvider._internal(
        (ref) => create(ref as GenerateQuestRef),
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
  AutoDisposeFutureProviderElement<Quest> createElement() {
    return _GenerateQuestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GenerateQuestProvider &&
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
mixin GenerateQuestRef on AutoDisposeFutureProviderRef<Quest> {
  /// The parameter `prompt` of this provider.
  String get prompt;

  /// The parameter `address` of this provider.
  String get address;

  /// The parameter `poolId` of this provider.
  String? get poolId;

  /// The parameter `taskId` of this provider.
  String? get taskId;
}

class _GenerateQuestProviderElement
    extends AutoDisposeFutureProviderElement<Quest> with GenerateQuestRef {
  _GenerateQuestProviderElement(super.provider);

  @override
  String get prompt => (origin as GenerateQuestProvider).prompt;
  @override
  String get address => (origin as GenerateQuestProvider).address;
  @override
  String? get poolId => (origin as GenerateQuestProvider).poolId;
  @override
  String? get taskId => (origin as GenerateQuestProvider).taskId;
}

String _$checkQuestProgressHash() =>
    r'469c184027086872adb276cdf8019e6f83d46ad9';

/// See also [checkQuestProgress].
@ProviderFor(checkQuestProgress)
const checkQuestProgressProvider = CheckQuestProgressFamily();

/// See also [checkQuestProgress].
class CheckQuestProgressFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [checkQuestProgress].
  const CheckQuestProgressFamily();

  /// See also [checkQuestProgress].
  CheckQuestProgressProvider call({
    required Quest quest,
  }) {
    return CheckQuestProgressProvider(
      quest: quest,
    );
  }

  @override
  CheckQuestProgressProvider getProviderOverride(
    covariant CheckQuestProgressProvider provider,
  ) {
    return call(
      quest: provider.quest,
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
  String? get name => r'checkQuestProgressProvider';
}

/// See also [checkQuestProgress].
class CheckQuestProgressProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [checkQuestProgress].
  CheckQuestProgressProvider({
    required Quest quest,
  }) : this._internal(
          (ref) => checkQuestProgress(
            ref as CheckQuestProgressRef,
            quest: quest,
          ),
          from: checkQuestProgressProvider,
          name: r'checkQuestProgressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkQuestProgressHash,
          dependencies: CheckQuestProgressFamily._dependencies,
          allTransitiveDependencies:
              CheckQuestProgressFamily._allTransitiveDependencies,
          quest: quest,
        );

  CheckQuestProgressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quest,
  }) : super.internal();

  final Quest quest;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(CheckQuestProgressRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CheckQuestProgressProvider._internal(
        (ref) => create(ref as CheckQuestProgressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quest: quest,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _CheckQuestProgressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckQuestProgressProvider && other.quest == quest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quest.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CheckQuestProgressRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `quest` of this provider.
  Quest get quest;
}

class _CheckQuestProgressProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with CheckQuestProgressRef {
  _CheckQuestProgressProviderElement(super.provider);

  @override
  Quest get quest => (origin as CheckQuestProgressProvider).quest;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
