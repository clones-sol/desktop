import 'package:clones_desktop/domain/models/api/referral_api.dart';
import 'package:clones_desktop/domain/models/referral/referral_info.dart';
import 'package:clones_desktop/domain/models/api/request_options.dart';
import 'package:clones_desktop/utils/api_client.dart';
import 'package:flutter/foundation.dart';

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
      debugPrint('🔍 [ReferralRepository] createReferral called with walletAddress: $walletAddress');
      final request = CreateReferralRequest(walletAddress: walletAddress);
      debugPrint('🔍 [ReferralRepository] Request data: ${request.toJson()}');
      
      final responseData = await _apiClient.post<Map<String, dynamic>>(
        '/referral/generate-code',
        data: request.toJson(),
        options: const RequestOptions(requiresAuth: true),
      );
      
      debugPrint('🔍 [ReferralRepository] API response: $responseData');
      
      // The API client already handles the success/data wrapper, so we get the data directly
      final referralData = CreateReferralData.fromJson(responseData);
      
      // Create the response object with success=true since the API client already validated it
      return CreateReferralResponse(
        success: true,
        data: referralData,
        message: null,
      );
    } catch (e) {
      debugPrint('🔍 [ReferralRepository] Exception in createReferral: $e');
      throw Exception('Failed to create referral: $e');
    }
  }

  @override
  Future<GetReferralInfoResponse> getReferralInfo(String walletAddress) async {
    try {
      debugPrint('🔍 [ReferralRepository] getReferralInfo called with walletAddress: $walletAddress');
      
      final responseData = await _apiClient.get<Map<String, dynamic>>(
        '/referral/stats/$walletAddress',
        options: const RequestOptions(requiresAuth: true),
      );

      debugPrint('🔍 [ReferralRepository] getReferralInfo API response: $responseData');
      
      // The API client already handles the success/data wrapper, so we get the data directly
      final referralData = GetReferralInfoData.fromJson(responseData);
      
      // Create the response object with success=true since the API client already validated it
      return GetReferralInfoResponse(
        success: true,
        data: referralData,
        message: null,
      );
    } catch (e) {
      debugPrint('🔍 [ReferralRepository] Exception in getReferralInfo: $e');
      throw Exception('Failed to get referral info: $e');
    }
  }
} 