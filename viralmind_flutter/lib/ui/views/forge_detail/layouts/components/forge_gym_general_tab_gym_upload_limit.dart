import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/card.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/bloc/provider.dart';

class ForgeGymGeneralTabGymUploadLimit extends ConsumerStatefulWidget {
  const ForgeGymGeneralTabGymUploadLimit({super.key});

  @override
  ConsumerState<ForgeGymGeneralTabGymUploadLimit> createState() =>
      _ForgeGymGeneralTabGymUploadLimitState();
}

class _ForgeGymGeneralTabGymUploadLimitState
    extends ConsumerState<ForgeGymGeneralTabGymUploadLimit> {
  late final TextEditingController uploadLimitValueController;

  @override
  void dispose() {
    uploadLimitValueController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final forgeDetail = ref.read(forgeDetailNotifierProvider);
    uploadLimitValueController =
        TextEditingController(text: forgeDetail.uploadLimitValue.toString());
  }

  @override
  Widget build(BuildContext context) {
    final forgeDetail = ref.watch(forgeDetailNotifierProvider);

    if (forgeDetail.pool == null) return const SizedBox.shrink();

    return CardWidget(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: VMColors.containerIcon3.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.speed,
                    color: VMColors.containerIcon3.withValues(alpha: 0.7),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upload Limits',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      'Set gym-wide upload limits',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Limit Type',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButton<String>(
                            value: forgeDetail.uploadLimitType,
                            isExpanded: true,
                            underline: const SizedBox(),
                            dropdownColor: Colors.black.withValues(alpha: 0.9),
                            style: Theme.of(context).textTheme.bodyMedium,
                            items: [
                              DropdownMenuItem(
                                value: 'none',
                                child: Text(
                                  'None',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'pertask',
                                child: Text(
                                  'Per Task',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'perday',
                                child: Text(
                                  'Per Day',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'total',
                                child: Text(
                                  'Total',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                            onChanged: (val) {
                              ref
                                  .read(forgeDetailNotifierProvider.notifier)
                                  .setUploadLimitType(val ?? 'per-task');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                if (forgeDetail.uploadLimitType != 'none')
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Limit Value',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 4),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              width: 0.5,
                            ),
                            gradient: VMColors.gradientInputFormBackground,
                          ),
                          child: TextField(
                            controller: uploadLimitValueController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 12,
                              ),
                              hintText: 'Value',
                            ),
                            onChanged: (val) {
                              ref
                                  .read(forgeDetailNotifierProvider.notifier)
                                  .setUploadLimitValue(int.tryParse(val) ?? 0);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  const Expanded(child: SizedBox(width: double.infinity)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Builder(
                builder: (context) {
                  String explanation;
                  switch (forgeDetail.uploadLimitType) {
                    case 'pertask':
                      explanation =
                          'Limit the number of uploads per individual task.';
                      break;
                    case 'perday':
                      explanation =
                          'Limit the number of uploads per day across all tasks.';
                      break;
                    case 'total':
                      explanation =
                          'Limit the total number of uploads across all tasks.';
                      break;
                    case 'none':
                      explanation = 'No upload limits are set for this gym.';
                      break;
                    default:
                      explanation = '';
                  }
                  return Text(
                    explanation,
                    style: Theme.of(context).textTheme.bodySmall,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
