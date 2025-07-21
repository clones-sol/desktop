// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tasksRepositoryHash() => r'70733151ce44023c41ce7f639ced118959f3d8df';

/// See also [tasksRepository].
@ProviderFor(tasksRepository)
final tasksRepositoryProvider =
    AutoDisposeProvider<TasksRepositoryImpl>.internal(
  tasksRepository,
  name: r'tasksRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tasksRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TasksRepositoryRef = AutoDisposeProviderRef<TasksRepositoryImpl>;
String _$getTasksForGymHash() => r'f3ecebe94ec43ca60c31eb402483462e606b97d7';

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

/// See also [getTasksForGym].
@ProviderFor(getTasksForGym)
const getTasksForGymProvider = GetTasksForGymFamily();

/// See also [getTasksForGym].
class GetTasksForGymFamily extends Family<AsyncValue<List<ForgeTask>>> {
  /// See also [getTasksForGym].
  const GetTasksForGymFamily();

  /// See also [getTasksForGym].
  GetTasksForGymProvider call({
    Map<String, dynamic>? filter,
  }) {
    return GetTasksForGymProvider(
      filter: filter,
    );
  }

  @override
  GetTasksForGymProvider getProviderOverride(
    covariant GetTasksForGymProvider provider,
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
  String? get name => r'getTasksForGymProvider';
}

/// See also [getTasksForGym].
class GetTasksForGymProvider
    extends AutoDisposeFutureProvider<List<ForgeTask>> {
  /// See also [getTasksForGym].
  GetTasksForGymProvider({
    Map<String, dynamic>? filter,
  }) : this._internal(
          (ref) => getTasksForGym(
            ref as GetTasksForGymRef,
            filter: filter,
          ),
          from: getTasksForGymProvider,
          name: r'getTasksForGymProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTasksForGymHash,
          dependencies: GetTasksForGymFamily._dependencies,
          allTransitiveDependencies:
              GetTasksForGymFamily._allTransitiveDependencies,
          filter: filter,
        );

  GetTasksForGymProvider._internal(
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
    FutureOr<List<ForgeTask>> Function(GetTasksForGymRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTasksForGymProvider._internal(
        (ref) => create(ref as GetTasksForGymRef),
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
  AutoDisposeFutureProviderElement<List<ForgeTask>> createElement() {
    return _GetTasksForGymProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTasksForGymProvider && other.filter == filter;
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
mixin GetTasksForGymRef on AutoDisposeFutureProviderRef<List<ForgeTask>> {
  /// The parameter `filter` of this provider.
  Map<String, dynamic>? get filter;
}

class _GetTasksForGymProviderElement
    extends AutoDisposeFutureProviderElement<List<ForgeTask>>
    with GetTasksForGymRef {
  _GetTasksForGymProviderElement(super.provider);

  @override
  Map<String, dynamic>? get filter => (origin as GetTasksForGymProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
