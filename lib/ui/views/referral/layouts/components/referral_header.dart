import 'package:clones_desktop/assets.dart';
import 'package:flutter/material.dart';

class ReferralHeader extends StatelessWidget {
  const ReferralHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.share,
          color: ClonesColors.primaryText,
          size: 32,
        ),
        const SizedBox(width: 16),
        Text(
          'Referral Program',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ClonesColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
