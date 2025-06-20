import 'dart:math';

import 'package:collection/collection.dart';
import 'package:viralmind_flutter/api/core/client.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_task_item.dart';
import 'package:viralmind_flutter/domain/models/forge_task/pool_id.dart';
import 'package:viralmind_flutter/domain/models/recording/recording_meta.dart';
import 'package:viralmind_flutter/infrastructure/submissions.repository.dart';

class AppsRepositoryImpl {
  AppsRepositoryImpl(this._client);
  final ApiClient _client;

  Future<Map<String, dynamic>> generateApps({required String prompt}) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        '/forge/apps',
        data: {'prompt': prompt},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to generate apps: $e');
    }
  }

  Future<List<ForgeApp>> getAppsForHistory(
    List<RecordingMeta> recordings,
  ) async {
    try {
      final appMap = <String, ForgeApp>{};

      for (final recording in recordings) {
        if (recording.status == 'completed' && recording.quest != null) {
          final quest = recording.quest!;
          if (!appMap.containsKey(quest.app)) {
            appMap[quest.app] = ForgeApp(
              name: quest.app,
              domain: quest.iconUrl.split('domain=')[1].split('&')[0],
              description: '',
              categories: [],
              tasks: [],
              poolId: const PoolId(
                id: '',
                name: '',
                status: 'completed',
                pricePerDemo: 0,
              ),
              seen: true,
            );
          }

          final app = appMap[quest.app]!;
          final newTasks = app.tasks.toList();
          if (!newTasks.any((t) => t.prompt == quest.title)) {
            newTasks.add(
              ForgeTaskItem(
                prompt: quest.title,
                completed: true,
                recordingId: recording.id,
              ),
            );
            appMap[quest.app] = app.copyWith(tasks: newTasks);
          }
        }
      }

      final apps = appMap.values.toList()
        ..sort((a, b) => a.name.compareTo(b.name));

      return apps;
    } catch (e) {
      throw Exception('Failed to get apps for history: $e');
    }
  }

  Future<List<ForgeApp>> getAppsForSkills(
    List<RecordingMeta> recordings,
  ) async {
    try {
      final historyApps = await getAppsForHistory(recordings);
      final appMap = <String, ForgeApp>{};
      final submissions =
          await SubmissionsRepositoryImpl(_client).listSubmissions();

      for (final app in historyApps) {
        final newTasks = app.tasks.map((task) {
          if (task.recordingId != null) {
            final submission = submissions.firstWhereOrNull(
              (s) => s.meta.id == task.recordingId,
            );
            if (submission != null && submission.clampedScore != null) {
              return task.copyWith(score: submission.clampedScore);
            }
          }
          return task;
        }).toList();
        appMap[app.name] = app.copyWith(tasks: newTasks);
      }

      // TODO(reddwarf03): Write a method to get the apps from the API
      final appsJson = await _client.get<List<dynamic>>('/forge/apps');
      final apiApps = appsJson
          .map((e) => ForgeApp.fromJson(e as Map<String, dynamic>))
          .toList();

      for (final apiApp in apiApps) {
        var existingApp = appMap[apiApp.name];
        if (existingApp != null) {
          existingApp = existingApp.copyWith(
            domain: apiApp.domain,
            description: apiApp.description,
            categories: apiApp.categories,
          );

          for (final apiTask in apiApp.tasks) {
            if (!existingApp!.tasks.any((t) => t.prompt == apiTask.prompt)) {
              existingApp = existingApp.copyWith(
                tasks: [
                  ...existingApp.tasks,
                  apiTask.copyWith(completed: false),
                ],
              );
            }
          }
        } else {
          appMap[apiApp.name] = apiApp.copyWith(
            seen: false,
            tasks:
                apiApp.tasks.map((t) => t.copyWith(completed: false)).toList(),
          );
        }
      }

      final allApps = appMap.values.toList();
      if (allApps.isEmpty) {
        return [];
      }

      final seen = allApps.where((app) => app.seen == true).toList();
      final unseen = allApps.where((app) => app.seen != true).toList();

      var result = [...seen];
      if (unseen.isNotEmpty) {
        unseen.shuffle(Random());
        final unseenToAdd = min(2, max(0, 3 - seen.length));
        result = [...result, ...unseen.take(unseenToAdd)];
      }

      return result;
    } catch (e) {
      throw Exception('Failed to get apps for skills: $e');
    }
  }

  Future<List<ForgeApp>> getAppsForGym({
    Map<String, dynamic>? filter,
  }) async {
    try {
      final params = <String, dynamic>{};

      if (filter != null) {
        if (filter['poolId'] != null) params['pool_id'] = filter['poolId'];
        if (filter['minReward'] != null) {
          params['min_reward'] = filter['minReward'];
        }
        if (filter['maxReward'] != null) {
          params['max_reward'] = filter['maxReward'];
        }
        if (filter['categories'] != null) {
          params['categories'] = filter['categories'];
        }
        if (filter['query'] != null) params['query'] = filter['query'];
      }

      final appsJson = await _client.get<List<dynamic>>(
        '/forge/apps',
        params: params,
      );
      final apps = appsJson
          .map((e) => ForgeApp.fromJson(e as Map<String, dynamic>))
          .toList();

      if (filter != null && filter['poolId'] != null) {
        return apps;
      }

      final shuffledApps = List<ForgeApp>.from(apps)..shuffle(Random());
      return shuffledApps
          .map(
            (app) => app.copyWith(
              tasks: List<ForgeTaskItem>.from(app.tasks)..shuffle(Random()),
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to get apps for gym: $e');
    }
  }

  Future<List<String>> getGymCategories() async {
    try {
      final categories = await _client.get<List<dynamic>>(
        '/forge/apps/categories',
      );
      return categories.cast<String>();
    } catch (e) {
      throw Exception('Failed to get gym categories: $e');
    }
  }
}
