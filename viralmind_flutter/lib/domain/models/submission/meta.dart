import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viralmind_flutter/domain/models/quest/quest.dart';

part 'meta.freezed.dart';
part 'meta.g.dart';

// TODO: doublon with upload_metadata.dart ?
@freezed
class Meta with _$Meta {
  const factory Meta({
    required Quest quest,
    required String poolId,
    required String id,
    required int generatedTime,
    Map<String, dynamic>? extra,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
