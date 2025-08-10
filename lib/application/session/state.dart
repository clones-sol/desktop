import 'package:clones_desktop/domain/models/wallet/token_balance.dart';
import 'package:clones_desktop/utils/env.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class Session with _$Session {
  const factory Session({
    String? address,
    String? connectionToken,
    List<TokenBalance>? balances,
    String? referralCode,
  }) = _Session;
  const Session._();

  bool get isConnected => address != null && connectionToken != null;

  String get connectionUrl =>
      '${Env.apiWebsiteUrl}/connect?token=$connectionToken';
}
