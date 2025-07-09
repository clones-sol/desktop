import 'package:clones/domain/models/forge_task/forge_app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gym_generate_response.freezed.dart';
part 'gym_generate_response.g.dart';

@freezed
class GymGenerateResponse with _$GymGenerateResponse {
  const factory GymGenerateResponse({
    required GymGenerateResponseContent content,
  }) = _GymGenerateResponse;

  factory GymGenerateResponse.fromJson(Map<String, dynamic> json) =>
      _$GymGenerateResponseFromJson(json);
}

@freezed
class GymGenerateResponseContent with _$GymGenerateResponseContent {
  const factory GymGenerateResponseContent({
    required String name,
    required List<ForgeApp> apps,
  }) = _GymGenerateResponseContent;

  factory GymGenerateResponseContent.fromJson(Map<String, dynamic> json) =>
      _$GymGenerateResponseContentFromJson(json);
}
