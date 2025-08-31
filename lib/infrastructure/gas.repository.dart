import 'package:clones_desktop/domain/models/api/request_options.dart';
import 'package:clones_desktop/domain/models/factory/gas.dart';

import 'package:clones_desktop/utils/api_client.dart';

/// Repository for gas estimation and optimization for claims
class GasRepositoryImpl {
  GasRepositoryImpl(this._client);
  final ApiClient _client;

  static const String _gasEndpoint = '/forge/gas';

  /// Estimate gas cost for batch claims
  Future<Map<String, dynamic>> estimateGas({
    required List<ClaimData> claims,
    required String fromAddress,
  }) async {
    return _client.post<Map<String, dynamic>>(
      '$_gasEndpoint/estimate',
      data: {
        'claims': claims.map((c) => c.toJson()).toList(),
        'fromAddress': fromAddress,
      },
      options: const RequestOptions(requiresAuth: true),
    );
  }

  /// Analyze gas cost vs reward with smart alerts
  Future<GasAnalysis> analyzeGasCost({
    required List<ClaimData> claims,
    required String fromAddress,
    double tokenPriceUsd = 1.0,
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      '$_gasEndpoint/analyze',
      data: {
        'claims': claims.map((c) => c.toJson()).toList(),
        'fromAddress': fromAddress,
        'tokenPriceUsd': tokenPriceUsd,
      },
      options: const RequestOptions(requiresAuth: true),
    );

    final analysisData = response['analysis'] as Map<String, dynamic>;
    return GasAnalysis.fromJson(analysisData);
  }

  /// Optimize batch size for gas efficiency
  Future<BatchOptimization> optimizeBatchSize({
    required List<ClaimData> claims,
    required String fromAddress,
    double maxGasCostUsd = 50.0,
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      '$_gasEndpoint/optimize',
      data: {
        'claims': claims.map((c) => c.toJson()).toList(),
        'fromAddress': fromAddress,
        'maxGasCostUsd': maxGasCostUsd,
      },
      options: const RequestOptions(requiresAuth: true),
    );

    final optimizationData = response['optimization'] as Map<String, dynamic>;
    return BatchOptimization.fromJson(optimizationData);
  }

  /// Get gas price advice and optimal timing
  Future<GasPriceAdvice> getGasAdvice() async {
    final response = await _client.get<Map<String, dynamic>>(
      '$_gasEndpoint/advice',
    );

    final adviceData = response['advice'] as Map<String, dynamic>;
    return GasPriceAdvice.fromJson(adviceData);
  }
}
