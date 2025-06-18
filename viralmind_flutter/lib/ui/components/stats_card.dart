import 'package:auto_size_text/auto_size_text.dart';
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
      variant: CardVariant.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            minFontSize: 14,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: VMColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: AutoSizeText(
              value,
              maxLines: 2,
              minFontSize: 14,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: VMColors.secondary,
                letterSpacing: -0.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
