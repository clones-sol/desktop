// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsRepositoryHash() =>
    r'0060ca988ca26880fa9925dd7bd43677bc3a9cdc';

/// See also [settingsRepository].
@ProviderFor(settingsRepository)
final settingsRepositoryProvider = FutureProvider<SettingsRepository>.internal(
  settingsRepository,
  name: r'settingsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SettingsRepositoryRef = FutureProviderRef<SettingsRepository>;
String _$factorySettingsNotifierHash() =>
    r'c1437741cc8cd420ec95693aaa4de4726b9207c6';

/// See also [FactorySettingsNotifier].
@ProviderFor(FactorySettingsNotifier)
final factorySettingsNotifierProvider = AutoDisposeAsyncNotifierProvider<
    FactorySettingsNotifier, FactorySettings>.internal(
  FactorySettingsNotifier.new,
  name: r'factorySettingsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$factorySettingsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FactorySettingsNotifier = AutoDisposeAsyncNotifier<FactorySettings>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
