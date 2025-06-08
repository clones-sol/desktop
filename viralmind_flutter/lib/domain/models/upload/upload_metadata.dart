import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_metadata.freezed.dart';
part 'upload_metadata.g.dart';

@freezed
class UploadMetadata with _$UploadMetadata {
  const factory UploadMetadata({
    String? poolId,
    int? generatedTime,
    required String id,
  }) = _UploadMetadata;

  factory UploadMetadata.fromJson(Map<String, dynamic> json) =>
      _$UploadMetadataFromJson(json);
}
