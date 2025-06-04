// Forge apps endpoints API
//
// Migrated from src/lib/api/endpoints/forge/apps.ts

import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../forge/forge_app.dart';
import '../../core/client.dart';

// Génère des apps à partir d'un prompt
Future<Map<String, dynamic>> generateApps(WidgetRef ref, String prompt) async {
  final client = ref.read(apiClientProvider);
  return await client.post<Map<String, dynamic>>(
    '/forge/apps',
    data: {'prompt': prompt},
  );
}

// Récupère les apps pour un gym avec filtres optionnels
Future<List<ForgeApp>> getAppsForGym(
  WidgetRef ref, {
  Map<String, dynamic>? filter,
}) async {
  final client = ref.read(apiClientProvider);
  final params = <String, dynamic>{};

  if (filter != null) {
    if (filter['poolId'] != null) params['pool_id'] = filter['poolId'];
    if (filter['minReward'] != null) params['min_reward'] = filter['minReward'];
    if (filter['maxReward'] != null) params['max_reward'] = filter['maxReward'];
    if (filter['categories'] != null) {
      params['categories'] = filter['categories'];
    }
    if (filter['query'] != null) params['query'] = filter['query'];
  }

  final apps =
      await client.get<List<dynamic>>(
            '/forge/apps',
            params: params,
            fromJson:
                (json) =>
                    (json as List)
                        .map(
                          (e) => ForgeApp.fromJson(e as Map<String, dynamic>),
                        )
                        .toList(),
          )
          as List<ForgeApp>;

  if (filter != null && filter['poolId'] != null) {
    return apps;
  }

  // Shuffle apps
  final shuffledApps = List<ForgeApp>.from(apps)..shuffle(Random());

  // Pour chaque app, shuffle les tasks
  return shuffledApps
      .map(
        (app) => app.copyWith(
          tasks: List<ForgeTask>.from(app.tasks)..shuffle(Random()),
        ),
      )
      .toList();
}

// Récupère les catégories pour le gym
Future<List<String>> getGymCategories(WidgetRef ref) async {
  final client = ref.read(apiClientProvider);
  final categories = await client.get<List<dynamic>>(
    '/forge/apps/categories',
    fromJson: (json) => (json as List).map((e) => e as String).toList(),
  );
  return categories.cast<String>();
}

// TODO: Migrer getAppsForHistory et getAppsForSkills (dépendent de la logique locale/plateforme)
