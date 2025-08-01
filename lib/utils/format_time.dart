String formatTime(int seconds) {
  final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
  final secs = (seconds % 60).toString().padLeft(2, '0');
  return '$minutes:$secs';
}

String formatTimeWithHours(int seconds) {
  final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
  final minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
  final secs = (seconds % 60).toString().padLeft(2, '0');
  return '$hours:$minutes:$secs';
}

String formatDuration(int seconds) {
  if (seconds == 0) return '0:00';
  final duration = Duration(seconds: seconds);
  final minutes = duration.inMinutes;
  final remainingSeconds = duration.inSeconds % 60;
  return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
}

String formatTimeMs(int ms) {
  final totalSeconds = ms / 1000;
  final minutes = (totalSeconds / 60).floor();
  final seconds = totalSeconds % 60;
  return "${minutes.toString().padLeft(2, '0')}:${seconds.toStringAsFixed(3).padLeft(6, '0')}";
}
