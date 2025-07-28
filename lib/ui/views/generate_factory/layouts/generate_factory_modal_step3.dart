import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/views/generate_factory/bloc/provider.dart';
import 'package:clones_desktop/ui/views/generate_factory/bloc/state.dart';
import 'package:clones_desktop/ui/views/generate_factory/layouts/components/generate_factory_textfield_app.dart';
import 'package:clones_desktop/ui/views/generate_factory/layouts/components/generate_factory_textfield_factory_app.dart';
import 'package:clones_desktop/ui/views/generate_factory/layouts/components/generate_factory_textfield_factory_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenerateFactoryModalStep3 extends ConsumerWidget {
  const GenerateFactoryModalStep3({
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
                  'Your factory',
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
    final generateFactory = ref.watch(generateFactoryNotifierProvider);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GenerateFactoryTextFieldFactoryApp(),
          const SizedBox(height: 12),
          if (generateFactory.apps != null && generateFactory.apps!.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: (generateFactory.apps! as List).length,
                itemBuilder: (context, appIdx) {
                  final app = generateFactory.apps![appIdx];
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
                                child: GenerateFactoryTextFieldApp(
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
                                          child:
                                              GenerateFactoryTextFieldFactoryPrompt(
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
    final generateFactoryNotifier =
        ref.watch(generateFactoryNotifierProvider.notifier);
    final generateFactoryState = ref.watch(generateFactoryNotifierProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BtnPrimary(
          buttonText: 'Back',
          onTap: () =>
              generateFactoryNotifier.setCurrentStep(GenerateFactoryStep.input),
          btnPrimaryType: BtnPrimaryType.outlinePrimary,
        ),
        const SizedBox(width: 10),
        BtnPrimary(
          isLoading: generateFactoryState.isCreating,
          buttonText: 'Create',
          onTap: () async {
            await generateFactoryNotifier.createPool();
            if (generateFactoryState.error == null) {
              onClose();
            }
          },
        ),
      ],
    );
  }
}
