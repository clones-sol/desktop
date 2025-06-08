import 'package:flutter/material.dart';

enum CardVariant { primary, secondary }

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
        return const EdgeInsets.all(12);
      case CardPadding.medium:
        return const EdgeInsets.all(16);
      case CardPadding.large:
        return const EdgeInsets.all(24);
    }
  }

  BoxDecoration _getDecoration(BuildContext context) {
    switch (variant) {
      case CardVariant.primary:
        return BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color:
                  Theme.of(context).colorScheme.shadow.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        );
      case CardVariant.secondary:
        return BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _getDecoration(context),
      padding: _getPadding(),
      child: child,
    );
  }
}
