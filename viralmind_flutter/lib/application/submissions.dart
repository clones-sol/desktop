import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/api/core/client.dart';
import 'package:viralmind_flutter/domain/models/submission/submission_status.dart';
import 'package:viralmind_flutter/infrastructure/submissions.repository.dart';

part 'submissions.g.dart';

@riverpod
SubmissionsRepositoryImpl submissionsRepository(
  Ref ref,
) {
  final apiClient = ref.watch(apiClientProvider);
  return SubmissionsRepositoryImpl(apiClient);
}

@riverpod
Future<SubmissionStatus> getSubmissionStatus(
  Ref ref, {
  required String submissionId,
}) async {
  final submissionsRepository = ref.read(submissionsRepositoryProvider);
  return submissionsRepository.getSubmissionStatus(submissionId: submissionId);
}
