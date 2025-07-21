import 'package:freezed_annotation/freezed_annotation.dart';

part 'recording_event.freezed.dart';

@freezed
class RecordingEvent with _$RecordingEvent {
  const factory RecordingEvent({
    required int time,
    required String event,
    required Map<String, dynamic> data,
  }) = _RecordingEvent;

  factory RecordingEvent.fromJson(Map<String, dynamic> json) {
    return RecordingEvent(
      time: json['time'],
      event: json['event'],
      data: json['data'],
    );
  }
}
