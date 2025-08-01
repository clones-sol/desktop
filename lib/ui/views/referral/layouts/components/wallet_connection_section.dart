import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/wallet_button.dart';
import 'package:flutter/material.dart';

class WalletConnectionSection extends StatelessWidget {
  const WalletConnectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle_outlined,
              color: ClonesColors.secondaryText,
              size: 80,
            ),
            const SizedBox(height: 24),
            Text(
              'Connect Your Wallet',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: ClonesColors.primaryText,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              'Connect your Solana wallet to access your referral program and start earning rewards.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ClonesColors.secondaryText,
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
}
