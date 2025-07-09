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
String _$gymSettingsNotifierHash() =>
    r'485aa1922623eba09d5da53cfbd731274fffa3b1';

/// See also [GymSettingsNotifier].
@ProviderFor(GymSettingsNotifier)
final gymSettingsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<GymSettingsNotifier, GymSettings>.internal(
  GymSettingsNotifier.new,
  name: r'gymSettingsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gymSettingsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GymSettingsNotifier = AutoDisposeAsyncNotifier<GymSettings>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
