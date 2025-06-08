import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

enum TokenType {
  @JsonValue('SOL')
  sol,
  @JsonValue('VIRAL')
  viral,
  @JsonValue('CUSTOM')
  custom,
}

@freezed
class Token with _$Token {
  const factory Token({
    required TokenType type,
    required String symbol,
    required String address,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  static TokenType parseTokenType(String type) {
    switch (type) {
      case 'SOL':
        return TokenType.sol;
      case 'VIRAL':
        return TokenType.viral;
      case 'CUSTOM':
        return TokenType.custom;
      default:
        throw Exception('Unknown TokenType : $type');
    }
  }

  static String getTokenType(TokenType type) {
    switch (type) {
      case TokenType.sol:
        return 'SOL';
      case TokenType.viral:
        return 'VIRAL';
      case TokenType.custom:
        return 'CUSTOM';
    }
  }
}
