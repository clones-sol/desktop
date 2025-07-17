import 'package:clones/assets.dart';
import 'package:clones/ui/views/manage_task/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManageTaskModalPricePerDemo extends ConsumerStatefulWidget {
  const ManageTaskModalPricePerDemo({
    super.key,
    required this.tokenSymbol,
    this.focusNode,
    this.onSubmitted,
  });
  final String tokenSymbol;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;

  @override
  ConsumerState<ManageTaskModalPricePerDemo> createState() =>
      _ManageTaskModalPricePerDemoState();
}

class _ManageTaskModalPricePerDemoState
    extends ConsumerState<ManageTaskModalPricePerDemo> {
  late final TextEditingController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final manageTask = ref.read(manageTaskNotifierProvider);
    controller =
        TextEditingController(text: manageTask.pricePerDemo.toString());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Price per demonstration for this task.  Minimum price: 1 ${widget.tokenSymbol}',
          style: theme.textTheme.titleSmall,
        ),
        const SizedBox(height: 4),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: 0.5,
                ),
                gradient: VMColors.gradientInputFormBackground,
              ),
              child: TextField(
                onSubmitted: widget.onSubmitted,
                focusNode: widget.focusNode,
                onChanged: (value) {
                  ref
                      .read(
                        manageTaskNotifierProvider.notifier,
                      )
                      .setPricePerDemo(
                        double.tryParse(value) ?? 0,
                      );
                },
                controller: controller,
                textInputAction: TextInputAction.next,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                style: theme.textTheme.bodyMedium,
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
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                  widget.tokenSymbol,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
