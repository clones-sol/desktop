import 'package:viralmind_flutter/domain/models/quest/quest.dart';

class RecordingRepositoryImpl {
  RecordingRepositoryImpl();

  Future<void> startRecording({
    Quest? quest,
    int fps = 30,
  }) async {
    // TODO: Implement the native call to start recording (platform channel/plugin)
    throw UnimplementedError(
      'startRecording is platform-specific and not implemented.',
    );
  }

  /// Stop recording (stub, requires native implementation)
  Future<String> stopRecording({String? reason}) async {
    // TODO: Implement the native call to stop recording (platform channel/plugin)
    throw UnimplementedError(
      'stopRecording is platform-specific and not implemented.',
    );
  }
}
