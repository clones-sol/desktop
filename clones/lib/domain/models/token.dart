import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

enum TokenType {
  @JsonValue('SOL')
  sol,
  @JsonValue('CLNS')
  clones,
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
      case 'CLNS':
        return TokenType.clones;
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
      case TokenType.clones:
        return 'CLNS';
      case TokenType.custom:
        return 'CUSTOM';
    }
  }
}
