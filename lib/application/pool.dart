import 'package:clones_desktop/domain/models/demonstration/reward_info.dart';
import 'package:clones_desktop/domain/models/forge_task/forge_app.dart';
import 'package:clones_desktop/domain/models/supported_token.dart';
import 'package:clones_desktop/domain/models/training_pool.dart';
import 'package:clones_desktop/domain/models/upload/upload_limit.dart';
import 'package:clones_desktop/infrastructure/pool.repository.dart';
import 'package:clones_desktop/utils/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  final poolsRepository = ref.read(poolsRepositoryProvider);
  return poolsRepository.getPool(poolId);
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
Future<void> updatePool(
  Ref ref, {
  required String poolId,
  String? poolName,
  TrainingPoolStatus? status,
  String? skills,
  double? pricePerDemo,
  UploadLimit? uploadLimit,
  List<ForgeApp>? apps,
}) async {
  final poolsRepository = ref.read(poolsRepositoryProvider);
  return poolsRepository.updatePool(
    poolId: poolId,
    name: poolName,
    status: status,
    skills: skills,
    pricePerDemo: pricePerDemo,
    uploadLimit: uploadLimit,
    apps: apps,
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
  required String tokenSymbol,
  required List<ForgeApp> apps,
  required String ownerAddress,
}) async {
  final poolsRepository = ref.read(poolsRepositoryProvider);
  return poolsRepository.createPoolWithApps(
    name: poolName,
    skills: skills,
    tokenSymbol: tokenSymbol,
    ownerAddress: ownerAddress,
    apps: apps,
  );
}

@riverpod
Future<List<SupportedToken>> getSupportedTokens(Ref ref) async {
  final poolsRepository = ref.read(poolsRepositoryProvider);
  return poolsRepository.getSupportedTokens();
}
