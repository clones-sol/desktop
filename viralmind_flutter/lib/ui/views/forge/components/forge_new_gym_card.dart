import 'package:flutter/material.dart';
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
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context)
                        .colorScheme
                        .secondary
                        .withValues(alpha: 0.2),
                    Theme.of(context)
                        .colorScheme
                        .secondary
                        .withValues(alpha: 0.3),
                  ],
                ),
                borderRadius: BorderRadius.circular(48),
              ),
              child: const Center(
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w300),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Create New Gym',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Theme.of(context)
                    .colorScheme
                    .secondary
                    .withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start collecting demonstrations for your AI agent training',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.6),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
