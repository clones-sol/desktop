import 'package:clones/assets.dart';
import 'package:clones/ui/components/card.dart';
import 'package:clones/ui/views/forge_detail/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgeGymGeneralTabPricePerDemo extends ConsumerStatefulWidget {
  const ForgeGymGeneralTabPricePerDemo({super.key});

  @override
  ConsumerState<ForgeGymGeneralTabPricePerDemo> createState() =>
      _ForgeGymGeneralTabPricePerDemoState();
}

class _ForgeGymGeneralTabPricePerDemoState
    extends ConsumerState<ForgeGymGeneralTabPricePerDemo> {
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
    controller =
        TextEditingController(text: forgeDetail.pricePerDemo.toString());
  }

  @override
  Widget build(BuildContext context) {
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
                    color: VMColors.containerIcon1.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.price_check_outlined,
                    color: VMColors.containerIcon3.withValues(alpha: 0.7),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price per demonstration',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      'Set the price for each demonstration. Minimum price: 1 $tokenSymbol',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            width: 0.5,
                          ),
                          gradient: VMColors.gradientInputFormBackground,
                        ),
                        child: TextField(
                          onChanged: (value) {
                            ref
                                .read(
                                  forgeDetailNotifierProvider.notifier,
                                )
                                .setPricePerDemo(
                                  double.tryParse(value) ?? 0,
                                );
                          },
                          controller: controller,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,),
                          style: Theme.of(context).textTheme.bodyMedium,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,1}'),
                            ),
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 12,
                            ),
                            hintText: 'Reward per demo',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.color!
                                      .withValues(alpha: 0.2),
                                ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            tokenSymbol,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
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
