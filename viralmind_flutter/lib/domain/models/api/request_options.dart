import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_options.freezed.dart';
part 'request_options.g.dart';

@freezed
class RequestOptions with _$RequestOptions {
  const factory RequestOptions({
    @Default(false) bool requiresAuth,
    Map<String, String>? headers,
  }) = _RequestOptions;

  factory RequestOptions.fromJson(Map<String, dynamic> json) =>
      _$RequestOptionsFromJson(json);
}
