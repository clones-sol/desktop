import 'package:flutter/material.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/buttons/btn_primary.dart';

class GenerateGymModalStep1 extends StatelessWidget {
  const GenerateGymModalStep1({
    super.key,
    required this.skillsController,
    required this.onSkillsChange,
    required this.isGenerating,
    required this.onGenerate,
    required this.onClose,
    required this.error,
    required this.examplePrompts,
    required this.onExamplePrompt,
  });
  final TextEditingController skillsController;
  final Function(String) onSkillsChange;
  final bool isGenerating;
  final VoidCallback onGenerate;
  final VoidCallback onClose;
  final String? error;
  final List<Map<String, String>> examplePrompts;
  final Function(String) onExamplePrompt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can generate a gym by describing your dream agent, or by sharing the skills you want a training dataset for.',
          style: TextStyle(
            color: VMColors.secondaryText,
            fontSize: 14,
          ),
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
              cursorColor: VMColors.secondaryText,
              style: TextStyle(fontSize: 14, color: VMColors.secondaryText),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 10),
                hintText: 'List the skills to train (one per line)...',
                hintStyle: TextStyle(
                  color: VMColors.secondaryText.withValues(alpha: 0.3),
                ),
              ),
              onChanged: onSkillsChange,
            ),
          ),
        ),
        const SizedBox(height: 10),
        _examplePrompts(),
        const SizedBox(height: 20),
        _footerButtons(),
      ],
    );
  }

  Widget _examplePrompts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Example prompts:',
          style: TextStyle(color: VMColors.secondaryText, fontSize: 13),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: examplePrompts.map((prompt) {
            return OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: VMColors.tertiary,
                  width: 0.1,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              ),
              onPressed: () => onExamplePrompt(prompt['text']!),
              child: Text(
                prompt['label']!,
                style: const TextStyle(
                  color: VMColors.primaryText,
                  fontWeight: FontWeight.w200,
                  wordSpacing: 1.2,
                  fontSize: 12,
                ),
              ),
            );
          }).toList(),
        ),
        if (error != null) ...[
          const SizedBox(height: 16),
          Text(error!, style: const TextStyle(color: Colors.red)),
        ],
      ],
    );
  }

  Widget _footerButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BtnPrimary(
          buttonText: 'Cancel',
          onTap: onClose,
          btnPrimaryType: BtnPrimaryType.outlinePrimary,
        ),
        const SizedBox(width: 16),
        BtnPrimary(
          buttonText: 'Generate',
          onTap: isGenerating ? null : onGenerate,
          isLocked: isGenerating,
        ),
      ],
    );
  }
}
