import 'package:clones_desktop/application/referral/provider.dart';
import 'package:clones_desktop/application/session/provider.dart';
import 'package:clones_desktop/application/session/state.dart';
import 'package:clones_desktop/ui/components/wallet_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

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
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(
                Icons.share,
                color: Colors.white,
                size: 32,
              ),
              const SizedBox(width: 16),
              Text(
                'Referral Program',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Content based on wallet connection status
          if (!sessionState.isConnected)
            _buildWalletConnectionSection(context, ref)
          else
            _buildReferralInfoSection(context, ref),
        ],
      ),
    );
  }

  Widget _buildWalletConnectionSection(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle_outlined,
              color: Colors.white.withOpacity(0.6),
              size: 80,
            ),
            const SizedBox(height: 24),
            Text(
              'Connect Your Wallet',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Connect your Solana wallet to access your referral program and start earning rewards.',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            const WalletButton(),
          ],
        ),
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
      // Use FutureBuilder to avoid calling the provider during build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        debugPrint('🔍 [ReferralContent] Auto-loading referral info for wallet: $walletAddress');
        ref.read(referralNotifierProvider.notifier).getReferralInfo(walletAddress);
      });
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.card_giftcard,
            color: Colors.white.withOpacity(0.6),
            size: 80,
          ),
          const SizedBox(height: 24),
          Text(
            'Get Your Referral Code',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Generate your unique referral code to start earning rewards.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 16,
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
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Generate Referral Code',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.white,
          ),
          SizedBox(height: 16),
          Text(
            'Loading referral information...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState(BuildContext context, WidgetRef ref, referralInfo) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Referral Code Section
          _buildReferralCodeCard(context, referralInfo),
          const SizedBox(height: 24),

          // Stats Section
          _buildStatsCard(referralInfo),
          const SizedBox(height: 24),

          // Instructions Section
          _buildInstructionsCard(),
        ],
      ),
    );
  }

  Widget _buildReferralCodeCard(BuildContext context, referralInfo) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.link,
                color: Colors.blue,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'Your Referral Link',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    referralInfo.referralLink,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: referralInfo.referralLink));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Referral link copied to clipboard!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.blue,
                    size: 20,
                  ),
                  tooltip: 'Copy link',
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Referral Code: ${referralInfo.referralCode}',
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard(referralInfo) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.analytics,
                color: Colors.green,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'Your Stats',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Total Referrals',
                  '${referralInfo.totalReferrals}',
                  Icons.people,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildStatItem(
                  'Total Rewards',
                  '${referralInfo.totalRewards.toStringAsFixed(2)} SOL',
                  Icons.monetization_on,
                  Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInstructionsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.orange,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'How It Works',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInstructionStep(
            1,
            'Share your referral link with friends',
            'Send your unique referral link to people you know who might be interested in Clones.',
          ),
          const SizedBox(height: 16),
          _buildInstructionStep(
            2,
            'They sign up using your link',
            'When someone uses your referral link to sign up, they\'ll be automatically linked to your account.',
          ),
          const SizedBox(height: 16),
          _buildInstructionStep(
            3,
            'Earn rewards together',
            'You\'ll earn rewards when your referrals complete tasks and contribute to the platform.',
          ),
        ],
      ),
    );
  }

  Widget _buildInstructionStep(int step, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              '$step',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 80,
          ),
          const SizedBox(height: 24),
          Text(
            'Error Loading Referral',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 16,
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
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Try Again',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
} 