import 'package:clones_desktop/domain/models/api/create_referral_request.dart';
import 'package:clones_desktop/domain/models/api/create_referral_response.dart';
import 'package:clones_desktop/domain/models/api/create_referral_data.dart';
import 'package:clones_desktop/domain/models/api/get_referral_info_response.dart';
import 'package:clones_desktop/domain/models/api/get_referral_info_data.dart';
import 'package:clones_desktop/domain/models/referral/referral_info.dart';
import 'package:clones_desktop/infrastructure/referral.repository.dart';
import 'package:clones_desktop/utils/api_client.dart';
import 'package:clones_desktop/ui/views/referral/bloc/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart';

part 'provider.g.dart';

@riverpod
ReferralRepository referralRepository(ReferralRepositoryRef ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ReferralRepositoryImpl(apiClient);
}

@riverpod
class ReferralNotifier extends _$ReferralNotifier {
  @override
  ReferralState build() {
    return const ReferralState.initial();
  }

  Future<void> createReferral(String walletAddress) async {
    debugPrint('🔍 [ReferralNotifier] createReferral called with walletAddress: $walletAddress');
    state = const ReferralState.loading();
    
    try {
      debugPrint('🔍 [ReferralNotifier] Calling repository.createReferral...');
      final repository = ref.read(referralRepositoryProvider);
      final response = await repository.createReferral(walletAddress);
      debugPrint('🔍 [ReferralNotifier] Repository response: $response');
      
      if (response.success) {
        final referralInfo = ReferralInfo(
          referralCode: response.data.referralCode,
          referralLink: response.data.referralLink,
          walletAddress: response.data.walletAddress,
          totalReferrals: 0,
          totalRewards: 0.0,
          isActive: true,
          createdAt: DateTime.now(),
        );
        
        debugPrint('🔍 [ReferralNotifier] Setting success state with referralInfo: $referralInfo');
        state = ReferralState.success(referralInfo, showConfirmation: true);
      } else {
        debugPrint('🔍 [ReferralNotifier] Setting error state: ${response.message}');
        state = ReferralState.error(response.message ?? 'Failed to create referral');
      }
    } catch (e) {
      debugPrint('🔍 [ReferralNotifier] Exception caught: $e');
      state = ReferralState.error(e.toString());
    }
  }

  Future<void> getReferralInfo(String walletAddress) async {
    state = const ReferralState.loading();
    
    try {
      debugPrint('🔍 [ReferralNotifier] getReferralInfo called with walletAddress: $walletAddress');
      final repository = ref.read(referralRepositoryProvider);
      final response = await repository.getReferralInfo(walletAddress);
      debugPrint('🔍 [ReferralNotifier] getReferralInfo response: $response');
      debugPrint('🔍 [ReferralNotifier] response.success: ${response.success}');
      debugPrint('🔍 [ReferralNotifier] response.data: ${response.data}');
      
      if (response.success) {
        // Check if the referral code is empty or null
        if (response.data.referralCode == null || response.data.referralCode.isEmpty) {
          debugPrint('🔍 [ReferralNotifier] Referral code is empty/null, showing initial state');
          state = const ReferralState.initial();
          return;
        }
        
        // Construct the referral link using the referral code
        final referralLink = 'https://clones-ai.com/ref/${response.data.referralCode}';
        
        final referralInfo = ReferralInfo(
          referralCode: response.data.referralCode,
          referralLink: referralLink, // Use the constructed link
          walletAddress: walletAddress, // Use the requested wallet address
          totalReferrals: response.data.totalReferrals,
          totalRewards: response.data.totalRewards,
          isActive: true, // Assume active if we get data
          createdAt: DateTime.now(), // Backend doesn't provide this in stats
          lastUpdated: DateTime.now(),
        );
        
        debugPrint('🔍 [ReferralNotifier] Setting success state with referralInfo: $referralInfo');
        state = ReferralState.success(referralInfo, showConfirmation: false);
      } else {
        debugPrint('🔍 [ReferralNotifier] Setting error state: ${response.message}');
        state = ReferralState.error(response.message ?? 'Failed to get referral info');
      }
    } catch (e) {
      debugPrint('🔍 [ReferralNotifier] Exception in getReferralInfo: $e');
      
      // If it's a 404 error (wallet doesn't have referral code), show initial state instead of error
      if (e.toString().contains('404') || e.toString().contains('not found')) {
        debugPrint('🔍 [ReferralNotifier] Wallet has no referral code, showing initial state');
        state = const ReferralState.initial();
      } else {
        state = ReferralState.error(e.toString());
      }
    }
  }

  void reset() {
    state = const ReferralState.initial();
  }
} 