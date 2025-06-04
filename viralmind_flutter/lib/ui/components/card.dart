import 'package:flutter/material.dart';

enum CardVariant { defaultVariant, primary, secondary }

enum CardPadding { sm, md, lg, none }

class CardWidget extends StatelessWidget {
  final CardVariant variant;
  final CardPadding padding;
  final Widget? child;

  const CardWidget({
    super.key,
    this.variant = CardVariant.defaultVariant,
    this.padding = CardPadding.md,
    this.child,
  });

  EdgeInsetsGeometry getPadding() {
    switch (padding) {
      case CardPadding.sm:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 6);
      case CardPadding.md:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 10);
      case CardPadding.lg:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
      case CardPadding.none:
        return EdgeInsets.zero;
    }
  }

  BoxDecoration getDecoration(BuildContext context) {
    switch (variant) {
      case CardVariant.defaultVariant:
        return BoxDecoration(
          color: Colors.white.withValues(alpha: 0.5),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        );
      case CardVariant.primary:
        return BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        );
      case CardVariant.secondary:
        return BoxDecoration(
          color: Colors.grey.shade50,
          border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: getDecoration(context),
      padding: getPadding(),
      child: child,
    );
  }
}
