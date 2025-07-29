import 'package:clones_desktop/domain/models/api/referral_api.dart';
import 'package:clones_desktop/domain/models/referral/referral_info.dart';
import 'package:clones_desktop/utils/api_client.dart';

abstract class ReferralRepository {
  Future<CreateReferralResponse> createReferral(String walletAddress);
  Future<GetReferralInfoResponse> getReferralInfo(String walletAddress);
}

class ReferralRepositoryImpl implements ReferralRepository {
  final ApiClient _apiClient;

  ReferralRepositoryImpl(this._apiClient);

  @override
  Future<CreateReferralResponse> createReferral(String walletAddress) async {
    try {
      final request = CreateReferralRequest(walletAddress: walletAddress);
      final response = await _apiClient.post<Map<String, dynamic>>(
        '/referral/generate-code',
        data: request.toJson(),
      );

      return CreateReferralResponse.fromJson(response);
    } catch (e) {
      throw Exception('Failed to create referral: $e');
    }
  }

  @override
  Future<GetReferralInfoResponse> getReferralInfo(String walletAddress) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '/referral/stats/$walletAddress',
      );

      return GetReferralInfoResponse.fromJson(response);
    } catch (e) {
      throw Exception('Failed to get referral info: $e');
    }
  }
} 