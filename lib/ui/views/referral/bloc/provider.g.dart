// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$referralRepositoryHash() =>
    r'85155073f81c9cbc4c0585d9d835eb4c6289edaa';

/// See also [referralRepository].
@ProviderFor(referralRepository)
final referralRepositoryProvider =
    AutoDisposeProvider<ReferralRepository>.internal(
  referralRepository,
  name: r'referralRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$referralRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReferralRepositoryRef = AutoDisposeProviderRef<ReferralRepository>;
String _$referralNotifierHash() => r'f93d9d32282c027846e322c2c9083d1eb959bc18';

/// See also [ReferralNotifier].
@ProviderFor(ReferralNotifier)
final referralNotifierProvider =
    AutoDisposeNotifierProvider<ReferralNotifier, ReferralState>.internal(
  ReferralNotifier.new,
  name: r'referralNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$referralNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReferralNotifier = AutoDisposeNotifier<ReferralState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
