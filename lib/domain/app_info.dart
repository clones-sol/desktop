import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_info.freezed.dart';
part 'app_info.g.dart';

@freezed
class AppInfo with _$AppInfo {
  const factory AppInfo({
    required String name,
    required String type,
    required String url,
    String? taskId,
  }) = _AppInfo;

  factory AppInfo.fromJson(Map<String, dynamic> json) =>
      _$AppInfoFromJson(json);
}
