import 'package:clones_desktop/domain/models/factory/factory_app.dart';
import 'package:clones_desktop/domain/models/supported_token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

enum GenerateFactoryStep {
  input,
  generating,
  preview,
}

@freezed
class GenerateFactoryState with _$GenerateFactoryState {
  const factory GenerateFactoryState({
    String? skills,
    String? error,
    String? factoryName,
    List<FactoryApp>? apps,
    @Default(false) bool showJsonEditor,
    @Default(GenerateFactoryStep.input) GenerateFactoryStep currentStep,
    @Default(false) bool isCreating,
    @Default(false) bool isCreated,
    List<SupportedToken>? supportedTokens,
    String? selectedTokenSymbol,
    String? predictedPoolAddress,
    String? fundingAmount,
    String? estimatedGasCost,
    bool? gasExceedsReward,
    String? transactionStatus,
  }) = _GenerateFactoryState;
  const GenerateFactoryState._();

  List<Map<String, String>> get examplePrompts => [
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
          'text':
              'Ordering food on platforms like DoorDash, UberEats, and Grubhub',
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
}
