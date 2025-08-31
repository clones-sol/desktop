// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'factory_token.freezed.dart';
part 'factory_token.g.dart';

/// Factory token information
@freezed
class FactoryToken with _$FactoryToken {
  const factory FactoryToken({
    required String type, // 'ETH' | 'ERC20'
    required String symbol,
    required String address,
    @Default(18) int decimals,
  }) = _FactoryToken;

  factory FactoryToken.fromJson(Map<String, dynamic> json) =>
      _$FactoryTokenFromJson(json);
}
