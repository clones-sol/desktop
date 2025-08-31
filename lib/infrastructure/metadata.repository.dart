import 'package:clones_desktop/utils/api_client.dart';

class MetadataRepositoryImpl {
  MetadataRepositoryImpl(this._client);
  final ApiClient _client;

  static const String _metadataEndpoint = '/forge/metadata';

  Future<Map<String, dynamic>> uploadMetadata({
    required String poolAddress,
    required String title,
    required String description,
    required List<String> skills,
    required String creator,
  }) async {
    return _client.post<Map<String, dynamic>>(
      '$_metadataEndpoint/upload',
      data: {
        'poolAddress': poolAddress,
        'title': title,
        'description': description,
        'skills': skills,
        'creator': creator,
      },
    );
  }

  Future<Map<String, dynamic>> getSkillsMetadata({required String hash}) async {
    return _client.get<Map<String, dynamic>>('$_metadataEndpoint/skills/$hash');
  }

  Future<Map<String, dynamic>> searchPoolsByMetadata({
    List<String>? skills,
    String? searchTerm,
    String? category,
    int limit = 20,
    int offset = 0,
  }) async {
    return _client.post<Map<String, dynamic>>(
      '$_metadataEndpoint/search',
      data: {
        if (skills != null) 'skills': skills,
        if (searchTerm != null) 'searchTerm': searchTerm,
        if (category != null) 'category': category,
        'limit': limit,
        'offset': offset,
      },
    );
  }

  Future<Map<String, dynamic>> healthCheck() async {
    return _client.get<Map<String, dynamic>>('$_metadataEndpoint/health');
  }

  Future<Map<String, dynamic>> validateMetadata({
    required String title,
    required String description,
    required List<String> skills,
  }) async {
    return _client.post<Map<String, dynamic>>(
      '$_metadataEndpoint/validate',
      data: {
        'title': title,
        'description': description,
        'skills': skills,
      },
    );
  }
}
