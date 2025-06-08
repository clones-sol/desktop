import 'package:flutter/material.dart';

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
          style: TextStyle(color: Colors.grey[700]),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: skillsController,
          maxLines: 5,
          decoration: const InputDecoration(
            labelText: 'Skills',
            hintText: 'List the skills to train (one per line)...',
          ),
          onChanged: onSkillsChange,
        ),
        const SizedBox(height: 12),
        const Text(
          'Example prompts:',
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: examplePrompts.map((prompt) {
            return OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              ),
              onPressed: () => onExamplePrompt(prompt['text']!),
              child:
                  Text(prompt['label']!, style: const TextStyle(fontSize: 12)),
            );
          }).toList(),
        ),
        if (error != null) ...[
          const SizedBox(height: 16),
          Text(error!, style: const TextStyle(color: Colors.red)),
        ],
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: onClose,
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: isGenerating ? null : onGenerate,
              child: isGenerating
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Generate'),
            ),
          ],
        ),
      ],
    );
  }
}
