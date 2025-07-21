import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_balance.freezed.dart';
part 'token_balance.g.dart';

@freezed
class TokenBalance with _$TokenBalance {
  const factory TokenBalance({
    required String symbol,
    required String name,
    required String? logoUrl,
    double? balance,
    @Default(false) bool isLoading,
  }) = _TokenBalance;

  factory TokenBalance.fromJson(Map<String, dynamic> json) =>
      _$TokenBalanceFromJson(json);
}
