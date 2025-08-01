import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/views/forge/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgeNewFactoryCard extends ConsumerWidget {
  const ForgeNewFactoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return CardWidget(
      variant: CardVariant.secondary,
      child: InkWell(
        onTap: () {
          ref
              .read(forgeNotifierProvider.notifier)
              .setShowGenerateFactoryModal(true);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    Colors.transparent,
                    ClonesColors.secondary,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Image.asset(
                Assets.factoryAddIcon,
                width: 100,
                height: 100,
                color: ClonesColors.primary,
              ),
            ),
            const SizedBox(height: 5),
            Column(
              children: [
                Text(
                  'Create New Factory',
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 5),
                Text(
                  'Start collecting demonstrations for your AI agent training',
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
