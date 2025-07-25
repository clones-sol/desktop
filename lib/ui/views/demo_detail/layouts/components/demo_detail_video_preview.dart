import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/views/demo_detail/bloc/provider.dart';
import 'package:clones_desktop/utils/format_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class DemoDetailVideoPreview extends ConsumerStatefulWidget {
  const DemoDetailVideoPreview({super.key, this.onExpand});
  final VoidCallback? onExpand;

  @override
  ConsumerState<DemoDetailVideoPreview> createState() =>
      _DemoDetailVideoPreviewState();
}

class _DemoDetailVideoPreviewState
    extends ConsumerState<DemoDetailVideoPreview> {
  Offset? _hoverPosition;
  RangeValues? _previewSegment;
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(demoDetailNotifierProvider);
    final videoController = state.videoController;

    final videoLoaded =
        videoController != null && videoController.value.isInitialized;

    final theme = Theme.of(context);
    return CardWidget(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Video Preview',
                  style: theme.textTheme.titleMedium,
                ),
                if (widget.onExpand != null)
                  IconButton(
                    icon: const Icon(
                      Icons.fullscreen,
                      color: VMColors.secondary,
                    ),
                    onPressed: widget.onExpand,
                    tooltip: 'Fullscreen',
                  ),
              ],
            ),
            const SizedBox(height: 10),
            if (!videoLoaded)
              Text('No video found', style: theme.textTheme.bodyMedium)
            else
              MouseRegion(
                onHover: (event) =>
                    setState(() => _hoverPosition = event.localPosition),
                onExit: (_) => setState(() => _hoverPosition = null),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (state.isLoading)
                      const Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                          ),
                        ),
                      )
                    else
                      Opacity(
                        opacity: _hoverPosition != null ||
                                videoController.value.isPlaying
                            ? 1
                            : 0.5,
                        child: AspectRatio(
                          aspectRatio: videoController.value.aspectRatio,
                          child: VideoPlayer(videoController),
                        ),
                      ),
                    if (videoLoaded && _hoverPosition != null && !_isEditing)
                      ValueListenableBuilder<VideoPlayerValue>(
                        valueListenable: videoController,
                        builder: (context, value, child) {
                          return IconButton(
                            icon: Icon(
                              value.isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                              size: 50,
                            ),
                            onPressed: () {
                              if (value.isPlaying) {
                                videoController.pause();
                              } else {
                                videoController.play();
                              }
                            },
                          );
                        },
                      ),
                  ],
                ),
              ),
            if (videoLoaded)
              _buildCustomTimeline(context, ref, videoController),
            if (videoLoaded)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Edit Mode',
                      style: theme.textTheme.labelMedium,
                    ),
                    const SizedBox(width: 8),
                    Switch(
                      value: _isEditing,
                      onChanged: (value) {
                        setState(() {
                          _isEditing = value;
                        });
                      },
                      activeColor: VMColors.primary,
                    ),
                    const SizedBox(width: 32),
                    if (_isEditing)
                      BtnPrimary(
                        onTap: ref
                            .read(demoDetailNotifierProvider.notifier)
                            .applyEdits,
                        icon: Icons.check,
                        buttonText: 'Apply Edits',
                        btnPrimaryType: BtnPrimaryType.outlinePrimary,
                        isLoading: state.isApplyingEdits,
                        isLocked: state.isApplyingEdits ||
                            state.deletedSegments.isEmpty,
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomTimeline(
    BuildContext context,
    WidgetRef ref,
    VideoPlayerController controller,
  ) {
    final state = ref.watch(demoDetailNotifierProvider);
    final duration = controller.value.duration;
    final durationMs = duration.inMilliseconds.toDouble();

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final timelineWidth = constraints.maxWidth;

          return GestureDetector(
            onTapUp: !_isEditing
                ? (details) {
                    final clickPosition = details.localPosition.dx;
                    final seekTime =
                        (clickPosition / timelineWidth * durationMs).round();
                    controller.seekTo(Duration(milliseconds: seekTime));
                  }
                : null,
            onHorizontalDragStart: _isEditing
                ? (details) {
                    final clickTime =
                        (details.localPosition.dx / timelineWidth * durationMs);
                    setState(() {
                      _previewSegment = RangeValues(clickTime, clickTime);
                    });
                  }
                : null,
            onHorizontalDragUpdate: _isEditing
                ? (details) {
                    if (_previewSegment == null) return;
                    final dragEnd =
                        (details.localPosition.dx / timelineWidth * durationMs)
                            .clamp(0.0, durationMs);
                    setState(() {
                      _previewSegment =
                          RangeValues(_previewSegment!.start, dragEnd);
                    });
                  }
                : null,
            onHorizontalDragEnd: _isEditing
                ? (_) {
                    if (_previewSegment != null) {
                      final start =
                          _previewSegment!.start < _previewSegment!.end
                              ? _previewSegment!.start
                              : _previewSegment!.end;
                      final end = _previewSegment!.start < _previewSegment!.end
                          ? _previewSegment!.end
                          : _previewSegment!.start;
                      if ((end - start) > 100) {
                        ref
                            .read(demoDetailNotifierProvider.notifier)
                            .addDeletedSegment(RangeValues(start, end));
                      }
                    }
                    setState(() => _previewSegment = null);
                  }
                : null,
            child: MouseRegion(
              onHover: (event) =>
                  setState(() => _hoverPosition = event.localPosition),
              onExit: (_) => setState(() => _hoverPosition = null),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  baseTrack(context),
                  progressBar(context, controller, timelineWidth),
                  eventMarkers(context, ref, controller, timelineWidth),
                  // Render committed deleted segments with handles
                  for (int i = 0; i < state.deletedSegments.length; i++)
                    ..._buildSegment(i, state.deletedSegments[i], durationMs,
                        timelineWidth, ref, _isEditing),

                  // Render preview segment
                  if (_isEditing && _previewSegment != null)
                    _buildPreviewSegment(
                      _previewSegment!,
                      durationMs,
                      timelineWidth,
                    ),

                  hoverPositionLineAndTimeLabel(
                    context,
                    controller,
                    timelineWidth,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPreviewSegment(
    RangeValues segment,
    double durationMs,
    double timelineWidth,
  ) {
    final start = segment.start < segment.end ? segment.start : segment.end;
    final end = segment.start < segment.end ? segment.end : segment.start;
    return Positioned(
      left: (start / durationMs) * timelineWidth,
      right: timelineWidth - (end / durationMs) * timelineWidth,
      top: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          border: Border.symmetric(
            vertical: BorderSide(
              color: Colors.yellowAccent.withOpacity(0.7),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSegment(int index, RangeValues segment, double durationMs,
      double timelineWidth, WidgetRef ref, bool isEditing) {
    const handleWidth = 8.0;
    const touchWidth = 20.0;

    final widgets = <Widget>[
      // Main segment body
      Positioned(
        left: (segment.start / durationMs) * timelineWidth,
        right: timelineWidth - (segment.end / durationMs) * timelineWidth,
        top: 0,
        bottom: 0,
        child: Container(
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    ];

    if (isEditing) {
      widgets.addAll([
        // Start handle
        Positioned(
          left: (segment.start / durationMs) * timelineWidth - touchWidth / 2,
          top: 0,
          bottom: 0,
          width: touchWidth,
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              final newStart = (segment.start +
                      (details.delta.dx / timelineWidth) * durationMs)
                  .clamp(0.0, segment.end);
              ref
                  .read(demoDetailNotifierProvider.notifier)
                  .updateDeletedSegment(
                      index, RangeValues(newStart, segment.end));
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeLeftRight,
              child: Center(
                  child: Container(
                      width: handleWidth, color: Colors.yellowAccent)),
            ),
          ),
        ),
        // End handle
        Positioned(
          left: (segment.end / durationMs) * timelineWidth - touchWidth / 2,
          top: 0,
          bottom: 0,
          width: touchWidth,
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              final newEnd = (segment.end +
                      (details.delta.dx / timelineWidth) * durationMs)
                  .clamp(segment.start, durationMs);
              ref
                  .read(demoDetailNotifierProvider.notifier)
                  .updateDeletedSegment(
                      index, RangeValues(segment.start, newEnd));
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeLeftRight,
              child: Center(
                  child: Container(
                      width: handleWidth, color: Colors.yellowAccent)),
            ),
          ),
        ),
        // Delete button
        Positioned(
          left: (segment.start / durationMs) * timelineWidth + 2,
          top: 2,
          child: InkWell(
            onTap: () => ref
                .read(demoDetailNotifierProvider.notifier)
                .removeDeletedSegment(index),
            child: const Icon(Icons.close, color: Colors.white, size: 14),
          ),
        ),
      ]);
    }
    return widgets;
  }

  Widget baseTrack(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget progressBar(
    BuildContext context,
    VideoPlayerController controller,
    double timelineWidth,
  ) {
    final durationMs = controller.value.duration.inMilliseconds.toDouble();
    if (durationMs > 0) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: (controller.value.position.inMilliseconds / durationMs) *
              timelineWidth,
          height: 4,
          decoration: BoxDecoration(
            color: VMColors.secondary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget eventMarkers(
    BuildContext context,
    WidgetRef ref,
    VideoPlayerController controller,
    double timelineWidth,
  ) {
    final durationMs = controller.value.duration.inMilliseconds.toDouble();
    final events = ref.watch(demoDetailNotifierProvider).events;
    final enabledEventTypes =
        ref.watch(demoDetailNotifierProvider).enabledEventTypes;
    final startTime = ref.watch(demoDetailNotifierProvider).startTime;
    if (durationMs > 0) {
      return Stack(
        children: events
            .where(
              (event) =>
                  enabledEventTypes.contains(event.event) &&
                  (event.time - startTime) <= durationMs,
            )
            .map(
              (event) => Positioned(
                left: ((event.time - startTime) / durationMs) * timelineWidth,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: VMColors.getEventTypeColor(event.event),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      );
    }
    return const SizedBox.shrink();
  }

  Widget hoverPositionLineAndTimeLabel(
    BuildContext context,
    VideoPlayerController controller,
    double timelineWidth,
  ) {
    final theme = Theme.of(context);
    final durationMs = controller.value.duration.inMilliseconds.toDouble();

    final children = <Widget>[];

    if (_hoverPosition != null) {
      children.add(
        Positioned(
          left: _hoverPosition!.dx.clamp(0, timelineWidth),
          top: 0,
          bottom: 0,
          child: Container(
            width: 2,
            color: VMColors.primary.withValues(alpha: 0.8),
          ),
        ),
      );
    }
    if (_hoverPosition != null && durationMs > 0) {
      children.add(
        Positioned(
          top: -25,
          left: (_hoverPosition!.dx - 20).clamp(0.0, timelineWidth - 40),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              formatTimeMs(
                ((_hoverPosition!.dx / timelineWidth) * durationMs).toInt(),
              ),
              style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
            ),
          ),
        ),
      );
    }
    return Stack(children: children);
  }
}
