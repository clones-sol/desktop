import 'package:clones_desktop/domain/models/api/referral_api.dart';
import 'package:clones_desktop/domain/models/referral/referral_info.dart';
import 'package:clones_desktop/infrastructure/referral.repository.dart';
import 'package:clones_desktop/utils/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

// Repository provider
final referralRepositoryProvider = Provider<ReferralRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ReferralRepositoryImpl(apiClient);
});

// Referral state notifier
class ReferralNotifier extends StateNotifier<ReferralState> {
  final ReferralRepository _repository;

  ReferralNotifier(this._repository) : super(const ReferralState.initial());

  Future<void> createReferral(String walletAddress) async {
    debugPrint('🔍 [ReferralNotifier] createReferral called with walletAddress: $walletAddress');
    state = const ReferralState.loading();
    
    try {
      debugPrint('🔍 [ReferralNotifier] Calling repository.createReferral...');
      final response = await _repository.createReferral(walletAddress);
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
      final response = await _repository.getReferralInfo(walletAddress);
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

// Referral state
sealed class ReferralState {
  const ReferralState();

  const factory ReferralState.initial() = Initial;
  const factory ReferralState.loading() = Loading;
  const factory ReferralState.success(ReferralInfo referralInfo, {bool showConfirmation}) = Success;
  const factory ReferralState.error(String message) = Error;
}

class Initial extends ReferralState {
  const Initial();
}

class Loading extends ReferralState {
  const Loading();
}

class Success extends ReferralState {
  final ReferralInfo referralInfo;
  final bool showConfirmation;
  const Success(this.referralInfo, {this.showConfirmation = false});
}

class Error extends ReferralState {
  final String message;
  const Error(this.message);
}

// Provider for the referral notifier
final referralNotifierProvider = StateNotifierProvider<ReferralNotifier, ReferralState>((ref) {
  final repository = ref.watch(referralRepositoryProvider);
  return ReferralNotifier(repository);
}); 