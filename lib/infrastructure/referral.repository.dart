import 'package:clones_desktop/domain/models/api/request_options.dart';
import 'package:clones_desktop/domain/models/referral/create_referral_request.dart';
import 'package:clones_desktop/domain/models/referral/create_referral_response.dart';
import 'package:clones_desktop/domain/models/referral/get_referral_info_response.dart';
import 'package:clones_desktop/domain/models/referral/referral.dart';
import 'package:clones_desktop/domain/models/referral/referral_info.dart';
import 'package:clones_desktop/utils/api_client.dart';

abstract class ReferralRepository {
  Future<CreateReferralResponse> createReferral(String walletAddress);
  Future<GetReferralInfoResponse> getReferralInfo(String walletAddress);
  Future<void> applyReferrerCode(
    String referreeAddress,
    String referrerCode,
  );
  Future<({String? referrerAddress, String? referrerCode})> getReferrerInfo(
    String walletAddress,
  );
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

      final referralInfo = ReferralInfo.fromJson(
          responseData['referralInfo'] as Map<String, dynamic>);
      final referrals = responseData['referrals'] as List<dynamic>;

      return GetReferralInfoResponse(
        walletAddress: referralInfo.walletAddress,
        referralCode: referralInfo.referralCode,
        isActive: referralInfo.isActive,
        totalReferrals: referralInfo.totalReferrals,
        totalRewards: referralInfo.totalRewards,
        createdAt: referralInfo.createdAt,
        lastUpdated: referralInfo.lastUpdated,
        expiresAt: referralInfo.expiresAt,
        referrals: referrals
            .map((e) => Referral.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      throw Exception('Failed to get referral info: $e');
    }
  }

  @override
  Future<void> applyReferrerCode(
    String referreeAddress,
    String referrerCode,
  ) async {
    await _apiClient.post<Map<String, dynamic>>(
      '/referral/apply-referrer-code',
      data: {
        'referreeAddress': referreeAddress,
        'referralCode': referrerCode,
      },
      options: const RequestOptions(requiresAuth: true),
    );
  }

  @override
  Future<({String? referrerAddress, String? referrerCode})> getReferrerInfo(
    String walletAddress,
  ) async {
    final responseData = await _apiClient.get<Map<String, dynamic>>(
      '/referral/referrer/$walletAddress',
      options: const RequestOptions(requiresAuth: true),
    );

    final referrer = responseData['referrer'] as Map<String, dynamic>?;
    if (referrer == null) {
      return (
        referrerAddress: null,
        referrerCode: null,
      );
    }

    return (
      referrerAddress: referrer['walletAddress'] as String?,
      referrerCode: referrer['referralCode'] as String?,
    );
  }
}
