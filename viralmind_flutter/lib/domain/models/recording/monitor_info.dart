import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitor_info.freezed.dart';
part 'monitor_info.g.dart';

@freezed
class MonitorInfo with _$MonitorInfo {
  const factory MonitorInfo({
    required int width,
    required int height,
  }) = _MonitorInfo;

  factory MonitorInfo.fromJson(Map<String, dynamic> json) =>
      _$MonitorInfoFromJson(json);
}
