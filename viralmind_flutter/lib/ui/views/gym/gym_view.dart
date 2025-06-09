import 'package:flutter/material.dart';
import 'package:viralmind_flutter/assets.dart';

class GymView extends StatelessWidget {
  const GymView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final screenWidth = constraints.maxWidth;
        final bandHeight = screenHeight * 0.6;
        final logoSize = screenWidth * 0.25;
        const minLogoSize = 120.0;
        const maxLogoSize = 400.0;
        final clampedLogoSize = logoSize.clamp(minLogoSize, maxLogoSize);

        return Stack(
          alignment: Alignment.center,
          children: [
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.background),
                    fit: BoxFit.cover,
                    alignment: Alignment.centerRight,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              color: const Color.fromARGB(255, 208, 179, 206)
                  .withValues(alpha: 0.05),
            ),
            Positioned(
              top: bandHeight * 1.3 - clampedLogoSize / 2,
              right: 50,
              child: Opacity(
                opacity: 0.05,
                child: Image.asset(
                  Assets.logoIcon,
                  width: clampedLogoSize,
                  height: clampedLogoSize,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.05,
              left: screenWidth * 0.05,
              child: Row(
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      Assets.logoIcon,
                      width: screenWidth * 0.07,
                      height: screenWidth * 0.07,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.015,
                  ),
                  Text(
                    'COMPUTER-USE AI FOR EVERYONE',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: (screenWidth * 0.035).clamp(
                            18.0,
                            40.0,
                          ),
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.5,
                          height: 1.5,
                        ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
