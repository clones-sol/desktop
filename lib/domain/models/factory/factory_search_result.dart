// ignore_for_file: invalid_annotation_target

import 'package:clones_desktop/domain/models/factory/factory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'factory_search_result.freezed.dart';
part 'factory_search_result.g.dart';

/// Factory search result
@freezed
class FactorySearchResult with _$FactorySearchResult {
  const factory FactorySearchResult({
    @Default([]) List<Factory> factories,
    @Default(0) int total,
    @Default(20) int limit,
    @Default(0) int offset,
    @Default(false) bool hasMore,
  }) = _FactorySearchResult;

  factory FactorySearchResult.fromJson(Map<String, dynamic> json) =>
      _$FactorySearchResultFromJson(json);
}
