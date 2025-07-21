// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToolsInitStateImpl _$$ToolsInitStateImplFromJson(Map<String, dynamic> json) =>
    _$ToolsInitStateImpl(
      initializing: json['initializing'] as bool,
      progress: (json['progress'] as num).toDouble(),
    );

Map<String, dynamic> _$$ToolsInitStateImplToJson(
        _$ToolsInitStateImpl instance) =>
    <String, dynamic>{
      'initializing': instance.initializing,
      'progress': instance.progress,
    };
