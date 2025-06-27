import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/components/design_widget/message_box/message_box.dart';
import 'package:viralmind_flutter/ui/views/generate_gym/bloc/provider.dart';

class GenerateGymModalStep1 extends ConsumerStatefulWidget {
  const GenerateGymModalStep1({
    super.key,
    required this.onClose,
  });

  final VoidCallback onClose;

  @override
  ConsumerState<GenerateGymModalStep1> createState() =>
      _GenerateGymModalStep1State();
}

class _GenerateGymModalStep1State extends ConsumerState<GenerateGymModalStep1> {
  late TextEditingController skillsController;

  @override
  void initState() {
    super.initState();
    final generateGym = ref.read(generateGymNotifierProvider);
    skillsController = TextEditingController(text: generateGym.skills);
  }

  @override
  void dispose() {
    skillsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can generate a gym by describing your dream agent, or by sharing the skills you want a training dataset for.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            border: Border.all(
              color: VMColors.secondary.withValues(alpha: 0.3),
              width: 0.5,
            ),
            gradient: LinearGradient(
              colors: [
                VMColors.secondary.withValues(alpha: 0.3),
                VMColors.secondary.withValues(alpha: 0.1),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextField(
              controller: skillsController,
              autocorrect: false,
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              onChanged: (v) =>
                  ref.read(generateGymNotifierProvider.notifier).setSkills(v),
              cursorColor: VMColors.secondaryText,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 10),
                hintText: 'List the skills to train (one per line)...',
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
        ),
        const SizedBox(height: 10),
        _examplePrompts(ref),
        const SizedBox(height: 20),
        _footerButtons(ref),
      ],
    );
  }

  Widget _examplePrompts(WidgetRef ref) {
    final generateGym = ref.watch(generateGymNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Example prompts:',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: generateGym.examplePrompts.map((prompt) {
            return OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: VMColors.tertiary,
                  width: 0.1,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              ),
              onPressed: () {
                skillsController.text = prompt['text']!;
                ref
                    .read(generateGymNotifierProvider.notifier)
                    .setSkills(prompt['text']!);
              },
              child: Text(
                prompt['label']!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            );
          }).toList(),
        ),
        if (generateGym.error != null) ...[
          const SizedBox(height: 20),
          MessageBox(
            messageBoxType: MessageBoxType.warning,
            content: Row(
              children: [
                Text(
                  generateGym.error!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _footerButtons(WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BtnPrimary(
          buttonText: 'Cancel',
          onTap: widget.onClose,
          btnPrimaryType: BtnPrimaryType.outlinePrimary,
        ),
        const SizedBox(width: 10),
        BtnPrimary(
          buttonText: 'Generate',
          onTap: () =>
              ref.read(generateGymNotifierProvider.notifier).startGeneration(),
          isLocked:
              ref.watch(generateGymNotifierProvider).skills?.isEmpty ?? true,
        ),
      ],
    );
  }
}
