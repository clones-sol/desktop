import 'package:clones_desktop/domain/models/token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pool_id.freezed.dart';
part 'pool_id.g.dart';

@freezed
class PoolId with _$PoolId {
  const factory PoolId({
    @JsonKey(name: '_id', includeIfNull: false) required String id,
    @JsonKey(includeIfNull: false) required String name,
    @JsonKey(includeIfNull: false) required String status,
    @JsonKey(includeIfNull: false) required double pricePerDemo,
    @JsonKey(includeIfNull: false) Token? token,
  }) = _PoolId;

  factory PoolId.fromJson(Map<String, dynamic> json) => _$PoolIdFromJson(json);
}
