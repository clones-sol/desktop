// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'submission_file.freezed.dart';
part 'submission_file.g.dart';

@freezed
class SubmissionFile with _$SubmissionFile {
  const factory SubmissionFile({
    required String file,
    required String s3Key,
    required int size,
    @JsonKey(name: '_id') required String id,
  }) = _SubmissionFile;

  factory SubmissionFile.fromJson(Map<String, dynamic> json) =>
      _$SubmissionFileFromJson(json);
}
