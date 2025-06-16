import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:viralmind_flutter/domain/app_info.dart';
import 'package:viralmind_flutter/domain/models/message/message.dart';
import 'package:viralmind_flutter/ui/components/pfp.dart';
import 'package:viralmind_flutter/ui/components/recording_panel.dart';
import 'package:viralmind_flutter/ui/views/training_session/bloc/provider.dart';
import 'package:viralmind_flutter/ui/views/training_session/components/quest_panel.dart';
import 'package:viralmind_flutter/ui/views/training_session/components/upload_confirm_modal.dart';
import 'package:viralmind_flutter/utils/ui/card.dart';
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
  // UI state
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

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  // Function to handle upload button click
/*  Future<void> handleUploadClick() async {
    if (currentRecordingId != null && !isUploading) {
      isUploading = true;

      try {
        final uploadStarted = await ref
            .read(tauriApiClientProvider)
            .handleUpload(
          currentRecordingId!,
          currentQuest?.title ?? activeQuest?.title ?? 'Unknown',
        );

        if (!uploadStarted) {
          // If upload didn't start, show confirmation modal
          showUploadConfirmModal = true;
          isUploading = false;
          return;
        }

        // Upload started successfully
        await _addMessage(
          generateAssistantMessage(
            'Your demonstration is being processed. This may take a while. Feel free to complete more tasks or come back later when it is done processing!',
          ),
        );

        // Set up a one-time event listener for this specific recording ID
        final unsubscribe = ref
            .read(tauriApiClientProvider)
            .on('queueUpdate', currentRecordingId!, (_, status) {
          if (status.status == 'completed') {
            if (unsubscribe != null) unsubscribe(); // Remove the listener once we're done

            // Add success messages
            chatMessages = [
              ...chatMessages,
              generateAssistantMessage(
                'Your demonstration was successfully uploaded!',
              ),
            ];

            // If we have a submission ID, try to get more details
            if (status.submissionId) {
              ref
                  .read(tauriApiClientProvider)
                  .getSubmissionStatus(status.submissionId)
                .then((submissionDetails) => {
                  chatMessages = [
                    ...chatMessages,
                    {
                      role: 'assistant',
                      content: `You scored ${submissionDetails.clampedScore}% on this task.`
                    }
                  ];

                  // Add feedback if available
                  if (submissionDetails.grade_result) {
                    chatMessages = [
                      ...chatMessages,
                      {
                        role: 'assistant',
                        content: `Feedback:\n${submissionDetails.grade_result.summary}`
                      }
                    ];
                  }

                  // Ensure scroll to bottom
                  setTimeout(scrollToBottom, 100);
                })
                .catch((error) => {
                  console.error('Failed to get submission details:', error);
                });
            }

            // Reset uploading state
            isUploading = false;
          } else if (status.status === 'failed') {
            if (unsubscribe) unsubscribe(); // Remove the listener once we're done

            // Add error message
            addMessage({
              role: 'assistant',
              content: `There was an error processing your demonstration: ${status.error || 'Unknown error'}`
            });

            // Reset uploading state
            isUploading = false;
          }
        });
      } catch (error) {
        console.error('Error in upload process:', error);
        await addMessage({
          role: 'assistant',
          content: `There was an error starting the upload: ${error instanceof Error ? error.message : 'Unknown error'}`
        });
        isUploading = false;
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    final trainingSession = ref.watch(trainingSessionNotifierProvider);

    ref.listen(
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
            // Reset the flag when the dialog is dismissed
            ref
                .read(trainingSessionNotifierProvider.notifier)
                .setShowUploadConfirmModal(false);
          });
        }
      },
    );

    ref.listen(
      trainingSessionNotifierProvider.select((s) => s.scrollToBottomNonce),
      (previous, next) {
        if (previous != next) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollToBottom();
          });
        }
      },
    );

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: trainingSession.chatMessages.length +
                  (trainingSession.isWaitingForResponse ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == trainingSession.chatMessages.length) {
                  return _buildTypingIndicator();
                }
                final message = trainingSession.chatMessages[index];
                return _buildMessageItem(message, index);
              },
            ),
          ),
          if (trainingSession.activeQuest != null)
            QuestPanel(
              title: trainingSession.activeQuest!.title,
              reward: trainingSession.activeQuest!.reward,
              objectives: trainingSession.activeQuest!.objectives,
              onStartRecording: (fps) => ref
                  .read(trainingSessionNotifierProvider.notifier)
                  .startRecording(fps),
              onComplete: ref
                  .read(trainingSessionNotifierProvider.notifier)
                  .recordingComplete,
              onGiveUp:
                  ref.read(trainingSessionNotifierProvider.notifier).giveUp,
            ),
        ],
      ),
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
        return const Center(child: CircularProgressIndicator());
      }
      return Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Card(
          color: isUser ? Colors.blue[100] : Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(message.content),
          ),
        ),
      );
    }

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[const Pfp(), const SizedBox(width: 8)],
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: AppCard(
                variant:
                    isUser ? AppCardVariant.primary : AppCardVariant.secondary,
                padding: const EdgeInsets.all(12),
                child: _buildMessageContent(message, index),
              ),
            ),
          ),
          if (isUser) ...[
            const SizedBox(width: 8),
            const CircleAvatar(child: Icon(LucideIcons.user)),
          ],
        ],
      ),
    );
  }

  Widget _buildMessageContent(Message message, int index) {
    final trainingSession = ref.watch(trainingSessionNotifierProvider);
    if (trainingSession.typingMessage != null &&
        trainingSession.typingMessage!.messageIndex == index) {
      return Text(
        trainingSession.typingMessage!.content,
        style: const TextStyle(fontWeight: FontWeight.w500),
      );
    }
    return Text(
      message.content,
      style: const TextStyle(fontWeight: FontWeight.w500),
    );
  }

  Widget _buildTypingIndicator() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Pfp(),
          SizedBox(width: 8),
          AppCard(
            variant: AppCardVariant.secondary,
            padding: EdgeInsets.all(12),
            child: Text('...'), // Replace with your desired typing indicator
          ),
        ],
      ),
    );
  }

  Widget _buildUploadButton() {
    final trainingSession = ref.watch(trainingSessionNotifierProvider);
    return AppCard(
      variant: AppCardVariant.secondary,
      padding: const EdgeInsets.all(16),
      child: Column(
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
