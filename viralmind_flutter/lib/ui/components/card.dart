import 'package:flutter/material.dart';
import 'package:viralmind_flutter/assets.dart';

enum CardVariant { primary, secondary, black }

enum CardPadding { none, small, medium, large }

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    this.variant = CardVariant.primary,
    this.padding = CardPadding.medium,
    required this.child,
    this.className,
  });
  final CardVariant variant;
  final CardPadding padding;
  final Widget child;
  final String? className;

  EdgeInsets _getPadding() {
    switch (padding) {
      case CardPadding.none:
        return EdgeInsets.zero;
      case CardPadding.small:
        return const EdgeInsets.all(8);
      case CardPadding.medium:
        return const EdgeInsets.all(16);
      case CardPadding.large:
        return const EdgeInsets.all(24);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _getPadding(),
      decoration: BoxDecoration(
        color: variant == CardVariant.primary
            ? VMColors.primary.withValues(alpha: 0.1)
            : variant == CardVariant.secondary
                ? VMColors.secondary.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: variant == CardVariant.primary
              ? VMColors.primary.withValues(alpha: 0.2)
              : variant == CardVariant.secondary
                  ? VMColors.secondary.withValues(alpha: 0.2)
                  : Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: child,
    );
  }
}
