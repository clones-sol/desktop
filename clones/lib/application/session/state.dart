import 'package:clones/utils/env.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class Session with _$Session {
  const factory Session({
    String? address,
    String? connectionToken,
    double? balance,
  }) = _Session;
  const Session._();

  bool get isConnected => address != null && connectionToken != null;

  String get connectionUrl =>
      '${Env.apiWebsiteUrl}/connect?token=$connectionToken';
}
