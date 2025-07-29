import 'package:clones_desktop/domain/models/api/referral_api.dart';
import 'package:clones_desktop/domain/models/referral/referral_info.dart';
import 'package:clones_desktop/infrastructure/referral.repository.dart';
import 'package:clones_desktop/utils/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    state = const ReferralState.loading();
    
    try {
      final response = await _repository.createReferral(walletAddress);
      
      if (response.success) {
        final referralInfo = ReferralInfo(
          referralCode: response.referralCode,
          referralLink: response.referralLink,
          walletAddress: response.walletAddress,
          totalReferrals: 0,
          totalRewards: 0.0,
          isActive: true,
          createdAt: DateTime.now(),
        );
        
        state = ReferralState.success(referralInfo);
      } else {
        state = ReferralState.error(response.message ?? 'Failed to create referral');
      }
    } catch (e) {
      state = ReferralState.error(e.toString());
    }
  }

  Future<void> getReferralInfo(String walletAddress) async {
    state = const ReferralState.loading();
    
    try {
      final response = await _repository.getReferralInfo(walletAddress);
      
      if (response.success) {
        final referralInfo = ReferralInfo(
          referralCode: response.referralCode,
          referralLink: response.referralLink,
          walletAddress: response.walletAddress,
          totalReferrals: response.totalReferrals,
          totalRewards: response.totalRewards,
          isActive: response.isActive,
          createdAt: response.createdAt,
          lastUpdated: response.lastUpdated,
        );
        
        state = ReferralState.success(referralInfo);
      } else {
        state = ReferralState.error(response.message ?? 'Failed to get referral info');
      }
    } catch (e) {
      state = ReferralState.error(e.toString());
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
  const factory ReferralState.success(ReferralInfo referralInfo) = Success;
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
  const Success(this.referralInfo);
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