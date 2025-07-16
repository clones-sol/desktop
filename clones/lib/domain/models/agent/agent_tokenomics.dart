import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_tokenomics.freezed.dart';
part 'agent_tokenomics.g.dart';

@freezed
class AgentTokenomics with _$AgentTokenomics {
  const factory AgentTokenomics({
    required int supply,
    required double minLiquiditySol,
    @Default(0) double gatedPercentage,
    @Default(9) int decimals,
  }) = _AgentTokenomics;

  factory AgentTokenomics.fromJson(Map<String, dynamic> json) =>
      _$AgentTokenomicsFromJson(json);
}
