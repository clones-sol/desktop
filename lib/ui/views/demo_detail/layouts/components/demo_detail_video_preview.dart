import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/views/demo_detail/bloc/provider.dart';
import 'package:clones_desktop/utils/format_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class DemoDetailVideoPreview extends ConsumerStatefulWidget {
  const DemoDetailVideoPreview({super.key});

  @override
  ConsumerState<DemoDetailVideoPreview> createState() =>
      _DemoDetailVideoPreviewState();
}

class _DemoDetailVideoPreviewState
    extends ConsumerState<DemoDetailVideoPreview> {
  Offset? _hoverPosition;

  @override
  Widget build(BuildContext context) {
    final isLoading =
        ref.watch(demoDetailNotifierProvider.select((s) => s.isLoading));
    final videoController =
        ref.watch(demoDetailNotifierProvider.select((s) => s.videoController));

    final videoLoaded =
        videoController != null && videoController.value.isInitialized;

    final theme = Theme.of(context);
    return IntrinsicHeight(
      child: CardWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Video Preview',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            if (!videoLoaded)
              Text('No video found', style: theme.textTheme.bodyMedium)
            else
              Stack(
                alignment: Alignment.center,
                children: [
                  if (isLoading)
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
                      opacity: videoController.value.isPlaying ? 1 : 0.5,
                      child: AspectRatio(
                        aspectRatio: videoController.value.aspectRatio,
                        child: VideoPlayer(videoController),
                      ),
                    ),
                  if (videoLoaded)
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
            if (videoLoaded)
              _buildCustomTimeline(context, ref, videoController),
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
    final theme = Theme.of(context);
    final events =
        ref.watch(demoDetailNotifierProvider.select((s) => s.events));
    final startTime =
        ref.watch(demoDetailNotifierProvider.select((s) => s.startTime));
    final enabledEventTypes = ref
        .watch(demoDetailNotifierProvider.select((s) => s.enabledEventTypes));
    final duration = controller.value.duration;

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return MouseRegion(
            onHover: (event) {
              setState(() {
                _hoverPosition = event.localPosition;
              });
            },
            onExit: (_) {
              setState(() {
                _hoverPosition = null;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                VideoProgressIndicator(
                  controller,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    backgroundColor: Colors.transparent,
                    playedColor: ClonesColors.secondary,
                    bufferedColor: ClonesColors.tertiary.withOpacity(0.3),
                  ),
                ),
                if (duration.inMilliseconds > 0)
                  ...events
                      .where((event) => enabledEventTypes.contains(event.event))
                      .map(
                        (event) => Positioned(
                          left: ((event.time - startTime) /
                                  duration.inMilliseconds) *
                              constraints.maxWidth,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color:
                                  ClonesColors.getEventTypeColor(event.event),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                if (_hoverPosition != null)
                  Positioned(
                    left: _hoverPosition!.dx.clamp(0, constraints.maxWidth),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: ClonesColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                if (_hoverPosition != null && duration.inMilliseconds > 0)
                  Positioned(
                    top: 40,
                    left: _hoverPosition!.dx.clamp(
                      0,
                      constraints.maxWidth - 40,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        formatTimeMs(
                          ((_hoverPosition!.dx / constraints.maxWidth) *
                                  duration.inMilliseconds)
                              .toInt(),
                        ),
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
