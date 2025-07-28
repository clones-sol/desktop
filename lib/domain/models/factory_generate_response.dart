import 'package:clones_desktop/domain/models/forge_task/forge_app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'factory_generate_response.freezed.dart';
part 'factory_generate_response.g.dart';

@freezed
class FactoryGenerateResponse with _$FactoryGenerateResponse {
  const factory FactoryGenerateResponse({
    required FactoryGenerateResponseContent content,
  }) = _FactoryGenerateResponse;

  factory FactoryGenerateResponse.fromJson(Map<String, dynamic> json) =>
      _$FactoryGenerateResponseFromJson(json);
}

@freezed
class FactoryGenerateResponseContent with _$FactoryGenerateResponseContent {
  const factory FactoryGenerateResponseContent({
    required String name,
    required List<ForgeApp> apps,
  }) = _FactoryGenerateResponseContent;

  factory FactoryGenerateResponseContent.fromJson(Map<String, dynamic> json) =>
      _$FactoryGenerateResponseContentFromJson(json);
}
