import 'package:clones_desktop/application/session/provider.dart';
import 'package:clones_desktop/domain/models/agent/agent_legal.dart';
import 'package:clones_desktop/domain/models/agent/agent_socket_message.dart';
import 'package:clones_desktop/domain/models/agent/agent_tokenomics.dart';
import 'package:clones_desktop/domain/models/agent/agent_transaction.dart';
import 'package:clones_desktop/domain/models/agent/factory_agent.dart';
import 'package:clones_desktop/infrastructure/agent.repository.dart';
import 'package:clones_desktop/infrastructure/agent_socket.service.dart';
import 'package:clones_desktop/utils/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'agent.g.dart';

@riverpod
AgentRepositoryImpl agentRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AgentRepositoryImpl(apiClient);
}

@riverpod
Future<FactoryAgent> createAgent(
  Ref ref, {
  required String poolId,
  required String agentName,
  required String ticker,
  required String description,
  String? logoUrl,
  required AgentTokenomics tokenomics,
  required AgentLegal legal,
  String? customUrl,
  String? huggingFaceApiKey,
}) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.createAgent(
    poolId: poolId,
    agentName: agentName,
    ticker: ticker,
    description: description,
    logoUrl: logoUrl,
    tokenomics: tokenomics,
    legal: legal,
    customUrl: customUrl,
    huggingFaceApiKey: huggingFaceApiKey,
  );
}

@riverpod
Future<FactoryAgent?> getAgentByPoolId(Ref ref, String poolId) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.getAgentByPoolId(poolId);
}

@riverpod
Future<List<FactoryAgent>> listAgents(Ref ref) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.listAgents();
}

@riverpod
Future<FactoryAgent> updateAgent(
  Ref ref, {
  required String agentId,
  String? agentName,
  String? description,
  String? logoUrl,
  String? customUrl,
  String? huggingFaceApiKey,
}) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.updateAgent(
    agentId: agentId,
    agentName: agentName,
    description: description,
    logoUrl: logoUrl,
    customUrl: customUrl,
    huggingFaceApiKey: huggingFaceApiKey,
  );
}

@riverpod
Future<FactoryAgent> deployAgent(Ref ref, String agentId) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.deployAgent(agentId);
}

@riverpod
Future<FactoryAgent> cancelDeployment(Ref ref, String agentId) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.cancelDeployment(agentId);
}

@riverpod
Future<FactoryAgent> retryDeployment(Ref ref, String agentId) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.retryDeployment(agentId);
}

@riverpod
Future<FactoryAgent> deactivateAgent(Ref ref, String agentId) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.deactivateAgent(agentId);
}

@riverpod
Future<FactoryAgent> archiveAgent(Ref ref, String agentId) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.archiveAgent(agentId);
}

@riverpod
Future<UnsignedTransaction> getUnsignedTransaction(
  Ref ref, {
  required String agentId,
  required AgentTransactionType type,
}) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.getUnsignedTransaction(
    agentId: agentId,
    type: type,
  );
}

@riverpod
Future<SubmitTxResponse> submitTransaction(
  Ref ref, {
  required String agentId,
  required AgentTransactionType type,
  required String signedTransaction,
  required String idempotencyKey,
}) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.submitTransaction(
    agentId: agentId,
    type: type,
    signedTransaction: signedTransaction,
    idempotencyKey: idempotencyKey,
  );
}

@riverpod
Future<FactoryAgent> addAgentVersion(
  Ref ref, {
  required String agentId,
  required String versionTag,
  String? customUrl,
  String? huggingFaceApiKey,
}) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.addAgentVersion(
    agentId: agentId,
    versionTag: versionTag,
    customUrl: customUrl,
    huggingFaceApiKey: huggingFaceApiKey,
  );
}

@riverpod
Future<FactoryAgent> setActiveVersion(
  Ref ref, {
  required String agentId,
  required String versionTag,
}) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.setActiveVersion(
    agentId: agentId,
    versionTag: versionTag,
  );
}

@riverpod
Future<AgentHealth> getAgentHealth(Ref ref, String agentId) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.getAgentHealth(agentId);
}

@riverpod
Future<AgentMetrics> getAgentMetrics(
  Ref ref, {
  required String agentId,
  String? timeframe,
  String? versionTag,
}) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.getAgentMetrics(
    agentId: agentId,
    timeframe: timeframe,
    versionTag: versionTag,
  );
}

@riverpod
Future<AgentSearchResponse> searchAgents(
  Ref ref, {
  String? query,
  String? sortBy,
  int? limit,
  int? offset,
}) async {
  final repository = ref.read(agentRepositoryProvider);
  return repository.searchAgents(
    query: query,
    sortBy: sortBy,
    limit: limit,
    offset: offset,
  );
}

// --- WebSocket Providers ---

@Riverpod(keepAlive: true)
AgentSocketService agentSocketService(Ref ref) {
  final service = AgentSocketService();
  ref.onDispose(service.dispose);
  return service;
}

@riverpod
Stream<AgentSocketMessage> agentUpdates(Ref ref, String agentId) {
  final socketService = ref.watch(agentSocketServiceProvider);
  final token =
      ref.watch(sessionNotifierProvider.select((s) => s.connectionToken));

  if (token == null || token.isEmpty) {
    return Stream.error(Exception('Authentication token not available.'));
  }

  // Connect the service if not already connected
  socketService
    ..connect(token)

    // Subscribe to the agent topic
    ..subscribe(agentId);

  // When the provider is no longer used, unsubscribe
  ref.onDispose(() {
    socketService.unsubscribe(agentId);
  });

  // Filter the stream for messages related to this specific agent
  return socketService.messages.where((message) {
    return message.map(
      unknown: (_) => false,
      error: (_) => true, // Always show errors
      subscriptionSuccess: (_) => true, // Show success messages
      agentStatusUpdate: (update) => update.data.agentId == agentId,
      txSubmitted: (tx) => tx.data.agentId == agentId,
    );
  });
}

@riverpod
Future<FactoryAgent?> agentByPoolId(Ref ref, String poolId) {
  final agentRepository = ref.watch(agentRepositoryProvider);
  return agentRepository.getAgentByPoolId(poolId);
}

@riverpod
Future<FactoryAgent> initiateDeployment(Ref ref, String agentId) {
  final agentRepository = ref.watch(agentRepositoryProvider);
  return agentRepository.initiateDeployment(agentId);
}

@riverpod
Future<FactoryAgent> retryAgentDeployment(Ref ref, String agentId) {
  final agentRepository = ref.watch(agentRepositoryProvider);
  return agentRepository.retryDeployment(agentId);
}
