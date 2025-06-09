import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/application/apps.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/card.dart';
import 'package:viralmind_flutter/ui/views/forge/components/generate_gym_modal_step1.dart';
import 'package:viralmind_flutter/ui/views/forge/components/generate_gym_modal_step2.dart';
import 'package:viralmind_flutter/ui/views/forge/components/generate_gym_modal_step3.dart';

class GenerateGymModal extends ConsumerStatefulWidget {
  const GenerateGymModal({
    super.key,
    required this.skills,
    required this.onSkillsChange,
    required this.onClose,
    required this.onSave,
  });
  final String skills;
  final Function(String) onSkillsChange;
  final VoidCallback onClose;
  final Function(Map<String, dynamic>) onSave;

  @override
  ConsumerState<GenerateGymModal> createState() => _GenerateGymModalState();
}

class _GenerateGymModalState extends ConsumerState<GenerateGymModal> {
  int currentStep = 1; // 1: Input, 2: Generating, 3: Preview
  late TextEditingController _skillsController;
  bool _isGenerating = false;
  String? _error;
  Map<String, dynamic>? generatedResponse;
  String rawAppsJson = '';
  bool showJsonEditor = false;

  // Example prompts
  final List<Map<String, String>> examplePrompts = [
    {
      'label': 'Video Editing',
      'text':
          'Video editing with tools like Premiere Pro, After Effects, and DaVinci Resolve',
    },
    {
      'label': 'Gaming',
      'text':
          'Playing and streaming Steam games, managing game libraries, and configuring game settings',
    },
    {
      'label': 'Food Ordering',
      'text': 'Ordering food on platforms like DoorDash, UberEats, and Grubhub',
    },
    {
      'label': 'Spreadsheets',
      'text':
          'Creating and managing spreadsheets in Excel, Google Sheets, or other tools',
    },
    {
      'label': 'Documents',
      'text':
          'Writing and editing documents in Word, Google Docs, or other word processors',
    },
    {
      'label': 'Coding',
      'text':
          'Using VSCode or other IDEs for programming, debugging, and version control',
    },
    {
      'label': '3D Modeling',
      'text':
          'Creating 3D models and animations in Blender, Maya, or other modeling software',
    },
    {
      'label': 'Social Media',
      'text': 'Engaging on Twitter, Instagram, and other social platforms',
    },
    {
      'label': 'Community Management',
      'text':
          'Setting up and managing Discord servers, Telegram groups, or Slack workspaces',
    },
    {
      'label': 'Crypto Trading',
      'text':
          'Trading cryptocurrency on exchanges, managing wallets, and analyzing market trends',
    },
  ];

  @override
  void initState() {
    super.initState();
    _skillsController = TextEditingController(text: widget.skills);
    _skillsController.addListener(() {
      widget.onSkillsChange(_skillsController.text);
    });
  }

  @override
  void dispose() {
    _skillsController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant GenerateGymModal oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.skills != oldWidget.skills &&
        widget.skills != _skillsController.text) {
      _skillsController.text = widget.skills;
    }
  }

  void _applyExamplePrompt(String prompt) {
    setState(() {
      _skillsController.text = prompt;
    });
    widget.onSkillsChange(prompt);
  }

  Future<void> _startGeneration() async {
    if (_skillsController.text.trim().isEmpty) return;
    setState(() {
      currentStep = 2;
      _isGenerating = true;
      _error = null;
    });
    try {
      final result = await ref.read(
        generateAppsProvider(prompt: _skillsController.text.trim()).future,
      );
      generatedResponse = result as Map<String, dynamic>?;
      _updateRawJson();
      setState(() {
        currentStep = 3;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        currentStep = 1;
      });
    } finally {
      setState(() {
        _isGenerating = false;
      });
    }
  }

  void _updateRawJson() {
    if (generatedResponse != null &&
        generatedResponse!['content'] != null &&
        generatedResponse!['content']['apps'] != null) {
      rawAppsJson = const JsonEncoder.withIndent('  ')
          .convert(generatedResponse!['content']['apps']);
    }
  }

  bool _updateJsonFromEditor() {
    try {
      if (generatedResponse != null && generatedResponse!['content'] != null) {
        generatedResponse!['content']['apps'] = jsonDecode(rawAppsJson);
        return true;
      }
      return false;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid JSON: $e')),
      );
      return false;
    }
  }

  void _toggleJsonEditor() {
    setState(() {
      if (showJsonEditor) {
        final success = _updateJsonFromEditor();
        if (!success) return;
      } else {
        _updateRawJson();
      }
      showJsonEditor = !showJsonEditor;
    });
  }

  void _updateGymName(String value) {
    if (generatedResponse != null && generatedResponse!['content'] != null) {
      generatedResponse!['content']['name'] = value;
      setState(() {});
    }
  }

  void _updateAppName(int appIndex, String value) {
    if (generatedResponse != null && generatedResponse!['content'] != null) {
      generatedResponse!['content']['apps'][appIndex]['name'] = value;
      setState(() {});
    }
  }

  void _updateTaskPrompt(int appIndex, int taskIndex, String value) {
    if (generatedResponse != null && generatedResponse!['content'] != null) {
      generatedResponse!['content']['apps'][appIndex]['tasks'][taskIndex]
          ['prompt'] = value;
      setState(() {});
    }
  }

  void _goBackToEdit() {
    setState(() {
      currentStep = 1;
    });
  }

  void _handleSave() {
    widget.onSave(generatedResponse ?? {});
    setState(() {
      currentStep = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              color: Colors.black.withValues(alpha: 0.5),
            ),
          ),
        ),
        Center(
          child: CardWidget(
            padding: CardPadding.large,
            child: Container(
              width: 600,
              constraints: const BoxConstraints(maxHeight: 800),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Generate a gym',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: VMColors.primaryText,
                        ),
                      ),
                      IconButton(
                        onPressed: widget.onClose,
                        icon: Icon(
                          Icons.close,
                          color: VMColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  if (currentStep == 1) ...[
                    GenerateGymModalStep1(
                      skillsController: _skillsController,
                      onSkillsChange: widget.onSkillsChange,
                      isGenerating: _isGenerating,
                      onGenerate: _startGeneration,
                      onClose: widget.onClose,
                      error: _error,
                      examplePrompts: examplePrompts,
                      onExamplePrompt: _applyExamplePrompt,
                    ),
                  ] else if (currentStep == 2) ...[
                    const GenerateGymModalStep2(),
                  ] else if (currentStep == 3) ...[
                    GenerateGymModalStep3(
                      showJsonEditor: showJsonEditor,
                      rawAppsJson: rawAppsJson,
                      onRawJsonChanged: (v) => setState(() => rawAppsJson = v),
                      onToggleJsonEditor: _toggleJsonEditor,
                      generatedResponse: generatedResponse,
                      onGymNameChanged: _updateGymName,
                      onAppNameChanged: _updateAppName,
                      onTaskPromptChanged: _updateTaskPrompt,
                      onBack: _goBackToEdit,
                      onSave: _handleSave,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
