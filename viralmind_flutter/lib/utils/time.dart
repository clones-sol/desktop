// Formats seconds into a MM:SS time string
String formatTime(int seconds) {
  final mins = (seconds ~/ 60).toString().padLeft(2, '0');
  final secs = (seconds % 60).toString().padLeft(2, '0');
  return '$mins:$secs';
}
