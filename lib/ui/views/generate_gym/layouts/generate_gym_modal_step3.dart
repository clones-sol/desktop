import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/views/generate_gym/bloc/provider.dart';
import 'package:clones_desktop/ui/views/generate_gym/bloc/state.dart';
import 'package:clones_desktop/ui/views/generate_gym/layouts/components/generate_gym_textfield_app.dart';
import 'package:clones_desktop/ui/views/generate_gym/layouts/components/generate_gym_textfield_gym_app.dart';
import 'package:clones_desktop/ui/views/generate_gym/layouts/components/generate_gym_textfield_gym_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenerateGymModalStep3 extends ConsumerWidget {
  const GenerateGymModalStep3({
    super.key,
    required this.onClose,
  });

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your gym',
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  "You'll be able to make further changes later",
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(child: _uiEditor(context, ref)),
        const SizedBox(height: 20),
        _footerButtons(context, ref),
      ],
    );
  }

  Widget _uiEditor(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final generateGym = ref.watch(generateGymNotifierProvider);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GenerateGymTextFieldGymApp(),
          const SizedBox(height: 12),
          if (generateGym.apps != null && generateGym.apps!.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: (generateGym.apps! as List).length,
                itemBuilder: (context, appIdx) {
                  final app = generateGym.apps![appIdx];
                  return Card(
                    color: Colors.transparent,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    'https://www.google.com/s2/favicons?domain=${app.domain}&sz=32',
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(
                                      Icons.apps,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: GenerateGymTextFieldApp(
                                  appIdx: appIdx,
                                ),
                              ),
                            ],
                          ),
                          if (app.tasks.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(left: 60, top: 4),
                              child: Column(
                                children: List.generate(
                                  app.tasks.length,
                                  (taskIdx) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4,
                                          ),
                                          child: GenerateGymTextFieldGymPrompt(
                                            appIdx: appIdx,
                                            taskIdx: taskIdx,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  'No apps or tasks generated',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _footerButtons(BuildContext context, WidgetRef ref) {
    final generateGymNotifier = ref.watch(generateGymNotifierProvider.notifier);
    final generateGymState = ref.watch(generateGymNotifierProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BtnPrimary(
          buttonText: 'Back',
          onTap: () =>
              generateGymNotifier.setCurrentStep(GenerateGymStep.input),
          btnPrimaryType: BtnPrimaryType.outlinePrimary,
        ),
        const SizedBox(width: 10),
        BtnPrimary(
          isLoading: generateGymState.isCreating,
          buttonText: 'Create',
          onTap: () async {
            await generateGymNotifier.createPool();
            if (generateGymState.error == null) {
              onClose();
            }
          },
        ),
      ],
    );
  }
}
