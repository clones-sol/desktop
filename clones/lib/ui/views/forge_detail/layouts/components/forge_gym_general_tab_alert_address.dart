import 'package:clones/assets.dart';
import 'package:clones/ui/components/card.dart';
import 'package:clones/ui/views/forge_detail/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgeGymGeneralTabAlertAddress extends ConsumerStatefulWidget {
  const ForgeGymGeneralTabAlertAddress({super.key});

  @override
  ConsumerState<ForgeGymGeneralTabAlertAddress> createState() =>
      _ForgeGymGeneralTabAlertAddressState();
}

class _ForgeGymGeneralTabAlertAddressState
    extends ConsumerState<ForgeGymGeneralTabAlertAddress> {
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
    controller = TextEditingController(text: forgeDetail.alertEmail);
  }

  @override
  Widget build(BuildContext context) {
    final forgeDetail = ref.watch(forgeDetailNotifierProvider);

    if (forgeDetail.pool == null) return const SizedBox.shrink();
    final tokenSymbol = forgeDetail.pool!.token.symbol;

    final theme = Theme.of(context);
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
                    Icons.email,
                    color: VMColors.containerIcon1.withValues(alpha: 0.7),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Receive alerts',
                      style: theme.textTheme.titleSmall,
                    ),
                    Text(
                      'Get an email when your gym runs out of $tokenSymbol or SOL for gas fees.',
                      style: theme.textTheme.bodySmall,
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
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
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
                                    .setAlertEmail(value);
                              },
                              style: theme.textTheme.bodyMedium,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              inputFormatters: <TextInputFormatter>[
                                LengthLimitingTextInputFormatter(
                                  50,
                                ),
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                hintText: 'example@example.com',
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
