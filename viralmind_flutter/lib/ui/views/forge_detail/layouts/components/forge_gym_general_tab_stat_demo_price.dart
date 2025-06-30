import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/card.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/bloc/provider.dart';
import 'package:viralmind_flutter/utils/format_num.dart';

class ForgeGymGeneralTabStatDemoPrice extends ConsumerWidget {
  const ForgeGymGeneralTabStatDemoPrice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pool = ref.watch(forgeDetailNotifierProvider).pool;
    if (pool == null) {
      return const SizedBox.shrink();
    }
    return Expanded(
      child: CardWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: VMColors.containerIcon1.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.card_giftcard,
                    color: VMColors.containerIcon1.withValues(alpha: 0.7),
                    size: 20,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: VMColors.containerIcon1.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    pool.token.symbol,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: VMColors.containerIcon1.withValues(alpha: 0.7),
                          fontSize: 10,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '${formatNumberWithSeparator(pool.pricePerDemo)} ${pool.token.symbol}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              'per demonstration',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
