import 'package:clones/assets.dart';
import 'package:clones/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones/ui/components/design_widget/message_box/message_box.dart';
import 'package:clones/ui/views/generate_gym/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(generateGymNotifierProvider.notifier).fetchSupportedTokens();
    });
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
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can generate a gym by describing your dream agent, or by sharing the skills you want a training dataset for.',
          style: theme.textTheme.bodyMedium,
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
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 10),
                hintText: 'List the skills to train (one per line)...',
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color:
                      theme.textTheme.bodyMedium?.color!.withValues(alpha: 0.2),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        _examplePrompts(ref),
        const SizedBox(height: 20),
        _buildRewardTokenSelector(context, ref),
        const SizedBox(height: 20),
        _footerButtons(ref),
      ],
    );
  }

  Widget _buildRewardTokenSelector(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final generateGymState = ref.watch(generateGymNotifierProvider);
    final generateGymNotifier = ref.read(generateGymNotifierProvider.notifier);

    if (generateGymState.supportedTokens == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Reward Token', style: theme.textTheme.titleMedium),
        Text(
          'Choose the reward token for your gym',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: theme.colorScheme.primaryContainer,
              width: 0.5,
            ),
            gradient: VMColors.gradientInputFormBackground,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButton<String>(
              value: generateGymState.selectedTokenSymbol,
              isExpanded: true,
              underline: const SizedBox.shrink(),
              dropdownColor: Colors.black.withValues(alpha: 0.9),
              style: theme.textTheme.bodyMedium,
              items: generateGymState.supportedTokens!
                  .map(
                    (token) => DropdownMenuItem(
                      value: token.symbol,
                      child: Row(
                        children: [
                          if (token.logoUrl != null)
                            Image.network(token.logoUrl!, width: 24, height: 24)
                          else
                            Text(token.name),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  generateGymNotifier.setSelectedToken(value);
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _examplePrompts(WidgetRef ref) {
    final generateGym = ref.watch(generateGymNotifierProvider);
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Example prompts:',
          style: theme.textTheme.bodySmall,
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
                style: theme.textTheme.bodySmall,
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
                  style: theme.textTheme.bodyMedium,
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
