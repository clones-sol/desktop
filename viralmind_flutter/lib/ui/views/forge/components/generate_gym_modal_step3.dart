import 'package:flutter/material.dart';

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
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your gym',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  "You'll be able to make further changes later",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
            TextButton(
              onPressed: onToggleJsonEditor,
              child: Text(showJsonEditor ? 'UI Editor' : 'JSON Editor'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (showJsonEditor) ...[
          TextField(
            controller: TextEditingController(text: rawAppsJson),
            maxLines: 15,
            style: const TextStyle(fontFamily: 'monospace', fontSize: 13),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'JSON for apps...',
            ),
            onChanged: onRawJsonChanged,
          ),
          const SizedBox(height: 8),
        ] else if (generatedResponse != null &&
            generatedResponse!['content'] != null) ...[
          Card(
            color: Colors.grey[50],
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    initialValue: generatedResponse!['content']['name'] ??
                        'Desktop Agent Gym',
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Gym Name',
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    onChanged: onGymNameChanged,
                  ),
                  const SizedBox(height: 12),
                  if (generatedResponse!['content']['apps'] != null &&
                      (generatedResponse!['content']['apps'] as List)
                          .isNotEmpty)
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount:
                            (generatedResponse!['content']['apps'] as List)
                                .length,
                        itemBuilder: (context, appIdx) {
                          final app =
                              generatedResponse!['content']['apps'][appIdx];
                          return Card(
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
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Image.network(
                                            'https://www.google.com/s2/favicons?domain=${app['domain'] ?? (app['name'] != null ? '${app['name'].toString().toLowerCase().replaceAll(
                                                  RegExp(
                                                    r'\s+',
                                                  ),
                                                  '',
                                                )}.com' : 'example.com')}&sz=32',
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Container(
                                              color: Colors.grey[200],
                                              child: const Icon(
                                                Icons.apps,
                                                color: Colors.grey,
                                              ),
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
                                            labelText: 'App Name',
                                          ),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                          onChanged: (v) =>
                                              onAppNameChanged(appIdx, v),
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
                                            (app['tasks'] as List).length,
                                            (taskIdx) {
                                          final task = app['tasks'][taskIdx];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4,
                                            ),
                                            child: TextFormField(
                                              initialValue: task['prompt'],
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                labelText: 'Task Prompt',
                                              ),
                                              style:
                                                  const TextStyle(fontSize: 14),
                                              onChanged: (v) =>
                                                  onTaskPromptChanged(
                                                appIdx,
                                                taskIdx,
                                                v,
                                              ),
                                            ),
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
            ),
          ),
        ],
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: onBack,
              child: const Text('Back'),
            ),
            ElevatedButton(
              onPressed: onSave,
              child: const Text('Continue'),
            ),
          ],
        ),
      ],
    );
  }
}
