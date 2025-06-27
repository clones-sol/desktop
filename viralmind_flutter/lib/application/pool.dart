import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';
import 'package:viralmind_flutter/domain/models/quest/reward_info.dart';
import 'package:viralmind_flutter/domain/models/token.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/infrastructure/pool.repository.dart';
import 'package:viralmind_flutter/utils/api_client.dart';

part 'pool.g.dart';

@riverpod
PoolsRepositoryImpl poolsRepository(
  Ref ref,
) {
  final apiClient = ref.watch(apiClientProvider);
  return PoolsRepositoryImpl(apiClient);
}

@riverpod
Future<List<TrainingPool>> listPools(Ref ref) async {
  final poolsRepository = ref.read(poolsRepositoryProvider);
  return poolsRepository.listPools();
}

@riverpod
Future<TrainingPool> pool(Ref ref, String poolId) async {
  final pools = await ref.watch(listPoolsProvider.future);
  return pools.firstWhere((p) => p.id == poolId);
}

@riverpod
Future<TrainingPool> refreshPool(
  Ref ref, {
  required String poolId,
}) async {
  final poolsRepository = ref.read(poolsRepositoryProvider);
  return poolsRepository.refreshPool(poolId);
}

@riverpod
Future<void> createPool(
  Ref ref, {
  required String poolName,
  required String skills,
  required Token token,
  required List<Map<String, dynamic>> apps,
  required String ownerAddress,
}) async {
  final poolsRepository = ref.read(poolsRepositoryProvider);
  return poolsRepository.createPool(
    poolName: poolName,
    skills: skills,
    token: token,
    apps: apps,
    ownerAddress: ownerAddress,
  );
}

@riverpod
Future<RewardInfo> getReward(
  Ref ref, {
  required String poolId,
  String? taskId,
}) async {
  final poolsRepository = ref.read(poolsRepositoryProvider);
  return poolsRepository.getReward(
    poolId: poolId,
    taskId: taskId,
  );
}

@riverpod
Future<TrainingPool> createPoolWithApps(
  Ref ref, {
  required String poolName,
  required String skills,
  required Token token,
  required List<ForgeApp> apps,
  required String ownerAddress,
}) async {
  final poolsRepository = ref.read(poolsRepositoryProvider);
  return poolsRepository.createPoolWithApps(
    name: poolName,
    skills: skills,
    token: token,
    ownerAddress: ownerAddress,
    apps: apps,
  );
}

@riverpod
Future<void> updatePoolEmail(
  Ref ref, {
  required String poolId,
  required String email,
}) async {
  final poolsRepository = ref.read(poolsRepositoryProvider);
  return poolsRepository.updatePoolEmail(
    poolID: poolId,
    email: email,
  );
}
