import 'dart:math';
import 'package:viralmind_flutter/api/core/client.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_task_item.dart';

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

  // TODO: fix it
  /* Future<List<ForgeApp>> getAppsForHistory() async {
    try {
      final recordings =
          await _tauriBridge.invoke<List<dynamic>>('list_recordings');
      final appMap = <String, ForgeApp>{};

      for (var rec in recordings) {
        final recording = Recording.fromJson(rec as Map<String, dynamic>);

        if (recording.status == 'completed' && recording.quest != null) {
          final quest = recording.quest!;
          if (!appMap.containsKey(quest.app)) {
            appMap[quest.app] = ForgeApp(
              name: quest.app,
              domain: quest.iconUrl?.split('domain=')[1]?.split('&')[0] ?? '',
              description: '',
              categories: [],
              tasks: [],
              poolId:
                  Pool(id: '', name: '', status: 'completed', pricePerDemo: 0),
              seen: true,
            );
          }

          final app = appMap[quest.app]!;
          if (!app.tasks.any((t) => t.prompt == quest.title)) {
            app.tasks.add(
              ForgeTaskItem(
                prompt: quest.title,
                completed: true,
                recordingId: recording.id,
              ),
            );
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

  Future<List<ForgeApp>> getAppsForSkills() async {
    try {
      final historyApps = await getAppsForHistory();
      final appMap = {for (var app in historyApps) app.name: app};

      final submissions = await _submissionRepository.listSubmissions();

      for (var app in appMap.values) {
        app.tasks = app.tasks.map((task) {
          if (task.recordingId != null) {
            final submission = submissions.firstWhere(
              (s) => s.meta?.id == task.recordingId,
              orElse: () => Submission.empty(),
            );
            if (submission.clampedScore != null) {
              return task.copyWith(score: submission.clampedScore);
            }
          }
          return task;
        }).toList();
      }

      final apiApps = await _client.get<List<dynamic>>(
        '/forge/apps',
        fromJson: (json) => (json as List)
            .map((e) => ForgeApp.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

      for (var apiApp in apiApps) {
        final existingApp = appMap[apiApp.name];
        if (existingApp != null) {
          existingApp.domain = apiApp.domain;
          existingApp.description = apiApp.description;
          existingApp.categories = apiApp.categories;
          for (var apiTask in apiApp.tasks) {
            if (!existingApp.tasks.any((t) => t.prompt == apiTask.prompt)) {
              existingApp.tasks.add(apiTask.copyWith(completed: false));
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

      final seen = allApps.where((app) => app.seen).toList();
      final unseen = allApps.where((app) => !app.seen).toList();

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
*/

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

      final apps = await _client.get<List<dynamic>>(
        '/forge/apps',
        params: params,
        fromJson: (json) => (json as List)
            .map(
              (e) => ForgeApp.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ) as List<ForgeApp>;

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
        fromJson: (json) => (json as List).map((e) => e as String).toList(),
      );
      return categories.cast<String>();
    } catch (e) {
      throw Exception('Failed to get gym categories: $e');
    }
  }
}
