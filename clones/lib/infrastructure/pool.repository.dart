import 'package:clones/domain/models/api/request_options.dart';
import 'package:clones/domain/models/forge_task/forge_app.dart';
import 'package:clones/domain/models/quest/reward_info.dart';
import 'package:clones/domain/models/supported_token.dart';
import 'package:clones/domain/models/token.dart';
import 'package:clones/domain/models/training_pool.dart';
import 'package:clones/domain/models/upload/upload_limit.dart';
import 'package:clones/utils/api_client.dart';

class PoolsRepositoryImpl {
  PoolsRepositoryImpl(this._client);
  final ApiClient _client;

  Future<List<TrainingPool>> listPools() async {
    try {
      final data = await _client.get<List<dynamic>>(
        '/forge/pools',
        options: const RequestOptions(requiresAuth: true),
        fromJson: (json) => json as List<dynamic>,
      );

      return data
          .map(
            (pool) => TrainingPool(
              id: pool['_id'],
              name: pool['name'],
              skills: pool['skills'],
              status: _parseStatus(pool['status']),
              demonstrations: pool['demonstrations'],
              pricePerDemo: pool['pricePerDemo'].toDouble(),
              createdAt: DateTime.parse(pool['createdAt']),
              funds: pool['funds']?.toDouble() ?? 0,
              solBalance: pool['solBalance']?.toDouble() ?? 0,
              ownerAddress: pool['ownerAddress'],
              depositAddress: pool['depositAddress'],
              token: Token(
                symbol: pool['token']['symbol'],
              ),
              uploadLimit: pool['uploadLimit'] == null
                  ? null
                  : UploadLimit.fromJson(
                      pool['uploadLimit'] as Map<String, dynamic>,
                    ),
              ownerEmail: pool['ownerEmail'],
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to load pools: $e');
    }
  }

  Future<TrainingPool> getPool(String poolId) async {
    try {
      final pool = await _client.get<Map<String, dynamic>>(
        '/forge/pools/$poolId',
        options: const RequestOptions(requiresAuth: true),
        fromJson: (json) => json as Map<String, dynamic>,
      );

      return TrainingPool(
        id: pool['_id'],
        name: pool['name'],
        skills: pool['skills'],
        status: _parseStatus(pool['status']),
        demonstrations: pool['demonstrations'],
        pricePerDemo: pool['pricePerDemo'].toDouble(),
        createdAt: DateTime.parse(pool['createdAt']),
        funds: pool['funds']?.toDouble() ?? 0,
        solBalance: pool['solBalance']?.toDouble() ?? 0,
        ownerAddress: pool['ownerAddress'],
        depositAddress: pool['depositAddress'],
        token: Token(
          symbol: pool['token']['symbol'],
        ),
        uploadLimit: pool['uploadLimit'] == null
            ? null
            : UploadLimit.fromJson(
                pool['uploadLimit'] as Map<String, dynamic>,
              ),
        ownerEmail: pool['ownerEmail'],
      );
    } catch (e) {
      throw Exception('Failed to load pool with id $poolId: $e');
    }
  }

  Future<TrainingPool> refreshPool(String poolId) async {
    try {
      final data = await _client.post<Map<String, dynamic>>(
        '/forge/pools/refresh',
        data: {'id': poolId},
        options: const RequestOptions(requiresAuth: true),
        fromJson: (json) => json as Map<String, dynamic>,
      );

      return TrainingPool(
        id: data['_id'],
        name: data['name'],
        skills: data['skills'],
        status: _parseStatus(data['status']),
        demonstrations: data['demonstrations'],
        pricePerDemo: data['pricePerDemo'].toDouble(),
        createdAt: DateTime.parse(data['createdAt']),
        funds: data['funds'].toDouble(),
        solBalance: data['solBalance'],
        ownerAddress: data['ownerAddress'],
        depositAddress: data['depositAddress'],
        token: Token(
          symbol: data['token']['symbol'],
        ),
        uploadLimit: data['uploadLimit'] == null
            ? null
            : UploadLimit.fromJson(
                data['uploadLimit'] as Map<String, dynamic>,
              ),
        ownerEmail: data['ownerEmail'],
      );
    } catch (e) {
      throw Exception('Failed to refresh pool: $e');
    }
  }

  Future<void> updatePool({
    required String poolId,
    String? name,
    TrainingPoolStatus? status,
    String? skills,
    double? pricePerDemo,
    UploadLimit? uploadLimit,
    List<ForgeApp>? apps,
  }) async {
    final data = <String, dynamic>{
      'id': poolId,
    };

    if (name != null) {
      data['name'] = name;
    }
    if (status != null) {
      data['status'] = status.jsonValue;
    }
    if (skills != null) {
      data['skills'] = skills;
    }
    if (pricePerDemo != null) {
      data['pricePerDemo'] = pricePerDemo;
    }
    if (uploadLimit != null) {
      data['uploadLimit'] = uploadLimit.toJson();
    }
    if (apps != null) {
      data['apps'] = apps.map((a) => a.toJson()).toList();
    }

    await _client.put(
      '/forge/pools',
      data: data,
      options: const RequestOptions(requiresAuth: true),
    );
  }

  TrainingPoolStatus _parseStatus(String status) {
    switch (status) {
      case 'live':
        return TrainingPoolStatus.live;
      case 'paused':
        return TrainingPoolStatus.paused;
      case 'no-funds':
        return TrainingPoolStatus.noFunds;
      case 'no-gas':
        return TrainingPoolStatus.noGas;
      default:
        return TrainingPoolStatus.paused;
    }
  }

  Future<RewardInfo> getReward({
    required String poolId,
    String? taskId,
  }) async {
    try {
      final params = <String, dynamic>{'poolId': poolId};
      if (taskId != null) params['taskId'] = taskId;
      return await _client.get<RewardInfo>(
        '/forge/pools/reward',
        params: params,
        options: const RequestOptions(requiresAuth: true),
        fromJson: (json) => RewardInfo.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      throw Exception('Failed to get reward: $e');
    }
  }

  Future<TrainingPool> createPoolWithApps({
    required String name,
    required String skills,
    required String tokenSymbol,
    required String ownerAddress,
    required List<ForgeApp> apps,
  }) async {
    try {
      final data = {
        'name': name,
        'skills': skills,
        'token': {
          'type': 'SPL',
          'symbol': tokenSymbol,
        },
        'ownerAddress': ownerAddress,
        'apps': apps.map((a) => a.toJson()).toList(),
      };
      return await _client.post<TrainingPool>(
        '/forge/pools',
        data: data,
        options: const RequestOptions(requiresAuth: true),
        fromJson: (json) => TrainingPool.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      throw Exception('Failed to create pool: $e');
    }
  }

  Future<void> updatePoolEmail({
    required String poolId,
    required String email,
  }) async {
    try {
      await _client.put<void>(
        '/forge/pools/email',
        data: {'id': poolId, 'email': email},
        options: const RequestOptions(requiresAuth: true),
      );
    } catch (e) {
      throw Exception('Failed to update pool email: $e');
    }
  }

  Future<List<SupportedToken>> getSupportedTokens() async {
    try {
      final data = await _client.get<List<dynamic>>(
        '/forge/pools/supportedTokens',
        options: const RequestOptions(requiresAuth: true),
        fromJson: (json) => json as List<dynamic>,
      );
      return data
          .map((e) => SupportedToken.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to get supported tokens: $e');
    }
  }
}
