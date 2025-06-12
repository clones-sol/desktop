import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:viralmind_flutter/application/pool.dart';
import 'package:viralmind_flutter/domain/app_info.dart';
import 'package:viralmind_flutter/domain/models/message/deleted_range.dart';
import 'package:viralmind_flutter/domain/models/message/message.dart';
import 'package:viralmind_flutter/domain/models/message/sft_message.dart';
import 'package:viralmind_flutter/domain/models/message/typing_message.dart';
import 'package:viralmind_flutter/domain/models/quest/quest.dart';
import 'package:viralmind_flutter/domain/models/quest/quest_reward.dart';
import 'package:viralmind_flutter/providers/api_provider.dart';
import 'package:viralmind_flutter/ui/components/pfp.dart';
import 'package:viralmind_flutter/ui/views/training_session/components/quest_panel.dart';
import 'package:viralmind_flutter/ui/components/recording_panel.dart';
import 'package:viralmind_flutter/utils/env.dart';
import 'package:viralmind_flutter/utils/ui/card.dart';
import 'package:viralmind_flutter/utils/widgets/buttons.dart';

enum RecordingState { off, recording, saved }

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
  AppInfo? app;

  // Quest state
  Quest? currentQuest;
  Quest? activeQuest;
  bool recordingLoading = false;
  bool recordingProcessing = false;
  bool showUploadConfirmModal = false;
  String? currentRecordingId;
  bool isUploading = false;
  bool loadingSftData = false;

  RecordingState recordingState = RecordingState.off;

  // Chat state
  final TextEditingController _messageController = TextEditingController();
  List<Message> chatMessages = [];
  TypingMessage? typingMessage;
  bool isWaitingForResponse = false;
  int? hoveredMessageIndex;
  List<DeletedRange> deletedRanges = [];
  List<SftMessage>? originalSftData;

  // UI state
  final ScrollController _scrollController = ScrollController();
  final AudioPlayer _toneAudio = AudioPlayer();
  final AudioPlayer _blipAudio = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _parseAppParam();
    _initializeAudio();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getInitialMessage());
  }

  void _parseAppParam() {
    if (widget.appParam != null) {
      try {
        final decodedParam = jsonDecode(decodeComponent(widget.appParam!));
        app = AppInfo.fromJson(decodedParam);
        debugPrint('Parsed app parameter: $app');
      } catch (error) {
        debugPrint('Failed to parse app parameter: $error');
      }
    }
  }

  String decodeComponent(String component) {
    try {
      return Uri.decodeComponent(component);
    } catch (e) {
      return component;
    }
  }

  Future<void> _initializeAudio() async {
    await _toneAudio.setSource(AssetSource('tone.wav'));
    await _toneAudio.setVolume(0.15);
    await _blipAudio.setSource(AssetSource('blip.wav'));
    await _blipAudio.setVolume(0.15);
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _toneAudio.dispose();
    _blipAudio.dispose();
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

  Future<void> _typeMessage(
    String content,
    int messageIndex, {
    bool delay = true,
  }) async {
    try {
      if (content.isEmpty) return;
      if (delay) await Future.delayed(const Duration(milliseconds: 300));

      const baseDelay = 1000 / 15 / 2;
      const chunkSize = 2;

      for (var i = 0; i <= content.length; i += chunkSize) {
        if (!mounted) return;
        setState(() {
          typingMessage = TypingMessage(
            content: content.substring(0, i),
            target: content,
            messageIndex: messageIndex,
          );
        });

        final variation = baseDelay * (0.8 + Random().nextDouble() * 0.4);

        // TODO: To fix
        /* 
         final isBlip = i % 4 == 0 || (i > 0 && content[i - 1] == ' ');
        if (isBlip) {
          await _toneAudio.seek(Duration.zero);
          await _toneAudio.resume();
        }*/

        _scrollToBottom();
        if (delay) {
          await Future.delayed(Duration(milliseconds: variation.toInt()));
        }
      }
      if (mounted) {
        setState(() => typingMessage = null);
      }
    } catch (e) {
      debugPrint('Error typing message: $e');
    }
  }

  Future<void> _addMessage(
    Message msg, {
    bool audio = true,
    bool delay = true,
  }) async {
    final messageIndex = chatMessages.length;

    // Check if the message is an image
    final isText = !msg.content.startsWith('<');

    if (msg.role == 'assistant' && isText) {
      // Add empty message first
      chatMessages = [
        ...chatMessages,
        Message(role: msg.role, content: '', timestamp: msg.timestamp),
      ];

      _scrollToBottom();

      // Then animate typing
      await _typeMessage(msg.content, messageIndex, delay: delay);

      // Finally update with full message
      chatMessages = List.generate(
        chatMessages.length,
        (i) => i == messageIndex ? msg : chatMessages[i],
      );
    } else {
      if (audio) {
        await _blipAudio.seek(Duration.zero);
        await _blipAudio.resume();
      }
      chatMessages = [...chatMessages, msg];
      _scrollToBottom();
    }
  }

  Future<List<SftMessage>?> _loadSftData(String recordingId) async {
    if (mounted) setState(() => loadingSftData = true);
    try {
      final sftString = await ref
          .read(tauriApiClientProvider)
          .getRecordingFile(recordingId: recordingId, filename: 'sft.json');
      final List<dynamic> sftJson = jsonDecode(sftString);
      return sftJson.map((json) => SftMessage.fromJson(json)).toList();
    } catch (error) {
      debugPrint('Failed to load SFT data: $error');
      return null;
    } finally {
      if (mounted) setState(() => loadingSftData = false);
    }
  }

  Future<void> _handleQuestData(Quest quest) async {
    if (quest.content.isNotEmpty) {
      await _addMessage(generateAssistantMessage(quest.content));
    }

    if (quest.title.isNotEmpty &&
        quest.app.isNotEmpty &&
        quest.iconUrl.isNotEmpty &&
        quest.objectives.isNotEmpty) {
      currentQuest = Quest(
        title: quest.title,
        app: quest.app,
        iconUrl: quest.iconUrl,
        objectives: quest.objectives,
        content: quest.content,
      );

      if (widget.poolId != null) {
        try {
          final taskId = app?.taskId;

          final rewardInfo = await ref.read(
            GetRewardProvider(poolId: widget.poolId!, taskId: taskId).future,
          );

          currentQuest = currentQuest?.copyWith(
            poolId: widget.poolId,
            reward: QuestReward(
              time: rewardInfo.time,
              maxReward: rewardInfo.maxReward,
            ),
          );

          if (app?.taskId != null) {
            currentQuest = currentQuest?.copyWith(taskId: app!.taskId);
          }

          await _addMessage(generateUserMessage('Sure!'));
          setState(() => activeQuest = currentQuest);
        } catch (error) {
          await _addMessage(
            generateAssistantMessage(
              'Failed to get task reward info.\nWARNING: This quest will not provide rewards.',
            ),
          );
          debugPrint('Failed to get reward info: $error');
        }
      }
    }
  }

  Future<void> _handleToolCall(Map<String, dynamic> toolCall) async {
    try {
      final functionName = toolCall['function']?['name'];
      final arguments = toolCall['function']?['arguments'];
      if (functionName == null || arguments == null) return;

      switch (functionName) {
        case 'generate_quest':
        case 'validate_task_request':
          final questData = jsonDecode(arguments);
          final quest = Quest.fromJson(questData);
          await _handleQuestData(quest);
          break;
        default:
          debugPrint('Unknown tool call: $functionName');
      }
    } catch (error) {
      debugPrint('Failed to handle tool call: $error');
      await _addMessage(
        generateAssistantMessage(
          'I encountered an error processing the tool call. Please try again.',
        ),
      );
    }
  }

  Future<void> startRecordingHandler(int fps) async {
    try {
      recordingLoading = true;
      if (recordingState == RecordingState.off) {
        await ref
            .read(tauriApiClientProvider)
            .startRecording(quest: activeQuest, fps: fps);
        // TODO: To check
        // await emit('quest-overlay', { quest: activeQuest! });
        setState(() => recordingState = RecordingState.recording);
      }
      recordingLoading = false;
    } catch (error) {
      debugPrint('Recording error: $error');
    } finally {
      recordingLoading = false;
    }
  }

  Future<void> removeMessage() async {
    // Remove the last message from the chatMessages array
    if (chatMessages.isNotEmpty) {
      chatMessages = chatMessages.sublist(0, chatMessages.length - 1);
      _scrollToBottom();
    }
  }

  // Function to save deleted ranges to a JSON file
  Future<void> savePrivateRanges() async {
    if (currentRecordingId == null) return;

    try {
      // Convert deletedRanges to JSON string
      final rangesJson = jsonEncode(deletedRanges);

      // Use invoke to save the file to the recording folder
      await ref.read(tauriApiClientProvider).writeRecordingFile(
            recordingId: currentRecordingId!,
            filename: 'private_ranges.json',
            content: rangesJson,
          );

      debugPrint('Saved private ranges to file');
    } catch (error) {
      debugPrint('Failed to save private ranges: $error');
    }
  }

  Future<void> handleDeleteMessage(int index, Message msg) async {
    if (msg.timestamp == null || originalSftData == null) return;

    // Find previous and next messages in originalSftData
    final sortedMessages = [...originalSftData!]
      ..sort((a, b) => a.timestamp - b.timestamp)
      ..where((msg) => msg.role == 'assistant');
    final currentIndex =
        sortedMessages.indexWhere((m) => m.timestamp == msg.timestamp);

    int startTimestamp;
    int endTimestamp;

    // Calculate start timestamp by averaging with previous message if available
    if (currentIndex > 0) {
      final prevMsg = sortedMessages[currentIndex - 1];
      startTimestamp = (prevMsg.timestamp + msg.timestamp!) ~/ 2;
    } else {
      // No previous message, use fallback
      startTimestamp = msg.timestamp! - 5000;
    }

    // Calculate end timestamp by averaging with next message if available
    if (currentIndex < sortedMessages.length - 1) {
      final nextMsg = sortedMessages[currentIndex + 1];
      endTimestamp = (msg.timestamp! + nextMsg.timestamp) ~/ 2;
    } else {
      // No next message, use fallback
      endTimestamp = msg.timestamp! + 5000;
    }

    final count = originalSftData!
        .where(
          (m) => m.timestamp >= startTimestamp && m.timestamp <= endTimestamp,
        )
        .length;
    deletedRanges = [
      ...deletedRanges,
      DeletedRange(
        start: startTimestamp,
        end: endTimestamp,
        count: count,
      ),
    ];

    // Save the updated ranges to file
    await savePrivateRanges();

    chatMessages = [
      ...chatMessages.sublist(0, index),
      generateUserMessage(
        '---$startTimestamp $endTimestamp $count</delete>',
      ),
      ...chatMessages.sublist(index + 1),
    ];
  }

  Future<void> handleUndoDelete(int? clickedMessageIndex) async {
    // Parse the start, end, and count from the delete message
    if (clickedMessageIndex != null && originalSftData != null) {
      final deleteMsg = chatMessages[clickedMessageIndex];
      if (deleteMsg.content.startsWith('<delete>') &&
          deleteMsg.content.endsWith('</delete>')) {
        // Extract values from <delete>start end count</delete>
        final content =
            deleteMsg.content.substring(8, deleteMsg.content.length - 9);
        final parts = content.split(' ').map(int.parse).toList();
        final start = parts[0];
        final end = parts[1];

        // Remove the range from deletedRanges
        deletedRanges.removeWhere((r) => r.start == start);

        // Save the updated ranges to file
        await savePrivateRanges();

        // Find messages in originalSftData that fall within this time range
        final messagesToRestore = originalSftData!.where(
          (msg) => msg.timestamp >= start && msg.timestamp <= end,
        );

        // Create new messages to insert
        final newMessages = <Message>[];

        for (final msg in messagesToRestore) {
          if (msg.role == 'user' &&
              msg.content is Map &&
              msg.content?['type'] == 'image') {
            // VM sends the desktop screenshot
            newMessages.add(
              Message(
                role: 'assistant',
                content: '<img>${msg.content['data']}</img>',
                timestamp: msg.timestamp,
              ),
            );
          } else if (msg.role == 'assistant') {
            // Extract code block content when applicable
            dynamic content = msg.content;
            if (content is String && content.contains('```python')) {
              final match = RegExp(r'```python\s*\n(.*?)\n```', dotAll: true)
                  .firstMatch(content);
              if (match != null) {
                content = '<action>${match.group(1)!.trim()}</action>';
              }
            } else if (content is! String) {
              content = content.toString();
            }

            // User sends the action
            newMessages
                .add(generateUserMessage(content, timestamp: msg.timestamp));
          }
        }

        // Replace the delete message with the restored messages
        chatMessages = [
          ...chatMessages.sublist(0, clickedMessageIndex),
          ...newMessages,
          ...chatMessages.sublist(clickedMessageIndex + 1),
        ];
      }
    }

    _scrollToBottom();
  }

  Future<void> handleRecordingComplete() async {
    if (recordingLoading || recordingProcessing) return;

    setState(() {
      recordingLoading = true;
      recordingProcessing = true;
      activeQuest = null;
    });

    await _addMessage(
      generateUserMessage(
        '<loading>Saving recording...</loading>',
      ),
    );
    // TODO: To check
    // await emit('quest-overlay', { 'quest': null });

    setState(() => recordingLoading = false);

    if (recordingState == RecordingState.recording) {
      try {
        final recordingId =
            await ref.read(tauriApiClientProvider).stopRecording('done');
        setState(() {
          currentRecordingId = recordingId;
          recordingState = RecordingState.off;
        });
      } catch (e) {
        debugPrint('Error stopping recording: $e');
      }
    }

    await removeMessage();

    // Try to load SFT data
    if (currentRecordingId != null) {
      // show replaying status
      await _addMessage(
        generateUserMessage(
          '<loading>Replaying recording...</loading>',
        ),
      );

      // process the recording after stopping
      try {
        await ref
            .read(tauriApiClientProvider)
            .processRecording(currentRecordingId!);
        debugPrint('Recording processed: $currentRecordingId');
      } catch (processError) {
        debugPrint('Failed to automatically process recording: $processError');
      }

      final sftData = await _loadSftData(currentRecordingId!);
      await removeMessage();

      if (sftData != null && sftData.isNotEmpty) {
        // Store original SFT data for filtering
        setState(() => originalSftData = [...sftData]);

        // Add styled start replay message
        await _addMessage(
          generateAssistantMessage(
            '<start>--- demonstration replay ---</start>',
          ),
          audio: false,
          delay: false,
        );

        // Process SFT messages properly alternating between VM (assistant) and user
        for (final msg in sftData) {
          if (msg.role == 'user' &&
              msg.content is Map &&
              msg.content['type'] == 'image') {
            // VM sends the desktop screenshot
            await _addMessage(
              Message(
                role: 'assistant',
                content: '<img>${msg.content['data']}</img>',
                timestamp: msg.timestamp,
              ),
              audio: false,
              delay: false,
            );
          } else if (msg.role == 'assistant') {
            // Extract code block content when applicable
            dynamic content = msg.content;
            if (content is String && content.contains('```python')) {
              final match = RegExp(r'```python\s*\n(.*?)\n```', dotAll: true)
                  .firstMatch(content);
              if (match != null && match.group(1) != null) {
                content = '<action>${match.group(1)!.trim()}</action>';
              }
            } else if (msg.content is! String) {
              content = jsonEncode(msg.content);
            }

            // User sends the action (ignore scroll)
            await _addMessage(
              generateUserMessage(content, timestamp: msg.timestamp),
              audio: false,
              delay: false,
            );
          }
        }

        // Add end replay message
        await _addMessage(
          Message(
            role: 'assistant',
            content: '<end>--- end of replay ---</end>',
          ),
          delay: false,
        );
        await _addMessage(
          generateUserMessage('I completed the task! 🎉'),
        );
        await _addMessage(
          generateAssistantMessage('Great job completing the task!'),
        );
      } else {
        await _addMessage(
          generateUserMessage('<recording>$currentRecordingId</recording>'),
        );
        await _addMessage(
          generateUserMessage('I completed the task! 🎉'),
        );
        await _addMessage(
          generateAssistantMessage('Great job completing the task!'),
        );
      }
    }

    await _addMessage(
      generateAssistantMessage(
        "Review your demonstration before uploading. You can hover over messages to delete any sections containing sensitive information. Once you're ready, upload to get scored or do it later from the history page.",
      ),
    );
    await _addMessage(
      generateAssistantMessage(
        '<upload-button></upload-button>',
      ),
      delay: false,
    );

    if (mounted) setState(() => recordingProcessing = false);
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

  Future<void> handleGiveUp() async {
    if (recordingState == RecordingState.recording) {
      try {
        final recordingId =
            await ref.read(tauriApiClientProvider).stopRecording('fail');

        if (mounted) {
          setState(() {
            activeQuest = null;
            recordingState = RecordingState.off;
          });
        }
        // TODO: To check
        // await emit('quest-overlay', { 'quest': null });

        await _addMessage(
          generateUserMessage('<recording>$recordingId</recording>'),
        );
        await _addMessage(
          generateUserMessage('I give up on this task.'),
        );
        await _addMessage(
          generateAssistantMessage(
            "That's okay! Not every task is for everyone. Let me know if you'd like to try something else.",
          ),
        );
      } catch (e) {
        debugPrint('Error stopping recording: $e');
        return;
      }
    }
  }

  Future<void> _handleAssistantResponse(Map<String, dynamic> response) async {
    try {
      final message = response['data'];
      final toolCall = message['tool_calls']?[0];
      if (toolCall != null) {
        await _handleToolCall(toolCall);
      } else if (message['role'] == 'assistant' &&
          message['content'] is String) {
        await _addMessage(
          Message(
            role: message['role'],
            content: message['content'],
          ),
        );
      }
    } catch (error) {
      debugPrint('Failed to handle assistant response: $error');
      await _addMessage(
        generateAssistantMessage(
          'I encountered an error processing the response. Please try again.',
        ),
      );
    }
  }

  Future<void> _getInitialMessage() async {
    setState(() => isWaitingForResponse = true);
    try {
      final response = await http.post(
        Uri.parse('${Env.apiUrl}/api/v1/forge/chat'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'messages': [],
          'task_prompt': widget.prompt ?? 'anything keep it simple',
          'app': app?.toJson(),
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        await _handleAssistantResponse(responseData);
      } else {
        throw Exception('Failed to get initial message: ${response.body}');
      }
    } catch (e) {
      debugPrint('Failed to get initial message: $e');
      await _addMessage(
        generateAssistantMessage(
          "I'm sorry, I encountered an error starting our conversation. Please try again.",
        ),
      );
    } finally {
      if (mounted) {
        setState(() => isWaitingForResponse = false);
      }
    }
  }

  Future<void> handleDeleteRecording() async {
    if (currentRecordingId != null) {
      final deleted = await ref
          .read(tauriApiClientProvider)
          .deleteRecording(currentRecordingId!);
      if (deleted.isNotEmpty && mounted) {
        // TODO: /app/gym
        Navigator.of(context).pop();
      }
    }
  }

  void handleHover(int index) => setState(() => hoveredMessageIndex = index);

  void handleHoverEnd() => setState(() => hoveredMessageIndex = null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: chatMessages.length + (isWaitingForResponse ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == chatMessages.length) {
                  return _buildTypingIndicator();
                }
                final message = chatMessages[index];
                return _buildMessageItem(message, index);
              },
            ),
          ),
          if (activeQuest != null)
            QuestPanel(
              title: activeQuest!.title,
              reward: activeQuest!.reward,
              objectives: activeQuest!.objectives,
              onStartRecording: startRecordingHandler,
              onComplete: handleRecordingComplete,
              onGiveUp: handleGiveUp,
            ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(Message message, int index) {
    final isUser = message.role == 'user';
    // This is a simplified representation. You'll need to build out the message bubbles
    // according to your UI design, similar to the Svelte component.

    // Placeholder for special content parsing
    if (message.content.startsWith('<')) {
      if (message.content.startsWith('<img>')) {
        final base64 = message.content.substring(5, message.content.length - 6);
        return Align(
          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Card(
            child: Image.memory(base64Decode(base64), gaplessPlayback: true),
          ),
        );
      }
      if (message.content.startsWith('<recording>')) {
        final id = message.content.substring(11, message.content.length - 12);
        return RecordingPanel(recordingId: id);
      }
      if (message.content.startsWith('<upload-button>')) {
        return _buildUploadButton();
      }
      if (message.content.startsWith('<loading>')) {
        return const Center(child: CircularProgressIndicator());
      }
      // Handle other special tags like <start>, <end>, <action>, etc.
      return Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Card(
          color: isUser ? Colors.blue[100] : Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(message.content), // Default rendering for now
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
    if (typingMessage != null && typingMessage!.messageIndex == index) {
      return Text(
        '${typingMessage!.content}▋',
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
            onPressed:
                isUploading ? null : () {/* handleUploadClick logic here */},
            child: isUploading
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
              onPressed: handleDeleteRecording,
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
