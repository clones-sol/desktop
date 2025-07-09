import 'package:clones/assets.dart';
import 'package:clones/ui/components/card.dart';
import 'package:clones/ui/views/forge_detail/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgeGymGeneralTabGymName extends ConsumerStatefulWidget {
  const ForgeGymGeneralTabGymName({super.key});

  @override
  ConsumerState<ForgeGymGeneralTabGymName> createState() =>
      _ForgeGymGeneralTabGymNameState();
}

class _ForgeGymGeneralTabGymNameState
    extends ConsumerState<ForgeGymGeneralTabGymName> {
  late final TextEditingController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final forgeDetail = ref.read(forgeDetailNotifierProvider);
    controller = TextEditingController(text: forgeDetail.gymName);
  }

  @override
  Widget build(BuildContext context) {
    final forgeDetail = ref.watch(forgeDetailNotifierProvider);
    final theme = Theme.of(context);
    if (forgeDetail.pool == null) return const SizedBox.shrink();

    return Expanded(
      child: CardWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: VMColors.containerIcon4.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.person,
                    color: VMColors.containerIcon4.withValues(alpha: 0.7),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gym Name',
                      style: theme.textTheme.titleSmall,
                    ),
                    Text(
                      'This name will be visible to users.',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: theme.colorScheme.primaryContainer,
                        width: 0.5,
                      ),
                      gradient: VMColors.gradientInputFormBackground,
                    ),
                    child: TextField(
                      controller: controller,
                      onChanged: (value) {
                        ref
                            .read(
                              forgeDetailNotifierProvider.notifier,
                            )
                            .setGymName(value);
                      },
                      style: theme.textTheme.bodyMedium,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 12,
                        ),
                        hintText: 'Enter gym name',
                        hintStyle: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodyMedium?.color!
                              .withValues(alpha: 0.2),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
