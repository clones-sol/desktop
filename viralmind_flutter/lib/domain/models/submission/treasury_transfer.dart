// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'treasury_transfer.freezed.dart';
part 'treasury_transfer.g.dart';

@freezed
class TreasuryTransfer with _$TreasuryTransfer {
  const factory TreasuryTransfer({
    required String tokenAddress,
    required String treasuryWallet,
    required int amount,
    required int timestamp,
    String? txHash,
    @JsonKey(name: '_id') required String id,
  }) = _TreasuryTransfer;

  factory TreasuryTransfer.fromJson(Map<String, dynamic> json) =>
      _$TreasuryTransferFromJson(json);
}
