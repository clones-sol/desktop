import 'package:clones_desktop/ui/views/referral/bloc/provider.dart';
import 'package:clones_desktop/ui/views/referral/bloc/state.dart';
import 'package:clones_desktop/application/session/provider.dart';
import 'package:clones_desktop/application/session/state.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_header.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/wallet_connection_section.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_code_card.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_stats_card.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_instructions_card.dart';
import 'package:clones_desktop/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

// Provider to track if we've already tried loading referral info
final _hasTriedLoadingProvider = StateProvider<bool>((ref) => false);

// Provider to track the previous wallet address
final _previousWalletAddressProvider = StateProvider<String?>((ref) => null);

// Provider to track if we've already shown the success confirmation
final _hasShownConfirmationProvider = StateProvider<bool>((ref) => false);

class ReferralContent extends ConsumerWidget {
  const ReferralContent({
    super.key,
    required this.sessionState,
    required this.referralState,
  });

  final Session sessionState;
  final ReferralState referralState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Reset the loading flag when wallet address changes
    final currentWalletAddress = sessionState.address;
    final previousWalletAddress = ref.read(_previousWalletAddressProvider);
    
    if (currentWalletAddress != previousWalletAddress) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(_hasTriedLoadingProvider.notifier).state = false;
        ref.read(_hasShownConfirmationProvider.notifier).state = false;
        ref.read(_previousWalletAddressProvider.notifier).state = currentWalletAddress;
      });
    }

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const ReferralHeader(),
          const SizedBox(height: 32),

          // Content based on wallet connection status
          if (!sessionState.isConnected)
            const WalletConnectionSection()
          else
            _buildReferralInfoSection(context, ref),
        ],
      ),
    );
  }



  Widget _buildReferralInfoSection(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: _buildReferralStateWidget(context, ref),
    );
  }

  Widget _buildReferralStateWidget(BuildContext context, WidgetRef ref) {
    if (referralState is Initial) {
      return _buildInitialState(context, ref);
    } else if (referralState is Loading) {
      return _buildLoadingState();
    } else if (referralState is Success) {
      final successState = referralState as Success;
      return _buildSuccessState(context, ref, successState.referralInfo);
    } else if (referralState is Error) {
      final errorState = referralState as Error;
      return _buildErrorState(context, ref, errorState.message);
    } else {
      return _buildInitialState(context, ref);
    }
  }

  Widget _buildInitialState(BuildContext context, WidgetRef ref) {
    // Auto-load existing referral info when wallet is connected
    final walletAddress = sessionState.address;
    if (walletAddress != null) {
      // Use a flag to prevent infinite loops
      final hasTriedLoading = ref.read(_hasTriedLoadingProvider);
      if (!hasTriedLoading) {
        // Use FutureBuilder to avoid calling the provider during build
        WidgetsBinding.instance.addPostFrameCallback((_) {
          debugPrint('🔍 [ReferralContent] Auto-loading referral info for wallet: $walletAddress');
          ref.read(_hasTriedLoadingProvider.notifier).state = true;
          ref.read(referralNotifierProvider.notifier).getReferralInfo(walletAddress);
        });
      }
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                     Icon(
             Icons.card_giftcard,
             color: ClonesColors.secondaryText,
             size: 80,
           ),
           const SizedBox(height: 24),
           Text(
             'Get Your Referral Code',
             style: Theme.of(context).textTheme.headlineSmall?.copyWith(
               color: ClonesColors.primaryText,
               fontWeight: FontWeight.w600,
             ),
           ),
           const SizedBox(height: 16),
           Text(
             'Generate your unique referral code to start earning rewards.',
             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
               color: ClonesColors.secondaryText,
             ),
             textAlign: TextAlign.center,
           ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              debugPrint('🔍 [ReferralContent] Generate Referral Code button pressed');
              final walletAddress = sessionState.address;
              debugPrint('🔍 [ReferralContent] sessionState.address: $walletAddress');
              debugPrint('🔍 [ReferralContent] sessionState.connectionToken: ${sessionState.connectionToken}');
              debugPrint('🔍 [ReferralContent] sessionState.isConnected: ${sessionState.isConnected}');
              
              if (walletAddress != null) {
                debugPrint('🔍 [ReferralContent] Calling createReferral with walletAddress: $walletAddress');
                ref.read(referralNotifierProvider.notifier).createReferral(walletAddress);
              } else {
                debugPrint('🔍 [ReferralContent] walletAddress is null, cannot create referral');
              }
            },
                         style: ElevatedButton.styleFrom(
               backgroundColor: ClonesColors.containerIcon2,
               foregroundColor: ClonesColors.primaryText,
               padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(8),
               ),
             ),
             child: Text(
               'Generate Referral Code',
               style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                 fontWeight: FontWeight.w600,
               ),
             ),
          ),
        ],
      ),
    );
  }

    Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: ClonesColors.primaryText,
          ),
          const SizedBox(height: 16),
          Text(
            'Loading referral information...',
            style: TextStyle(
              color: ClonesColors.primaryText,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState(BuildContext context, WidgetRef ref, referralInfo) {
    // Show success confirmation when this state is first displayed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final successState = referralState as Success;
      final hasShownConfirmation = ref.read(_hasShownConfirmationProvider);
      
      if (successState.showConfirmation && !hasShownConfirmation) {
        ref.read(_hasShownConfirmationProvider.notifier).state = true;
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                                 Icon(
                   Icons.check_circle,
                   color: ClonesColors.primaryText,
                   size: 20,
                 ),
                 const SizedBox(width: 12),
                 Expanded(
                   child: Text(
                     'Referral code successfully linked to your wallet!',
                     style: TextStyle(
                       color: ClonesColors.primaryText,
                       fontSize: 14,
                       fontWeight: FontWeight.w500,
                     ),
                   ),
                 ),
              ],
            ),
                         backgroundColor: ClonesColors.rewardInfo,
            duration: const Duration(seconds: 4),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.all(16),
          ),
        );
      }
    });

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Referral Code Section
          ReferralCodeCard(referralInfo: referralInfo),
          const SizedBox(height: 24),

          // Stats Section
          ReferralStatsCard(referralInfo: referralInfo),
          const SizedBox(height: 24),

          // Instructions Section
          const ReferralInstructionsCard(),
        ],
      ),
    );
  }







  Widget _buildErrorState(BuildContext context, WidgetRef ref, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                     Icon(
             Icons.error_outline,
             color: ClonesColors.lowScore,
             size: 80,
           ),
           const SizedBox(height: 24),
           Text(
             'Error Loading Referral',
             style: Theme.of(context).textTheme.headlineSmall?.copyWith(
               color: ClonesColors.primaryText,
               fontWeight: FontWeight.w600,
             ),
           ),
           const SizedBox(height: 16),
           Text(
             message,
             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
               color: ClonesColors.secondaryText,
             ),
             textAlign: TextAlign.center,
           ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              final walletAddress = sessionState.address;
              if (walletAddress != null) {
                ref.read(referralNotifierProvider.notifier).createReferral(walletAddress);
              }
            },
                         style: ElevatedButton.styleFrom(
               backgroundColor: ClonesColors.containerIcon2,
               foregroundColor: ClonesColors.primaryText,
               padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(8),
               ),
             ),
             child: Text(
               'Try Again',
               style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                 fontWeight: FontWeight.w600,
               ),
             ),
          ),
        ],
      ),
    );
  }
} 