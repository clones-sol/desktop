import 'package:clones/domain/models/api/request_options.dart';
import 'package:clones/domain/models/submission/pool_submission.dart';
import 'package:clones/domain/models/submission/submission_status.dart';
import 'package:clones/utils/api_client.dart';

class SubmissionsRepositoryImpl {
  SubmissionsRepositoryImpl(this._client);
  final ApiClient _client;

  Future<SubmissionStatus> getSubmissionStatus({
    required String submissionId,
  }) async {
    try {
      return await _client.get<SubmissionStatus>(
        '/forge/submissions/$submissionId',
        options: const RequestOptions(requiresAuth: true),
        fromJson: (json) {
          return SubmissionStatus.fromJson(json as Map<String, dynamic>);
        },
      );
    } catch (e) {
      throw Exception('Failed to get submission status: $e');
    }
  }

  Future<List<SubmissionStatus>> listSubmissions() async {
    try {
      final submissions = await _client.get<List<dynamic>>(
        '/forge/submissions/user',
        options: const RequestOptions(requiresAuth: true),
        fromJson: (json) => (json as List)
            .map(
              (e) => SubmissionStatus.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );
      return submissions.cast<SubmissionStatus>();
    } catch (e) {
      throw Exception('Failed to list submissions: $e');
    }
  }

  Future<List<PoolSubmission>> getPoolSubmissions({
    required String poolId,
  }) async {
    try {
      final submissions = await _client.get<List<dynamic>>(
        '/forge/submissions/pool/$poolId',
        options: const RequestOptions(requiresAuth: true),
        fromJson: (json) => (json as List).map((e) {
          return PoolSubmission.fromJson(e as Map<String, dynamic>);
        }).toList(),
      );
      return submissions.cast<PoolSubmission>();
    } catch (e) {
      throw Exception('Failed to get pool submissions: $e');
    }
  }
}
