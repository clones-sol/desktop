import 'dart:async';

import 'package:clones/domain/models/quest/quest.dart';
import 'package:clones/ui/views/training_session/bloc/provider.dart';
import 'package:clones/ui/views/training_session/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverlayView extends ConsumerStatefulWidget {
  const OverlayView({super.key});

  @override
  ConsumerState<OverlayView> createState() => _OverlayViewState();
}

class _OverlayViewState extends ConsumerState<OverlayView> {
  Timer? _timer;
  int _seconds = 0;
  bool _isLocked = false;
  bool _isCollapsed = false;
  bool _focused = true; // Assume focused by default for now

  @override
  void initState() {
    super.initState();
    _initializeState();
  }

  void _initializeState() {
    final recordingState =
        ref.read(trainingSessionNotifierProvider).recordingState;
    if (recordingState == RecordingState.recording) {
      _startTimer();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final recordingState =
        ref.watch(trainingSessionNotifierProvider).recordingState;

    if (recordingState == RecordingState.recording && _timer == null) {
      _startTimer();
    } else if (recordingState != RecordingState.recording && _timer != null) {
      _stopTimer();
    }
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  String get _formattedTime {
    final hours = (_seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((_seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final seconds = (_seconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  void _handleStop() {
    ref.read(trainingSessionNotifierProvider.notifier).recordingComplete();
  }

  void _toggleCollapsed() {
    setState(() {
      _isCollapsed = !_isCollapsed;
    });
  }

  void _toggleLocked() {
    setState(() {
      _isLocked = !_isLocked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final recordingState =
        ref.watch(trainingSessionNotifierProvider).recordingState;
    final activeQuest = ref.watch(trainingSessionNotifierProvider).activeQuest;

    if (recordingState == RecordingState.off) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onPanStart: (details) {
        if (!_isLocked) {
          // This requires a window manager to start dragging.
          // ref.read(tauriApiClientProvider).startDragging();
        }
      },
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Opacity(
          opacity: _focused ? 1.0 : 0.7,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(recordingState),
              if (!_isCollapsed) _buildContent(activeQuest, recordingState),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(RecordingState recordingState) {
    String statusText;
    Color statusColor;

    switch (recordingState) {
      case RecordingState.starting:
        statusText = 'Starting';
        statusColor = Colors.red;
        break;
      case RecordingState.recording:
        statusText = 'Recording';
        statusColor = Colors.red;
        break;
      case RecordingState.stopping:
        statusText = 'Stopping';
        statusColor = Colors.green;
        break;
      default:
        statusText = 'Stopped';
        statusColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color(0xFF4A4A4A), // Equivalent to bg-primary-600
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(statusText,
              style: const TextStyle(color: Colors.white, fontSize: 14)),
          const Spacer(),
          Text(_formattedTime,
              style: const TextStyle(color: Colors.white, fontSize: 12)),
          const SizedBox(width: 8),
          _buildIconButton(
            _isCollapsed ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            _toggleCollapsed,
          ),
          _buildIconButton(
            _isLocked ? Icons.lock : Icons.lock_open,
            _toggleLocked,
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: 24,
      height: 24,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, color: Colors.white, size: 18),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildContent(Quest? quest, RecordingState recordingState) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF333333), // Equivalent to bg-primary-400/50
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(_isCollapsed ? 0 : 8),
          bottomRight: Radius.circular(_isCollapsed ? 0 : 8),
        ),
      ),
      child: Column(
        children: [
          if (quest != null) _buildQuestDetails(quest),
          if (quest == null)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2))),
            ),
          _buildControls(recordingState),
        ],
      ),
    );
  }

  Widget _buildQuestDetails(Quest quest) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quest.title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          if (quest.objectives.isNotEmpty)
            SizedBox(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: quest.objectives.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        Expanded(
                          child: Text(
                            quest.objectives[index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildControls(RecordingState recordingState) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF555555))),
        color: Color(0xFF666666),
      ),
      child: Row(
        children: [
          if (recordingState == RecordingState.recording)
            Expanded(
              child: TextButton.icon(
                icon: const Icon(Icons.stop, size: 16, color: Colors.white),
                label: const Text('Stop',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                onPressed: _handleStop,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  foregroundColor: Colors.red,
                ),
              ),
            ),
          if (recordingState == RecordingState.starting ||
              recordingState == RecordingState.stopping)
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
