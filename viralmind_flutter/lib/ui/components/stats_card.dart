import 'package:flutter/material.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/card.dart';

class StatCard extends StatelessWidget {
  const StatCard({super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      padding: CardPadding.none,
      variant: CardVariant.secondary,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: VMColors.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: VMColors.secondary,
                letterSpacing: -0.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
