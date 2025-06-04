// Forge pools endpoints API
//
// Migrated from src/lib/api/endpoints/forge/pools.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/client.dart';
import 'training_pool.dart';
import '../forge/forge_app.dart';

// Liste tous les pools d'entraînement
Future<List<TrainingPool>> listPools(WidgetRef ref) async {
  final client = ref.read(apiClientProvider);
  final pools = await client.get<List<dynamic>>(
    '/forge/pools',
    options: const RequestOptions(requiresAuth: true),
    fromJson:
        (json) =>
            (json as List)
                .map((e) => TrainingPool.fromJson(e as Map<String, dynamic>))
                .toList(),
  );
  return pools.cast<TrainingPool>();
}

// Crée un nouveau pool
Future<TrainingPool> createPool(WidgetRef ref, CreatePoolInput input) async {
  final client = ref.read(apiClientProvider);
  return await client.post<TrainingPool>(
    '/forge/pools/',
    data: input.toJson(),
    options: const RequestOptions(requiresAuth: true),
    fromJson: (json) => TrainingPool.fromJson(json as Map<String, dynamic>),
  );
}

// Met à jour un pool existant
Future<TrainingPool> updatePool(WidgetRef ref, UpdatePoolInput input) async {
  final client = ref.read(apiClientProvider);
  return await client.put<TrainingPool>(
    '/forge/pools/',
    data: input.toJson(),
    options: const RequestOptions(requiresAuth: true),
    fromJson: (json) => TrainingPool.fromJson(json as Map<String, dynamic>),
  );
}

// Rafraîchit un pool
Future<TrainingPool> refreshPool(WidgetRef ref, String poolId) async {
  final client = ref.read(apiClientProvider);
  return await client.post<TrainingPool>(
    '/forge/pools/refresh',
    data: {'id': poolId},
    options: const RequestOptions(requiresAuth: true),
    fromJson: (json) => TrainingPool.fromJson(json as Map<String, dynamic>),
  );
}

// Récupère le solde d'un utilisateur
Future<double> getBalance(WidgetRef ref, String address) async {
  final client = ref.read(apiClientProvider);
  final data = await client.get<Map<String, dynamic>>(
    '/wallet/balance/$address',
    options: const RequestOptions(requiresAuth: true),
  );
  return (data['balance'] as num).toDouble();
}

// Récupère les infos de récompense pour un pool
Future<Map<String, dynamic>> getReward(
  WidgetRef ref,
  String poolId, [
  String? taskId,
]) async {
  final client = ref.read(apiClientProvider);
  final params = <String, dynamic>{'poolId': poolId};
  if (taskId != null) params['taskId'] = taskId;
  return await client.get<Map<String, dynamic>>(
    '/forge/pools/reward',
    params: params,
    options: const RequestOptions(requiresAuth: true),
  );
}

// Crée un pool avec des apps
Future<TrainingPool> createPoolWithApps(
  WidgetRef ref,
  CreatePoolInput input,
  List<ForgeApp>? apps,
) async {
  final client = ref.read(apiClientProvider);
  final data = input.toJson();
  if (apps != null) {
    data['apps'] = apps.map((a) => a.toJson()).toList();
  }
  return await client.post<TrainingPool>(
    '/forge/pools',
    data: data,
    options: const RequestOptions(requiresAuth: true),
    fromJson: (json) => TrainingPool.fromJson(json as Map<String, dynamic>),
  );
}

// Met à jour l'email d'un pool
Future<void> updatePoolEmail(WidgetRef ref, String poolID, String email) async {
  final client = ref.read(apiClientProvider);
  await client.put<void>(
    '/forge/pools/email',
    data: {'id': poolID, 'email': email},
    options: const RequestOptions(requiresAuth: true),
  );
}
