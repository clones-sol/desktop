import 'dart:async';
import 'dart:convert';

import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/domain/app_info.dart';
import 'package:clones_desktop/domain/models/message/message.dart';
import 'package:clones_desktop/domain/models/message/typing_message.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/components/design_widget/message_box/message_box.dart';
import 'package:clones_desktop/ui/components/pfp.dart';
import 'package:clones_desktop/ui/components/recording_panel.dart';
import 'package:clones_desktop/ui/views/record_overlay/layouts/record_overlay_view.dart';
import 'package:clones_desktop/ui/views/training_session/bloc/provider.dart';
import 'package:clones_desktop/ui/views/training_session/layouts/components/base64_image_message.dart';
import 'package:clones_desktop/ui/views/training_session/layouts/components/record_panel.dart';
import 'package:clones_desktop/ui/views/training_session/layouts/components/typing_indicator.dart';
import 'package:clones_desktop/ui/views/training_session/layouts/components/upload_confirm_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

  static const String routeName = '/training_session';

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
              barrierDismissible: false,
              useRootNavigator: false,
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
    final mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(
            parent: RangeMaintainingScrollPhysics(),
          ),
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
            if (trainingSession.activeDemonstration != null)
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: mediaQuery.size.width * 0.7,
                              ),
                              child: MessageBox(
                                messageBoxType: MessageBoxType.talkLeft,
                                content: RecordPanel(
                                  title: trainingSession
                                      .activeDemonstration!.title,
                                  reward: trainingSession
                                      .activeDemonstration!.reward,
                                  objectives: trainingSession
                                      .activeDemonstration!.objectives,
                                  onStartRecording: () async {
                                    unawaited(
                                      ref
                                          .read(
                                            trainingSessionNotifierProvider
                                                .notifier,
                                          )
                                          .startRecording(),
                                    );
                                    await context.push(
                                      RecordOverlayView.routeName,
                                    );
                                  },
                                  onComplete: () => ref
                                      .read(
                                        trainingSessionNotifierProvider
                                            .notifier,
                                      )
                                      .recordingComplete(),
                                  onGiveUp: () => ref
                                      .read(
                                        trainingSessionNotifierProvider
                                            .notifier,
                                      )
                                      .giveUp(),
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 0,
                            top: 0,
                            child: Pfp(),
                          ),
                        ],
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
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final isUser = message.role == 'user';
    if (message.type != MessageType.text) {
      if (message.type == MessageType.image) {
        final base64 = message.content;
        return Base64ImageMessage(base64: base64);
      }

      if (message.type == MessageType.delete) {
        // TODO(reddwarf03): Add delete message
        return const Text('Deleted');
      }
      if (message.type == MessageType.start) {
        // TODO(reddwarf03): Add start message
        return const Text('Start');
      }
      if (message.type == MessageType.end) {
        // TODO(reddwarf03): Add end message
        return const Text('End');
      }
      if (message.type == MessageType.action) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: mediaQuery.size.width * 0.7,
              ),
              child: MessageBox(
                messageBoxType: MessageBoxType.talkRight,
                content: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.content,
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      message.content.toLowerCase().contains('click')
                          ? Icons.ads_click
                          : message.content.toLowerCase().contains('scroll')
                              ? Icons.swap_vert
                              : Icons.keyboard,
                      color: ClonesColors.tertiary,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
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
          color: isUser ? ClonesColors.primary : ClonesColors.secondary,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              message.content,
              style: theme.textTheme.bodyMedium,
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
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: mediaQuery.size.width * 0.7,
                ),
                child: MessageBox(
                  messageBoxType: isUser
                      ? MessageBoxType.talkRight
                      : MessageBoxType.talkLeft,
                  content: _buildMessageContent(message),
                ),
              ),
            ),
            if (!isUser) const Pfp(),
          ],
        ),
      ],
    );

    return messageBubble;
  }

  Widget _buildMessageContent(Message message) {
    final theme = Theme.of(context);
    return SelectableText(
      message.content,
      style: theme.textTheme.bodyMedium,
    );
  }

  Widget _buildStreamingMessage(TypingMessage typingMessage) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final messageBubble = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: mediaQuery.size.width * 0.7,
                ),
                child: MessageBox(
                  messageBoxType: MessageBoxType.talkLeft,
                  content: Text(
                    typingMessage.content,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 0,
              top: 0,
              child: Pfp(),
            ),
          ],
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
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: mediaQuery.size.width * 0.7,
                ),
                child: MessageBox(
                  messageBoxType: MessageBoxType.talkLeft,
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Ready to submit your demonstration?',
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(width: 16),
                          BtnPrimary(
                            onTap: trainingSession.isUploading
                                ? null
                                : () {
                                    ref
                                        .read(
                                          trainingSessionNotifierProvider
                                              .notifier,
                                        )
                                        .uploadRecording(
                                          trainingSession.currentRecordingId!,
                                        );
                                  },
                            buttonText: trainingSession.isUploading
                                ? 'Uploading...'
                                : 'Upload Demonstration',
                            isLoading: trainingSession.isUploading,
                            isLocked: trainingSession.isUploading,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Get scored and earn Tokens',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 10),
                      BtnPrimary(
                        onTap: ref
                            .read(trainingSessionNotifierProvider.notifier)
                            .deleteRecording,
                        buttonText:
                            "Don't like your recording? Click to delete it.",
                        btnPrimaryType: BtnPrimaryType.outlinePrimary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 0,
              top: 0,
              child: Pfp(),
            ),
          ],
        ),
      ],
    );
  }
}
