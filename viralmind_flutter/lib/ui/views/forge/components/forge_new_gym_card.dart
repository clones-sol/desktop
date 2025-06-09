import 'package:flutter/material.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/card.dart';

class ForgeNewGymCard extends StatelessWidget {
  const ForgeNewGymCard({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      variant: CardVariant.secondary,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    Colors.transparent,
                    VMColors.secondary,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Image.asset(
                Assets.gymAddIcon,
                width: 100,
                height: 100,
                color: VMColors.primary,
              ),
            ),
            const SizedBox(height: 5),
            Column(
              children: [
                const Text(
                  'Create New Gym',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: VMColors.primaryText,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Start collecting demonstrations for your AI agent training',
                  style: TextStyle(
                    fontSize: 12,
                    color: VMColors.secondaryText,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
