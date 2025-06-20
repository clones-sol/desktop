import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/app_info.dart';
import 'package:viralmind_flutter/domain/models/message/message.dart';
import 'package:viralmind_flutter/domain/models/message/typing_message.dart';
import 'package:viralmind_flutter/ui/components/design_widget/message_box/message_box.dart';
import 'package:viralmind_flutter/ui/components/pfp.dart';
import 'package:viralmind_flutter/ui/components/recording_panel.dart';
import 'package:viralmind_flutter/ui/views/training_session/bloc/provider.dart';
import 'package:viralmind_flutter/ui/views/training_session/layouts/components/record_panel.dart';
import 'package:viralmind_flutter/ui/views/training_session/layouts/components/typing_indicator.dart';
import 'package:viralmind_flutter/ui/views/training_session/layouts/components/upload_confirm_modal.dart';
import 'package:viralmind_flutter/utils/widgets/buttons.dart';

class TrainingSessionView extends ConsumerStatefulWidget {
  const TrainingSessionView({
    super.key,
    this.prompt,
    this.appParam,
    this.poolId,
  });
  final String? prompt;
  final String? appParam;
  final String? poolId;

  @override
  ConsumerState<TrainingSessionView> createState() =>
      _TrainingSessionViewState();
}

class _TrainingSessionViewState extends ConsumerState<TrainingSessionView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    Future(() async {
      if (widget.appParam != null) {
        try {
          final decodedParam = jsonDecode(_decodeComponent(widget.appParam!));

          final app = AppInfo.fromJson(decodedParam);
          ref.read(trainingSessionNotifierProvider.notifier).setApp(app);
        } catch (error) {
          debugPrint('Failed to parse app parameter: $error');
        }
      }
      if (widget.poolId != null) {
        ref
            .read(trainingSessionNotifierProvider.notifier)
            .setPoolId(widget.poolId);
      }
      if (widget.prompt != null) {
        ref
            .read(trainingSessionNotifierProvider.notifier)
            .setPrompt(widget.prompt);
      }
      await _initializeAudio();
      await ref.read(trainingSessionNotifierProvider.notifier).initialMessage();
    });
    super.initState();
  }

  String _decodeComponent(String component) {
    try {
      return Uri.decodeComponent(component);
    } catch (e) {
      return component;
    }
  }

  Future<void> _initializeAudio() async {
    await ref
        .read(trainingSessionNotifierProvider.notifier)
        .setToneAudio('tone.wav');
    await ref
        .read(trainingSessionNotifierProvider.notifier)
        .setBlipAudio('blip.wav');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref
      ..listen(
        trainingSessionNotifierProvider.select((s) => s.showUploadConfirmModal),
        (previous, next) {
          if (next) {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return UploadConfirmModal(
                  onConfirm: () {
                    ref
                        .read(trainingSessionNotifierProvider.notifier)
                        .confirmAndUpload();
                  },
                );
              },
            ).then((_) {
              ref
                  .read(trainingSessionNotifierProvider.notifier)
                  .setShowUploadConfirmModal(false);
            });
          }
        },
      )
      ..listen(
        trainingSessionNotifierProvider.select((s) => s.scrollToBottomNonce),
        (previous, next) {
          if (previous != next) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (_scrollController.hasClients) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              }
            });
          }
        },
      );

    final trainingSession = ref.watch(trainingSessionNotifierProvider);
    final showTypingIndicator = trainingSession.isWaitingForResponse &&
        trainingSession.typingMessage == null;
    final showStreamingMessage = trainingSession.typingMessage != null;

    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final message = trainingSession.chatMessages[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: _buildMessageItem(message, index),
                    );
                  },
                  childCount: trainingSession.chatMessages.length,
                ),
              ),
            ),
            if (showStreamingMessage)
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                sliver: SliverToBoxAdapter(
                  child: _buildStreamingMessage(trainingSession.typingMessage!),
                ),
              ),
            if (showTypingIndicator)
              const SliverPadding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                sliver: SliverToBoxAdapter(child: TypingIndicator()),
              ),
            if (trainingSession.activeQuest != null)
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Pfp(),
                      const SizedBox(width: 8),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: MessageBox(
                          messageBoxType: MessageBoxType.talkLeft,
                          content: RecordPanel(
                            title: trainingSession.activeQuest!.title,
                            reward: trainingSession.activeQuest!.reward,
                            objectives: trainingSession.activeQuest!.objectives,
                            onStartRecording: (fps) => ref
                                .read(
                                  trainingSessionNotifierProvider.notifier,
                                )
                                .startRecording(fps),
                            onComplete: ref
                                .read(
                                  trainingSessionNotifierProvider.notifier,
                                )
                                .recordingComplete,
                            onGiveUp: ref
                                .read(
                                  trainingSessionNotifierProvider.notifier,
                                )
                                .giveUp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildMessageItem(Message message, int index) {
    final isUser = message.role == 'user';
    if (message.type != MessageType.text) {
      if (message.type == MessageType.image) {
        final base64 = message.content;
        return Align(
          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Card(
            child: Image.memory(base64Decode(base64), gaplessPlayback: true),
          ),
        );
      }
      if (message.type == MessageType.recording) {
        final id = message.content;
        return RecordingPanel(recordingId: id);
      }
      if (message.type == MessageType.uploadButton) {
        return _buildUploadButton();
      }
      if (message.type == MessageType.loading) {
        return const Center(
          child: CircularProgressIndicator(
            strokeWidth: 1,
          ),
        );
      }
      return Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Card(
          color: isUser ? VMColors.primary : VMColors.secondary,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              message.content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      );
    }

    final messageBubble = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isUser) ...[const Pfp(), const SizedBox(width: 8)],
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: MessageBox(
            messageBoxType:
                isUser ? MessageBoxType.talkRight : MessageBoxType.talkLeft,
            content: _buildMessageContent(message, index),
          ),
        ),
      ],
    );

    return messageBubble;
  }

  Widget _buildMessageContent(Message message, int index) {
    return Text(
      message.content,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget _buildStreamingMessage(TypingMessage typingMessage) {
    final messageBubble = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Pfp(),
        const SizedBox(width: 8),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: MessageBox(
            messageBoxType: MessageBoxType.talkLeft,
            content: Text(
              typingMessage.content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [messageBubble],
    );
  }

  Widget _buildUploadButton() {
    final trainingSession = ref.watch(trainingSessionNotifierProvider);
    return MessageBox(
      messageBoxType: MessageBoxType.info,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ready to submit your demonstration?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          PrimaryButton(
            onPressed: trainingSession.isUploading
                ? null
                : () {
                    ref
                        .read(trainingSessionNotifierProvider.notifier)
                        .uploadRecording(trainingSession.currentRecordingId!);
                  },
            child: trainingSession.isUploading
                ? const Text('Uploading...')
                : const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(LucideIcons.upload, size: 16),
                      SizedBox(width: 8),
                      Text('Upload Demonstration'),
                    ],
                  ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              r'Get scored and earn $VIRAL tokens',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Center(
            child: TextButton(
              onPressed: ref
                  .read(trainingSessionNotifierProvider.notifier)
                  .deleteRecording,
              child: const Text(
                "Don't like your recording? Click to delete it.",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
