import 'package:clones_desktop/infrastructure/metadata.repository.dart';
import 'package:clones_desktop/utils/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'metadata.g.dart';

@riverpod
MetadataRepositoryImpl metadataRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return MetadataRepositoryImpl(apiClient);
}

@riverpod
Future<Map<String, dynamic>> uploadMetadata(
  Ref ref, {
  required String poolAddress,
  required String title,
  required String description,
  required List<String> skills,
  required String creator,
}) {
  final repository = ref.read(metadataRepositoryProvider);
  return repository.uploadMetadata(
    poolAddress: poolAddress,
    title: title,
    description: description,
    skills: skills,
    creator: creator,
  );
}

@riverpod
Future<Map<String, dynamic>> getSkillsMetadata(
  Ref ref, {
  required String hash,
}) {
  final repository = ref.read(metadataRepositoryProvider);
  return repository.getSkillsMetadata(hash: hash);
}

@riverpod
Future<Map<String, dynamic>> searchPoolsByMetadata(
  Ref ref, {
  List<String>? skills,
  String? searchTerm,
  String? category,
  int limit = 20,
  int offset = 0,
}) {
  final repository = ref.read(metadataRepositoryProvider);
  return repository.searchPoolsByMetadata(
    skills: skills,
    searchTerm: searchTerm,
    category: category,
    limit: limit,
    offset: offset,
  );
}

@riverpod
Future<Map<String, dynamic>> metadataHealthCheck(Ref ref) {
  final repository = ref.read(metadataRepositoryProvider);
  return repository.healthCheck();
}

@riverpod
Future<Map<String, dynamic>> validateMetadata(
  Ref ref, {
  required String title,
  required String description,
  required List<String> skills,
}) {
  final repository = ref.read(metadataRepositoryProvider);
  return repository.validateMetadata(
    title: title,
    description: description,
    skills: skills,
  );
}
