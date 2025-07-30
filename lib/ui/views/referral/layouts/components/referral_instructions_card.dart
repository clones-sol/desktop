import 'package:flutter/material.dart';
import 'package:clones_desktop/assets.dart';

class ReferralInstructionsCard extends StatelessWidget {
  const ReferralInstructionsCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                color: ClonesColors.containerIcon3,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'How It Works',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ClonesColors.primaryText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInstructionStep(
            context,
            1,
            'Share your referral link with friends',
            'Send your unique referral link to people you know who might be interested in Clones.',
          ),
          const SizedBox(height: 16),
          _buildInstructionStep(
            context,
            2,
            'They sign up using your link',
            'When someone uses your referral link to sign up, they\'ll be automatically linked to your account.',
          ),
          const SizedBox(height: 16),
          _buildInstructionStep(
            context,
            3,
            'Earn rewards together',
            'You\'ll earn rewards when your referrals complete tasks and contribute to the platform.',
          ),
        ],
      ),
    );
  }

  Widget _buildInstructionStep(
    BuildContext context,
    int step,
    String title,
    String description,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: ClonesColors.containerIcon2,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              '$step',
              style: TextStyle(
                color: ClonesColors.primaryText,
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
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ClonesColors.primaryText,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ClonesColors.secondaryText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 