import 'package:clones/assets.dart';
import 'package:clones/ui/views/generate_gym/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenerateGymTextFieldGymApp extends ConsumerStatefulWidget {
  const GenerateGymTextFieldGymApp({
    super.key,
  });

  @override
  ConsumerState<GenerateGymTextFieldGymApp> createState() =>
      GenerateGymTextFieldAppState();
}

class GenerateGymTextFieldAppState
    extends ConsumerState<GenerateGymTextFieldGymApp> {
  late TextEditingController controller;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    final generateGym = ref.read(generateGymNotifierProvider);
    controller =
        TextEditingController(text: generateGym.gymName ?? 'Desktop Agent Gym');
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final generateGymNotifier = ref.watch(generateGymNotifierProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
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
                              color: VMColors.tertiary.withValues(alpha: 0.3),
                              width: 0.5,
                            ),
                            gradient: LinearGradient(
                              colors: [
                                VMColors.primary.withValues(alpha: 0.1),
                                VMColors.tertiary.withValues(alpha: 0.1),
                              ],
                            ),
                          ),
                          child: TextField(
                            style: Theme.of(context).textTheme.bodyMedium,
                            autocorrect: false,
                            controller: controller,
                            onChanged: (text) async {
                              generateGymNotifier.setGymName(
                                text,
                              );
                            },
                            focusNode: focusNode,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color:
                                      VMColors.secondary.withValues(alpha: 0.1),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color:
                                      VMColors.primary.withValues(alpha: 0.1),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.only(left: 10),
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
        ),
      ],
    );
  }
}
