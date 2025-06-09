import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/application/apps.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/domain/models/ui/gym_filter.dart';

class ForgeGymTasksTab extends ConsumerWidget {
  const ForgeGymTasksTab({super.key, required this.pool});
  final TrainingPool pool;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = GymFilter(poolId: pool.id);
    final appsAsync = ref.watch(getAppsForGymProvider(filter: filter));

    return appsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
      data: (apps) {
        if (apps.isEmpty) {
          return const Center(
            child: Text('No apps/tasks available for this gym.'),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: apps.length,
          itemBuilder: (context, appIdx) {
            final app = apps[appIdx];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (app.domain.isNotEmpty)
                      Text(
                        app.domain,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    if (app.description.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          app.description,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    const SizedBox(height: 8),
                    if (app.tasks.isEmpty) const Text('No tasks for this app.'),
                    if (app.tasks.isNotEmpty)
                      ...app.tasks.map(
                        (task) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(task.prompt),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (task.uploadLimit != null)
                                Text('Upload limit: ${task.uploadLimit}'),
                              if (task.rewardLimit != null)
                                Text('Reward limit: ${task.rewardLimit}'),
                              if (task.limitReason != null &&
                                  task.limitReason!.isNotEmpty)
                                Text('Limit reason: ${task.limitReason}'),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
