import 'package:freezed_annotation/freezed_annotation.dart';

part 'supported_token.freezed.dart';
part 'supported_token.g.dart';

@freezed
class SupportedToken with _$SupportedToken {
  const factory SupportedToken({
    required String name,
    required String symbol,
    required String? logoUrl,
  }) = _SupportedToken;

  factory SupportedToken.fromJson(Map<String, dynamic> json) =>
      _$SupportedTokenFromJson(json);
}
