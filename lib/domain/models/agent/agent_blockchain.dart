import 'package:clones_desktop/domain/models/agent/pool_creation_details.dart';
import 'package:clones_desktop/domain/models/agent/token_creation_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_blockchain.freezed.dart';
part 'agent_blockchain.g.dart';

@freezed
class AgentBlockchain with _$AgentBlockchain {
  const factory AgentBlockchain({
    String? tokenAddress,
    TokenCreationDetails? tokenCreationDetails,
    String? poolAddress,
    PoolCreationDetails? poolCreationDetails,
  }) = _AgentBlockchain;

  factory AgentBlockchain.fromJson(Map<String, dynamic> json) =>
      _$AgentBlockchainFromJson(json);
}
