import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TimestampButton extends StatelessWidget {
  final Duration timestamp;
  final Duration startTime;
  final VideoPlayerController? videoController;

  const TimestampButton({
    super.key,
    required this.timestamp,
    required this.startTime,
    this.videoController,
  });

  String formatTime(Duration duration) {
    final relative = duration - startTime;
    final minutes = relative.inMinutes;
    final seconds =
        (relative.inSeconds % 60) + (relative.inMilliseconds % 1000) / 1000;
    final secondsStr = seconds.toStringAsFixed(3).padLeft(6, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  void handleClick() {
    if (videoController != null) {
      final relative = timestamp - startTime;
      videoController!.seekTo(relative);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: handleClick,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        backgroundColor: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Text(
        formatTime(timestamp),
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
