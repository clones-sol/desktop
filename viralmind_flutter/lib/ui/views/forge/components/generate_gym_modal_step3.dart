import 'package:flutter/material.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/buttons/btn_primary.dart';

class GenerateGymModalStep3 extends StatelessWidget {
  const GenerateGymModalStep3({
    super.key,
    required this.showJsonEditor,
    required this.rawAppsJson,
    required this.onRawJsonChanged,
    required this.onToggleJsonEditor,
    required this.generatedResponse,
    required this.onGymNameChanged,
    required this.onAppNameChanged,
    required this.onTaskPromptChanged,
    required this.onBack,
    required this.onSave,
  });
  final bool showJsonEditor;
  final String rawAppsJson;
  final Function(String) onRawJsonChanged;
  final VoidCallback onToggleJsonEditor;
  final Map<String, dynamic>? generatedResponse;
  final Function(String) onGymNameChanged;
  final Function(int, String) onAppNameChanged;
  final Function(int, int, String) onTaskPromptChanged;
  final VoidCallback onBack;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your gym',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: VMColors.primaryText,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "You'll be able to make further changes later",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
            InkWell(
              onTap: onToggleJsonEditor,
              child: Text(
                showJsonEditor ? 'UI Editor' : 'JSON Editor',
                style: TextStyle(
                  color: VMColors.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (showJsonEditor) ...[
          _jsonEditor(),
          const SizedBox(height: 8),
        ] else if (generatedResponse != null &&
            generatedResponse!['content'] != null) ...[
          _uiEditor(),
        ],
        const SizedBox(height: 24),
        _footerButtons(),
      ],
    );
  }

  Widget _uiEditor() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            initialValue:
                generatedResponse!['content']['name'] ?? 'Desktop Agent Gym',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: VMColors.primaryText,
            ),
            onChanged: onGymNameChanged,
          ),
          const SizedBox(height: 12),
          if (generatedResponse!['content']['apps'] != null &&
              (generatedResponse!['content']['apps'] as List).isNotEmpty)
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount:
                    (generatedResponse!['content']['apps'] as List).length,
                itemBuilder: (context, appIdx) {
                  final app = generatedResponse!['content']['apps'][appIdx];
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 32,
                                height: 32,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    'https://www.google.com/s2/favicons?domain=${app['domain'] ?? (app['name'] != null ? '${app['name'].toString().toLowerCase().replaceAll(
                                          RegExp(
                                            r'\s+',
                                          ),
                                          '',
                                        )}.com' : 'example.com')}&sz=32',
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
                                child: TextFormField(
                                  initialValue: app['name'],
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: VMColors.tertiaryText,
                                  ),
                                  onChanged: (v) => onAppNameChanged(appIdx, v),
                                ),
                              ),
                            ],
                          ),
                          if (app['tasks'] != null &&
                              (app['tasks'] as List).isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 32,
                                top: 8,
                              ),
                              child: Column(
                                children: List.generate(
                                    (app['tasks'] as List).length, (taskIdx) {
                                  final task = app['tasks'][taskIdx];
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 4,
                                        ),
                                        child: TextFormField(
                                          initialValue: task['prompt'],
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: VMColors.tertiaryText,
                                          ),
                                          onChanged: (v) => onTaskPromptChanged(
                                            appIdx,
                                            taskIdx,
                                            v,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                    ],
                                  );
                                }),
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  'No apps or tasks generated',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _jsonEditor() {
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
          controller: TextEditingController(text: rawAppsJson),
          maxLines: 15,
          style: TextStyle(
            fontFamily: 'monospace',
            fontSize: 13,
            color: VMColors.secondaryText,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(10),
            labelText: 'JSON for apps...',
            labelStyle: TextStyle(
              color: VMColors.primaryText,
            ),
          ),
          onChanged: onRawJsonChanged,
        ),
      ),
    );
  }

  Widget _footerButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BtnPrimary(
          buttonText: 'Back',
          onTap: onBack,
          btnPrimaryType: BtnPrimaryType.outlinePrimary,
        ),
        BtnPrimary(
          buttonText: 'Continue',
          onTap: onSave,
        ),
      ],
    );
  }
}
