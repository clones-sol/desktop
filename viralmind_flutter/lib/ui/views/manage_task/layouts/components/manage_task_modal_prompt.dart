import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/views/manage_task/bloc/provider.dart';

class ManageTaskModalPrompt extends ConsumerStatefulWidget {
  const ManageTaskModalPrompt({super.key});

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

    return DecoratedBox(
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
          controller: controller,
          autocorrect: false,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          onChanged: (v) =>
              ref.read(manageTaskNotifierProvider.notifier).setPrompt(v),
          cursorColor: VMColors.secondaryText,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 10),
            hintText: 'Enter the prompt for the task...',
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
    );
  }
}
