import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/views/forge_detail/bloc/provider.dart';
import 'package:clones_desktop/utils/format_num.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgeGymGeneralTabStatGasBalance extends ConsumerWidget {
  const ForgeGymGeneralTabStatGasBalance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pool = ref.watch(forgeDetailNotifierProvider).pool;
    if (pool == null) {
      return const SizedBox.shrink();
    }
    final theme = Theme.of(context);
    return Expanded(
      child: CardWidget(
        child: Stack(
          children: [
            if (pool.solBalance! > 0)
              Positioned(
                bottom: 0,
                right: 0,
                child: BtnPrimary(
                  buttonText: 'Withdraw',
                  btnPrimaryType: BtnPrimaryType.outlinePrimary,
                  onTap: () {
                    // TODO(reddwarf03): implement
                  },
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: VMColors.containerIcon3.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.local_gas_station,
                        color: VMColors.containerIcon3.withValues(alpha: 0.7),
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  '${formatNumberWithSeparator(pool.solBalance)} \$SOL',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'available for gas',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
