// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'factory_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FactorySearchResultImpl _$$FactorySearchResultImplFromJson(
        Map<String, dynamic> json) =>
    _$FactorySearchResultImpl(
      factories: (json['factories'] as List<dynamic>?)
              ?.map((e) => Factory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 20,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
      hasMore: json['hasMore'] as bool? ?? false,
    );

Map<String, dynamic> _$$FactorySearchResultImplToJson(
        _$FactorySearchResultImpl instance) =>
    <String, dynamic>{
      'factories': instance.factories,
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
      'hasMore': instance.hasMore,
    };
