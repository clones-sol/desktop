import 'package:clones_desktop/domain/models/api/create_referral_request.dart';
import 'package:clones_desktop/domain/models/api/create_referral_response.dart';
import 'package:clones_desktop/domain/models/api/get_referral_info_response.dart';
import 'package:clones_desktop/domain/models/api/request_options.dart';
import 'package:clones_desktop/utils/api_client.dart';

abstract class ReferralRepository {
  Future<CreateReferralResponse> createReferral(String walletAddress);
  Future<GetReferralInfoResponse> getReferralInfo(String walletAddress);
}

class ReferralRepositoryImpl implements ReferralRepository {
  const ReferralRepositoryImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<CreateReferralResponse> createReferral(String walletAddress) async {
    try {
      final request = CreateReferralRequest(walletAddress: walletAddress);

      final responseData = await _apiClient.post<Map<String, dynamic>>(
        '/referral/generate-code',
        data: request.toJson(),
        options: const RequestOptions(requiresAuth: true),
      );

      // The API client already handles the success/data wrapper, so we get the data directly
      return CreateReferralResponse.fromJson(responseData);
    } catch (e) {
      throw Exception('Failed to create referral: $e');
    }
  }

  @override
  Future<GetReferralInfoResponse> getReferralInfo(String walletAddress) async {
    try {
      final responseData = await _apiClient.get<Map<String, dynamic>>(
        '/referral/stats/$walletAddress',
        options: const RequestOptions(requiresAuth: true),
      );

      // The API client already handles the success/data wrapper, so we get the data directly
      return GetReferralInfoResponse.fromJson(responseData);
    } catch (e) {
      throw Exception('Failed to get referral info: $e');
    }
  }
}
