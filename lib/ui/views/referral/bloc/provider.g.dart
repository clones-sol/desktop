// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$referralRepositoryHash() =>
    r'27f8f29f6bfe8a3e5835ab232311c721ad29f4d1';

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
String _$referralNotifierHash() => r'62fd8b210c992425adcee096cb2df9ed0d3b99ef';

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
