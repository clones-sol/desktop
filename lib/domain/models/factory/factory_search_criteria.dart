// ignore_for_file: invalid_annotation_target

import 'package:clones_desktop/domain/models/factory/factory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'factory_search_criteria.freezed.dart';
part 'factory_search_criteria.g.dart';

/// Factory search criteria
@freezed
class FactorySearchCriteria with _$FactorySearchCriteria {
  const factory FactorySearchCriteria({
    List<String>? skills,
    String? searchTerm,
    String? creator,
    String? token,
    double? minBalance,
    double? maxBalance,
    FactoryStatus? status,
    @Default(20) int limit,
    @Default(0) int offset,
    @Default('createdAt') String sortBy,
    @Default('desc') String sortOrder,
  }) = _FactorySearchCriteria;

  factory FactorySearchCriteria.fromJson(Map<String, dynamic> json) =>
      _$FactorySearchCriteriaFromJson(json);
}
