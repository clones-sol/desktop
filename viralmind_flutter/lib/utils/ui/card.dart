import 'package:flutter/material.dart';

enum AppCardVariant { primary, secondary }

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.variant,
    required this.child,
    this.padding,
  });

  final AppCardVariant variant;
  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: variant == AppCardVariant.primary ? Colors.blue : Colors.grey[300],
      child: Padding(
        padding: padding ?? const EdgeInsets.all(8),
        child: child,
      ),
    );
  }
}
