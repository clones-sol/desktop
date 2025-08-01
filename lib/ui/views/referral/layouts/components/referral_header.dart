import 'package:clones_desktop/assets.dart';
import 'package:flutter/material.dart';

class ReferralHeader extends StatelessWidget {
  const ReferralHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Referral Program',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            color: ClonesColors.secondaryText,
          ),
        ),
      ],
    );
  }
}
