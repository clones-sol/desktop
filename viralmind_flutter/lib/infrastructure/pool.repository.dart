import 'package:viralmind_flutter/domain/models/api/request_options.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';
import 'package:viralmind_flutter/domain/models/quest/reward_info.dart';
import 'package:viralmind_flutter/domain/models/token.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/utils/api_client.dart';

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
              tokenBalance: pool['tokenBalance'].toDouble(),
              pricePerDemo: pool['pricePerDemo'].toDouble(),
              createdAt: DateTime.parse(pool['createdAt']),
              token: Token(
                type: Token.parseTokenType(pool['token']['type']),
                symbol: pool['token']['symbol'],
                address: pool['token']['address'],
              ),
              funds: pool['funds']?.toDouble() ?? 0,
              solBalance: pool['solBalance']?.toDouble() ?? 0,
              ownerAddress: pool['ownerAddress'],
              depositAddress: pool['depositAddress'],
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to load pools: $e');
    }
  }

  Future<TrainingPool> refreshPool(String poolId) async {
    try {
      final data = await _client.post<Map<String, dynamic>>(
        '/forge/pools/$poolId/refresh',
        options: const RequestOptions(requiresAuth: true),
        fromJson: (json) => json as Map<String, dynamic>,
      );

      return TrainingPool(
        id: data['_id'],
        name: data['name'],
        skills: data['skills'],
        status: _parseStatus(data['status']),
        demonstrations: data['demonstrations'],
        tokenBalance: data['tokenBalance'].toDouble(),
        pricePerDemo: data['pricePerDemo'].toDouble(),
        createdAt: DateTime.parse(data['createdAt']),
        funds: data['funds'],
        solBalance: data['solBalance'],
        ownerAddress: data['ownerAddress'],
        depositAddress: data['depositAddress'],
        token: Token(
          type: data['token']['type'],
          symbol: data['token']['symbol'],
          address: data['token']['address'],
        ),
      );
    } catch (e) {
      throw Exception('Failed to refresh pool: $e');
    }
  }

  Future<void> createPool({
    required String poolName,
    required String skills,
    required Token token,
    required List<Map<String, dynamic>> apps,
    required String ownerAddress,
  }) async {
    try {
      await _client.post(
        '/forge/pools',
        data: {
          'name': poolName,
          'skills': skills,
          'token': {
            'type': Token.getTokenType(token.type),
            'symbol': token.symbol,
            'address': token.address,
          },
          'apps': apps,
          'ownerAddress': ownerAddress,
        },
        options: const RequestOptions(requiresAuth: true),
      );
    } catch (e) {
      throw Exception('Failed to create pool: $e');
    }
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
    required Token token,
    required String ownerAddress,
    required List<ForgeApp> apps,
  }) async {
    try {
      final data = {
        'name': name,
        'skills': skills,
        'token': token.toJson(),
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
    required String poolID,
    required String email,
  }) async {
    try {
      await _client.put<void>(
        '/forge/pools/email',
        data: {'id': poolID, 'email': email},
        options: const RequestOptions(requiresAuth: true),
      );
    } catch (e) {
      throw Exception('Failed to update pool email: $e');
    }
  }
}
