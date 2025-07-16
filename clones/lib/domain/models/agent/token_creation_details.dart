import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_creation_details.freezed.dart';
part 'token_creation_details.g.dart';

@freezed
class TokenCreationDetails with _$TokenCreationDetails {
  const factory TokenCreationDetails({
    required String txHash,
    required int timestamp,
    required int slot,
  }) = _TokenCreationDetails;

  factory TokenCreationDetails.fromJson(Map<String, dynamic> json) =>
      _$TokenCreationDetailsFromJson(json);
}
