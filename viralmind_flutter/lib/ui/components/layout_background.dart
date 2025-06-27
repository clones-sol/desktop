import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/sidebar.dart';

class LayoutBackground extends ConsumerWidget {
  const LayoutBackground({
    super.key,
    required this.child,
    this.actions,
  });
  final Widget child;

  final Widget? actions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            Positioned.fill(
              child: Row(
                children: [
                  const SizedBox(
                    width: 100,
                    child: Sidebar(),
                  ),
                  Container(
                    width: 1,
                    height: screenHeight * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withValues(alpha: 0.05),
                          Colors.white.withValues(alpha: 0.2),
                          Colors.white.withValues(alpha: 0.05),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: child),
                        if (actions != null)
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: actions,
                          ),
                      ],
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
