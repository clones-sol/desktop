import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/views/manage_task/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManageTaskModalPrompt extends ConsumerStatefulWidget {
  const ManageTaskModalPrompt({super.key, this.focusNode});

  final FocusNode? focusNode;

  @override
  ConsumerState<ManageTaskModalPrompt> createState() =>
      _ManageTaskModalPromptState();
}

class _ManageTaskModalPromptState extends ConsumerState<ManageTaskModalPrompt> {
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
    controller = TextEditingController(text: manageTask.prompt);
  }

  @override
  Widget build(BuildContext context) {
    final manageTask = ref.watch(manageTaskNotifierProvider);

    if (controller.text != manageTask.prompt) {
      controller.text = manageTask.prompt;
    }
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Prompt for this task',
          style: theme.textTheme.titleSmall,
        ),
        const SizedBox(height: 4),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).colorScheme.primaryContainer,
              width: 0.5,
            ),
            gradient: ClonesColors.gradientInputFormBackground,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextField(
              controller: controller,
              focusNode: widget.focusNode,
              autocorrect: false,
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              onChanged: (v) =>
                  ref.read(manageTaskNotifierProvider.notifier).setPrompt(v),
              cursorColor: ClonesColors.secondaryText,
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 10),
                hintText: 'Enter the prompt for the task...',
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
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
      ],
    );
  }
}
