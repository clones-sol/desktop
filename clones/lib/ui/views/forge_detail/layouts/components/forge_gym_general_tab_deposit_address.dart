import 'package:clones/assets.dart';
import 'package:clones/ui/components/card.dart';
import 'package:clones/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones/ui/views/forge_detail/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgeGymGeneralTabDepositAddress extends ConsumerWidget {
  const ForgeGymGeneralTabDepositAddress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgeDetail = ref.watch(forgeDetailNotifierProvider);

    if (forgeDetail.pool == null) return const SizedBox.shrink();

    final tokenSymbol = forgeDetail.pool!.token.symbol;

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
                    color: VMColors.containerIcon2.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.call_received,
                    color: VMColors.containerIcon2.withValues(alpha: 0.7),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deposit Address',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      'Send $tokenSymbol tokens to fund this gym',
                      style: Theme.of(context).textTheme.bodySmall,
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
                      gradient: VMColors.gradientInputFormBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                      child: SelectableText(
                        forgeDetail.pool!.depositAddress,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                BtnPrimary(
                  buttonText: 'Copy',
                  onTap: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: forgeDetail.pool!.depositAddress,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Address copied!'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
