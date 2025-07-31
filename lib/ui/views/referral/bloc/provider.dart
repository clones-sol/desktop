import 'package:clones_desktop/domain/models/api/create_referral_request.dart';
import 'package:clones_desktop/domain/models/api/create_referral_response.dart';
import 'package:clones_desktop/domain/models/api/get_referral_info_response.dart';
import 'package:clones_desktop/domain/models/api/api_error.dart';
import 'package:clones_desktop/domain/models/referral/referral_info.dart';
import 'package:clones_desktop/infrastructure/referral.repository.dart';
import 'package:clones_desktop/utils/api_client.dart';
import 'package:clones_desktop/utils/env.dart';
import 'package:clones_desktop/ui/views/referral/bloc/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'provider.g.dart';

@riverpod
ReferralRepository referralRepository(Ref ref) {
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
    state = const ReferralState.loading();
    
    try {
      final repository = ref.read(referralRepositoryProvider);
      final response = await repository.createReferral(walletAddress);
      
      final referralInfo = ReferralInfo(
        referralCode: response.referralCode,
        referralLink: response.referralLink,
        walletAddress: response.walletAddress,
        totalReferrals: 0,
        totalRewards: 0.0,
        isActive: true,
        createdAt: DateTime.now(),
      );
      
      state = ReferralState.success(referralInfo, showConfirmation: true);
    } catch (e) {
      state = ReferralState.error(e.toString());
    }
  }

  Future<void> getReferralInfo(String walletAddress) async {
    state = const ReferralState.loading();
    
    try {
      final repository = ref.read(referralRepositoryProvider);
      final response = await repository.getReferralInfo(walletAddress);
      
      // Check if the referral code is empty
      if (response.referralCode.isEmpty) {
        state = const ReferralState.initial();
        return;
      }
      
      // Construct the referral link using the API_WEBSITE_URL
      final referralLink = '${Env.apiWebsiteUrl}/ref/${response.referralCode}';
      
      final referralInfo = ReferralInfo(
        referralCode: response.referralCode,
        referralLink: referralLink,
        walletAddress: walletAddress,
        totalReferrals: response.totalReferrals,
        totalRewards: response.totalRewards,
        isActive: true,
        createdAt: DateTime.now(), // Backend doesn't provide this in stats
        lastUpdated: DateTime.now(),
      );
      
      state = ReferralState.success(referralInfo, showConfirmation: false);
    } catch (e) {
      // Handle specific API errors
      if (e is ApiError) {
        // If it's a 404 error (wallet doesn't have referral code), show initial state instead of error
        if (e.status == 404) {
          state = const ReferralState.initial();
        } else {
          state = ReferralState.error(e.message);
        }
      } else {
        // Handle other types of exceptions
        state = ReferralState.error(e.toString());
      }
    }
  }

  void reset() {
    state = const ReferralState.initial();
  }
} 