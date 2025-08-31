import 'package:clones_desktop/ui/components/factory_status_badge.dart';
import 'package:clones_desktop/ui/views/forge_detail/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgeFactoryHeader extends ConsumerWidget {
  const ForgeFactoryHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final factory = ref.watch(forgeDetailNotifierProvider).factory;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            factory?.name ?? '',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: 20),
          if (factory != null)
            Align(
              alignment: Alignment.topRight,
              child: FactoryStatusBadge(status: factory.status),
            ),
        ],
      ),
    );
  }
}
