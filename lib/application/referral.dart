import 'package:clones_desktop/domain/models/referral/referral_info.dart';
import 'package:clones_desktop/infrastructure/referral.repository.dart';
import 'package:clones_desktop/utils/api_client.dart';
import 'package:clones_desktop/utils/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'referral.g.dart';

@riverpod
ReferralRepository referralRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ReferralRepositoryImpl(apiClient);
}

@riverpod
Future<ReferralInfo?> getReferralInfo(Ref ref, String walletAddress) async {
  try {
    final repository = ref.watch(referralRepositoryProvider);
    final response = await repository.getReferralInfo(walletAddress);
    // Check if the referral code is empty
    if (response.referralCode.isEmpty) {
      return null;
    }

    final referralLink =
        '${Env.apiWebsiteUrl}/referral/${response.referralCode}';

    final referralInfo = ReferralInfo(
      referralCode: response.referralCode,
      referralLink: referralLink,
      walletAddress: walletAddress,
      totalReferrals: response.totalReferrals,
      totalRewards: response.totalRewards,
      isActive: true,
      createdAt: DateTime
          .now(), // TODO(diamondly777): Backend doesn't provide this in stats
      lastUpdated: DateTime.now(),
    );

    return referralInfo;
  } catch (e) {
    rethrow;
  }
}
