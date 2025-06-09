import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:viralmind_flutter/application/submissions.dart';
import 'package:viralmind_flutter/domain/models/submission/pool_submission.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';

final _poolSubmissionsProvider =
    FutureProvider.family<List<PoolSubmission>, String>((ref, poolId) async {
  final repo = ref.read(submissionsRepositoryProvider);
  return repo.getPoolSubmissions(poolId: poolId);
});

class ForgeGymUploadsTab extends ConsumerWidget {
  const ForgeGymUploadsTab({super.key, required this.pool});
  final TrainingPool pool;

  String _formatDate(String dateStr) {
    try {
      final dt = DateTime.parse(dateStr);
      return DateFormat.yMMMd().add_Hm().format(dt);
    } catch (_) {
      return dateStr;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final submissionsAsync = ref.watch(_poolSubmissionsProvider(pool.id));
    return submissionsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
      data: (submissions) {
        if (submissions.isEmpty) {
          return const Center(child: Text('No uploads yet.'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: submissions.length,
          separatorBuilder: (context, idx) => const Divider(),
          itemBuilder: (context, idx) {
            final sub = submissions[idx];
            final quest = sub.meta.quest;
            return ListTile(
              title: Text(quest.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Status: ${sub.status}'),
                  Text('Reward: ${sub.reward} VIRAL'),
                  Text('Created: ${_formatDate(sub.createdAt)}'),
                  if (quest.app.isNotEmpty) Text('App: ${quest.app}'),
                  // TODO: Add platform back in
                  // if (sub.meta.platform.isNotEmpty)
                  //   Text('Platform: ${sub.meta.platform}'),
                  if (sub.files.isNotEmpty) Text('Files: ${sub.files.length}'),
                ],
              ),
              isThreeLine: true,
            );
          },
        );
      },
    );
  }
}
