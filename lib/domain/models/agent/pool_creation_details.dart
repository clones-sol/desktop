import 'package:freezed_annotation/freezed_annotation.dart';

part 'pool_creation_details.freezed.dart';
part 'pool_creation_details.g.dart';

@freezed
class PoolCreationDetails with _$PoolCreationDetails {
  const factory PoolCreationDetails({
    required String txHash,
    required int timestamp,
    required int slot,
  }) = _PoolCreationDetails;

  factory PoolCreationDetails.fromJson(Map<String, dynamic> json) =>
      _$PoolCreationDetailsFromJson(json);
}
