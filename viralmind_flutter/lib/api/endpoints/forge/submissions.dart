// Forge submissions endpoints API
//
// Migrated from src/lib/api/endpoints/forge/submissions.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/client.dart';
import 'submission.dart';

// Récupère le statut d'une soumission
Future<SubmissionStatus> getSubmissionStatus(
  WidgetRef ref,
  String submissionId,
) async {
  final client = ref.read(apiClientProvider);
  return await client.get<SubmissionStatus>(
    '/forge/submissions/$submissionId',
    options: const RequestOptions(requiresAuth: true),
    fromJson: (json) => SubmissionStatus.fromJson(json as Map<String, dynamic>),
  );
}

// Liste toutes les soumissions de l'utilisateur courant
Future<List<SubmissionStatus>> listSubmissions(WidgetRef ref) async {
  final client = ref.read(apiClientProvider);
  final submissions = await client.get<List<dynamic>>(
    '/forge/submissions/user',
    options: const RequestOptions(requiresAuth: true),
    fromJson:
        (json) =>
            (json as List)
                .map(
                  (e) => SubmissionStatus.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
  );
  return submissions.cast<SubmissionStatus>();
}

// Récupère les soumissions pour un pool spécifique
Future<List<PoolSubmission>> getPoolSubmissions(
  WidgetRef ref,
  String poolId,
) async {
  final client = ref.read(apiClientProvider);
  final submissions = await client.get<List<dynamic>>(
    '/forge/submissions/pool/$poolId',
    options: const RequestOptions(requiresAuth: true),
    fromJson:
        (json) =>
            (json as List)
                .map((e) => PoolSubmission.fromJson(e as Map<String, dynamic>))
                .toList(),
  );
  return submissions.cast<PoolSubmission>();
}
