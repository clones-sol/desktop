import 'package:clones_desktop/domain/models/factory/gas.dart';
import 'package:clones_desktop/infrastructure/gas.repository.dart';
import 'package:clones_desktop/utils/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gas.g.dart';

@riverpod
GasRepositoryImpl gasRepository(
  Ref ref,
) {
  final apiClient = ref.watch(apiClientProvider);
  return GasRepositoryImpl(apiClient);
}

@riverpod
Future<Map<String, dynamic>> estimateGas(
  Ref ref, {
  required List<ClaimData> claims,
  required String fromAddress,
}) {
  final repository = ref.read(gasRepositoryProvider);
  return repository.estimateGas(claims: claims, fromAddress: fromAddress);
}

@riverpod
Future<GasAnalysis> analyzeGasCost(
  Ref ref, {
  required List<ClaimData> claims,
  required String fromAddress,
  double tokenPriceUsd = 1.0,
}) {
  final repository = ref.read(gasRepositoryProvider);
  return repository.analyzeGasCost(
    claims: claims,
    fromAddress: fromAddress,
    tokenPriceUsd: tokenPriceUsd,
  );
}

@riverpod
Future<BatchOptimization> optimizeBatchSize(
  Ref ref, {
  required List<ClaimData> claims,
  required String fromAddress,
  double maxGasCostUsd = 50.0,
}) {
  final repository = ref.read(gasRepositoryProvider);
  return repository.optimizeBatchSize(
    claims: claims,
    fromAddress: fromAddress,
    maxGasCostUsd: maxGasCostUsd,
  );
}

@riverpod
Future<GasPriceAdvice> getGasAdvice(
  Ref ref,
) {
  final repository = ref.read(gasRepositoryProvider);
  return repository.getGasAdvice();
}
