import 'package:clones_desktop/ui/components/gym_status.dart';
import 'package:clones_desktop/ui/views/forge_detail/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgeGymHeader extends ConsumerWidget {
  const ForgeGymHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final pool = ref.watch(forgeDetailNotifierProvider).pool;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            pool?.name ?? '',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: 20),
          if (pool != null)
            Align(
              alignment: Alignment.topRight,
              child: GymStatus(status: pool.status),
            ),
        ],
      ),
    );
  }
}
