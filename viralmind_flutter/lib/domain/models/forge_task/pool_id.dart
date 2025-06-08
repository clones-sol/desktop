import 'package:freezed_annotation/freezed_annotation.dart';

part 'pool_id.freezed.dart';
part 'pool_id.g.dart';

@freezed
class PoolId with _$PoolId {
  const factory PoolId({
    required String id,
    required String name,
    required String status,
    required double pricePerDemo,
  }) = _PoolId;

  factory PoolId.fromJson(Map<String, dynamic> json) => _$PoolIdFromJson(json);
}
