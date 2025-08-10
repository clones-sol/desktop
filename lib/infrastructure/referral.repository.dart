import 'package:clones_desktop/domain/models/api/request_options.dart';
import 'package:clones_desktop/domain/models/referral/create_referral_request.dart';
import 'package:clones_desktop/domain/models/referral/create_referral_response.dart';
import 'package:clones_desktop/domain/models/referral/get_referral_info_response.dart';
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

      return GetReferralInfoResponse.fromJson(responseData);
    } catch (e) {
      throw Exception('Failed to get referral info: $e');
    }
  }

  /* @swagger
 * /referral/stats/{walletAddress}:
 *   get:
 *     summary: Get referral statistics for a wallet
 *     description: Retrieves comprehensive referral statistics for a specific wallet address, including total referrals, rewards earned, and performance metrics.
 *     tags: [Referral System]
 *     security:
 *       - walletAuth: []
 *     parameters:
 *       - in: path
 *         name: walletAddress
 *         required: true
 *         schema:
 *           type: string
 *         description: The Solana wallet address to get statistics for
 *         example: "E8fgSKVQYf93xNrJhPWdQZi4Rz5fL4WDJLM727Pe2P97"
 *     responses:
 *       200:
 *         description: Referral statistics retrieved successfully
 *         content:
 *           application/json:
 *             schema:
 *               allOf:
 *                 - $ref: '#/components/schemas/SuccessResponse'
 *                 - type: object
 *                   properties:
 *                     data:
 *                       type: object
 *                       properties:
 *                         referralInfo:
 *                           type: object
 *                           nullable: true
 *                           description: Information about the user's referral code.
 *                           properties:
 *                             walletAddress:
 *                               type: string
 *                             referralCode:
 *                               type: string
 *                             isActive:
 *                               type: boolean
 *                             totalReferrals:
 *                               type: number
 *                             totalRewards:
 *                               type: number
 *                             createdAt:
 *                               type: string
 *                               format: date-time
 *                             expiresAt:
 *                               type: string
 *                               format: date-time
 *                         referrals:
 *                           type: array
 *                           description: List of users referred by this wallet.
 *                           items:
 *                             type: object
 *                             properties:
 *                               referreeAddress:
 *                                 type: string
 *                               status:
 *                                 type: string
 *                               createdAt:
 *                                 type: string
 *                                 format: date-time
 *       429:
 *         description: Too many requests
 *       500:
 *         description: Internal server error
 */
}
