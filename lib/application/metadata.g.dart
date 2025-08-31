// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$metadataRepositoryHash() =>
    r'0eaca2bdff4e830b9b9db4f02e108e46ace8bd91';

/// See also [metadataRepository].
@ProviderFor(metadataRepository)
final metadataRepositoryProvider =
    AutoDisposeProvider<MetadataRepositoryImpl>.internal(
  metadataRepository,
  name: r'metadataRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$metadataRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MetadataRepositoryRef = AutoDisposeProviderRef<MetadataRepositoryImpl>;
String _$uploadMetadataHash() => r'6ee0b6c51b1d9c52fbbf5826cfd6e59a9effd070';

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

/// See also [uploadMetadata].
@ProviderFor(uploadMetadata)
const uploadMetadataProvider = UploadMetadataFamily();

/// See also [uploadMetadata].
class UploadMetadataFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [uploadMetadata].
  const UploadMetadataFamily();

  /// See also [uploadMetadata].
  UploadMetadataProvider call({
    required String poolAddress,
    required String title,
    required String description,
    required List<String> skills,
    required String creator,
  }) {
    return UploadMetadataProvider(
      poolAddress: poolAddress,
      title: title,
      description: description,
      skills: skills,
      creator: creator,
    );
  }

  @override
  UploadMetadataProvider getProviderOverride(
    covariant UploadMetadataProvider provider,
  ) {
    return call(
      poolAddress: provider.poolAddress,
      title: provider.title,
      description: provider.description,
      skills: provider.skills,
      creator: provider.creator,
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
  String? get name => r'uploadMetadataProvider';
}

/// See also [uploadMetadata].
class UploadMetadataProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [uploadMetadata].
  UploadMetadataProvider({
    required String poolAddress,
    required String title,
    required String description,
    required List<String> skills,
    required String creator,
  }) : this._internal(
          (ref) => uploadMetadata(
            ref as UploadMetadataRef,
            poolAddress: poolAddress,
            title: title,
            description: description,
            skills: skills,
            creator: creator,
          ),
          from: uploadMetadataProvider,
          name: r'uploadMetadataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadMetadataHash,
          dependencies: UploadMetadataFamily._dependencies,
          allTransitiveDependencies:
              UploadMetadataFamily._allTransitiveDependencies,
          poolAddress: poolAddress,
          title: title,
          description: description,
          skills: skills,
          creator: creator,
        );

  UploadMetadataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.poolAddress,
    required this.title,
    required this.description,
    required this.skills,
    required this.creator,
  }) : super.internal();

  final String poolAddress;
  final String title;
  final String description;
  final List<String> skills;
  final String creator;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(UploadMetadataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadMetadataProvider._internal(
        (ref) => create(ref as UploadMetadataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        poolAddress: poolAddress,
        title: title,
        description: description,
        skills: skills,
        creator: creator,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UploadMetadataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadMetadataProvider &&
        other.poolAddress == poolAddress &&
        other.title == title &&
        other.description == description &&
        other.skills == skills &&
        other.creator == creator;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, poolAddress.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, description.hashCode);
    hash = _SystemHash.combine(hash, skills.hashCode);
    hash = _SystemHash.combine(hash, creator.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UploadMetadataRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `poolAddress` of this provider.
  String get poolAddress;

  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `description` of this provider.
  String get description;

  /// The parameter `skills` of this provider.
  List<String> get skills;

  /// The parameter `creator` of this provider.
  String get creator;
}

class _UploadMetadataProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UploadMetadataRef {
  _UploadMetadataProviderElement(super.provider);

  @override
  String get poolAddress => (origin as UploadMetadataProvider).poolAddress;
  @override
  String get title => (origin as UploadMetadataProvider).title;
  @override
  String get description => (origin as UploadMetadataProvider).description;
  @override
  List<String> get skills => (origin as UploadMetadataProvider).skills;
  @override
  String get creator => (origin as UploadMetadataProvider).creator;
}

String _$getSkillsMetadataHash() => r'ab394d17fd10d74ccba37e70ae4926d507e7e4f4';

/// See also [getSkillsMetadata].
@ProviderFor(getSkillsMetadata)
const getSkillsMetadataProvider = GetSkillsMetadataFamily();

/// See also [getSkillsMetadata].
class GetSkillsMetadataFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [getSkillsMetadata].
  const GetSkillsMetadataFamily();

  /// See also [getSkillsMetadata].
  GetSkillsMetadataProvider call({
    required String hash,
  }) {
    return GetSkillsMetadataProvider(
      hash: hash,
    );
  }

  @override
  GetSkillsMetadataProvider getProviderOverride(
    covariant GetSkillsMetadataProvider provider,
  ) {
    return call(
      hash: provider.hash,
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
  String? get name => r'getSkillsMetadataProvider';
}

/// See also [getSkillsMetadata].
class GetSkillsMetadataProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [getSkillsMetadata].
  GetSkillsMetadataProvider({
    required String hash,
  }) : this._internal(
          (ref) => getSkillsMetadata(
            ref as GetSkillsMetadataRef,
            hash: hash,
          ),
          from: getSkillsMetadataProvider,
          name: r'getSkillsMetadataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSkillsMetadataHash,
          dependencies: GetSkillsMetadataFamily._dependencies,
          allTransitiveDependencies:
              GetSkillsMetadataFamily._allTransitiveDependencies,
          hash: hash,
        );

  GetSkillsMetadataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.hash,
  }) : super.internal();

  final String hash;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(GetSkillsMetadataRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSkillsMetadataProvider._internal(
        (ref) => create(ref as GetSkillsMetadataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        hash: hash,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _GetSkillsMetadataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSkillsMetadataProvider && other.hash == hash;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hash.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetSkillsMetadataRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `hash` of this provider.
  String get hash;
}

class _GetSkillsMetadataProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with GetSkillsMetadataRef {
  _GetSkillsMetadataProviderElement(super.provider);

  @override
  String get hash => (origin as GetSkillsMetadataProvider).hash;
}

String _$searchPoolsByMetadataHash() =>
    r'3d43a259cf49e481b8516d88a26da09d92a2c61f';

/// See also [searchPoolsByMetadata].
@ProviderFor(searchPoolsByMetadata)
const searchPoolsByMetadataProvider = SearchPoolsByMetadataFamily();

/// See also [searchPoolsByMetadata].
class SearchPoolsByMetadataFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [searchPoolsByMetadata].
  const SearchPoolsByMetadataFamily();

  /// See also [searchPoolsByMetadata].
  SearchPoolsByMetadataProvider call({
    List<String>? skills,
    String? searchTerm,
    String? category,
    int limit = 20,
    int offset = 0,
  }) {
    return SearchPoolsByMetadataProvider(
      skills: skills,
      searchTerm: searchTerm,
      category: category,
      limit: limit,
      offset: offset,
    );
  }

  @override
  SearchPoolsByMetadataProvider getProviderOverride(
    covariant SearchPoolsByMetadataProvider provider,
  ) {
    return call(
      skills: provider.skills,
      searchTerm: provider.searchTerm,
      category: provider.category,
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
  String? get name => r'searchPoolsByMetadataProvider';
}

/// See also [searchPoolsByMetadata].
class SearchPoolsByMetadataProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [searchPoolsByMetadata].
  SearchPoolsByMetadataProvider({
    List<String>? skills,
    String? searchTerm,
    String? category,
    int limit = 20,
    int offset = 0,
  }) : this._internal(
          (ref) => searchPoolsByMetadata(
            ref as SearchPoolsByMetadataRef,
            skills: skills,
            searchTerm: searchTerm,
            category: category,
            limit: limit,
            offset: offset,
          ),
          from: searchPoolsByMetadataProvider,
          name: r'searchPoolsByMetadataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchPoolsByMetadataHash,
          dependencies: SearchPoolsByMetadataFamily._dependencies,
          allTransitiveDependencies:
              SearchPoolsByMetadataFamily._allTransitiveDependencies,
          skills: skills,
          searchTerm: searchTerm,
          category: category,
          limit: limit,
          offset: offset,
        );

  SearchPoolsByMetadataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.skills,
    required this.searchTerm,
    required this.category,
    required this.limit,
    required this.offset,
  }) : super.internal();

  final List<String>? skills;
  final String? searchTerm;
  final String? category;
  final int limit;
  final int offset;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(SearchPoolsByMetadataRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchPoolsByMetadataProvider._internal(
        (ref) => create(ref as SearchPoolsByMetadataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        skills: skills,
        searchTerm: searchTerm,
        category: category,
        limit: limit,
        offset: offset,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SearchPoolsByMetadataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchPoolsByMetadataProvider &&
        other.skills == skills &&
        other.searchTerm == searchTerm &&
        other.category == category &&
        other.limit == limit &&
        other.offset == offset;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, skills.hashCode);
    hash = _SystemHash.combine(hash, searchTerm.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, offset.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchPoolsByMetadataRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `skills` of this provider.
  List<String>? get skills;

  /// The parameter `searchTerm` of this provider.
  String? get searchTerm;

  /// The parameter `category` of this provider.
  String? get category;

  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `offset` of this provider.
  int get offset;
}

class _SearchPoolsByMetadataProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SearchPoolsByMetadataRef {
  _SearchPoolsByMetadataProviderElement(super.provider);

  @override
  List<String>? get skills => (origin as SearchPoolsByMetadataProvider).skills;
  @override
  String? get searchTerm =>
      (origin as SearchPoolsByMetadataProvider).searchTerm;
  @override
  String? get category => (origin as SearchPoolsByMetadataProvider).category;
  @override
  int get limit => (origin as SearchPoolsByMetadataProvider).limit;
  @override
  int get offset => (origin as SearchPoolsByMetadataProvider).offset;
}

String _$metadataHealthCheckHash() =>
    r'2c35d8e631dbf7c734c101b50f7834afa86fb6b4';

/// See also [metadataHealthCheck].
@ProviderFor(metadataHealthCheck)
final metadataHealthCheckProvider =
    AutoDisposeFutureProvider<Map<String, dynamic>>.internal(
  metadataHealthCheck,
  name: r'metadataHealthCheckProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$metadataHealthCheckHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MetadataHealthCheckRef
    = AutoDisposeFutureProviderRef<Map<String, dynamic>>;
String _$validateMetadataHash() => r'0dae7f53969c04f8c5e2d358bbc57684dece4e29';

/// See also [validateMetadata].
@ProviderFor(validateMetadata)
const validateMetadataProvider = ValidateMetadataFamily();

/// See also [validateMetadata].
class ValidateMetadataFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [validateMetadata].
  const ValidateMetadataFamily();

  /// See also [validateMetadata].
  ValidateMetadataProvider call({
    required String title,
    required String description,
    required List<String> skills,
  }) {
    return ValidateMetadataProvider(
      title: title,
      description: description,
      skills: skills,
    );
  }

  @override
  ValidateMetadataProvider getProviderOverride(
    covariant ValidateMetadataProvider provider,
  ) {
    return call(
      title: provider.title,
      description: provider.description,
      skills: provider.skills,
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
  String? get name => r'validateMetadataProvider';
}

/// See also [validateMetadata].
class ValidateMetadataProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [validateMetadata].
  ValidateMetadataProvider({
    required String title,
    required String description,
    required List<String> skills,
  }) : this._internal(
          (ref) => validateMetadata(
            ref as ValidateMetadataRef,
            title: title,
            description: description,
            skills: skills,
          ),
          from: validateMetadataProvider,
          name: r'validateMetadataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$validateMetadataHash,
          dependencies: ValidateMetadataFamily._dependencies,
          allTransitiveDependencies:
              ValidateMetadataFamily._allTransitiveDependencies,
          title: title,
          description: description,
          skills: skills,
        );

  ValidateMetadataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.title,
    required this.description,
    required this.skills,
  }) : super.internal();

  final String title;
  final String description;
  final List<String> skills;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(ValidateMetadataRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ValidateMetadataProvider._internal(
        (ref) => create(ref as ValidateMetadataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        title: title,
        description: description,
        skills: skills,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _ValidateMetadataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ValidateMetadataProvider &&
        other.title == title &&
        other.description == description &&
        other.skills == skills;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, description.hashCode);
    hash = _SystemHash.combine(hash, skills.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ValidateMetadataRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `description` of this provider.
  String get description;

  /// The parameter `skills` of this provider.
  List<String> get skills;
}

class _ValidateMetadataProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with ValidateMetadataRef {
  _ValidateMetadataProviderElement(super.provider);

  @override
  String get title => (origin as ValidateMetadataProvider).title;
  @override
  String get description => (origin as ValidateMetadataProvider).description;
  @override
  List<String> get skills => (origin as ValidateMetadataProvider).skills;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
