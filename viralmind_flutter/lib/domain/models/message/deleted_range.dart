import 'package:freezed_annotation/freezed_annotation.dart';

part 'deleted_range.freezed.dart';
part 'deleted_range.g.dart';

@freezed
class DeletedRange with _$DeletedRange {
  const factory DeletedRange({
    required int start,
    required int end,
    required int count,
  }) = _DeletedRange;

  factory DeletedRange.fromJson(Map<String, dynamic> json) =>
      _$DeletedRangeFromJson(json);
}
