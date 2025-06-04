// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forge_app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgeTaskImpl _$$ForgeTaskImplFromJson(Map<String, dynamic> json) =>
    _$ForgeTaskImpl(
      id: json['id'] as String?,
      prompt: json['prompt'] as String?,
      uploadLimit: (json['uploadLimit'] as num?)?.toInt(),
      rewardLimit: (json['rewardLimit'] as num?)?.toInt(),
      completed: json['completed'] as bool?,
      recordingId: json['recordingId'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      uploadLimitReached: json['uploadLimitReached'] as bool?,
      currentSubmissions: (json['currentSubmissions'] as num?)?.toInt(),
      limitReason: json['limitReason'] as String?,
    );

Map<String, dynamic> _$$ForgeTaskImplToJson(_$ForgeTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prompt': instance.prompt,
      'uploadLimit': instance.uploadLimit,
      'rewardLimit': instance.rewardLimit,
      'completed': instance.completed,
      'recordingId': instance.recordingId,
      'score': instance.score,
      'uploadLimitReached': instance.uploadLimitReached,
      'currentSubmissions': instance.currentSubmissions,
      'limitReason': instance.limitReason,
    };

_$ForgeAppPoolImpl _$$ForgeAppPoolImplFromJson(Map<String, dynamic> json) =>
    _$ForgeAppPoolImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      pricePerDemo: (json['pricePerDemo'] as num).toDouble(),
    );

Map<String, dynamic> _$$ForgeAppPoolImplToJson(_$ForgeAppPoolImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'pricePerDemo': instance.pricePerDemo,
    };

_$ForgeAppImpl _$$ForgeAppImplFromJson(Map<String, dynamic> json) =>
    _$ForgeAppImpl(
      name: json['name'] as String,
      domain: json['domain'] as String,
      description: json['description'] as String,
      categories:
          (json['categories'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      tasks:
          (json['tasks'] as List<dynamic>)
              .map((e) => ForgeTask.fromJson(e as Map<String, dynamic>))
              .toList(),
      poolId: ForgeAppPool.fromJson(json['poolId'] as Map<String, dynamic>),
      seen: json['seen'] as bool?,
      gymLimitReached: json['gymLimitReached'] as bool?,
      gymSubmissions: (json['gymSubmissions'] as num?)?.toInt(),
      gymLimitType: json['gymLimitType'] as String?,
      gymLimitValue: (json['gymLimitValue'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ForgeAppImplToJson(_$ForgeAppImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'domain': instance.domain,
      'description': instance.description,
      'categories': instance.categories,
      'tasks': instance.tasks,
      'poolId': instance.poolId,
      'seen': instance.seen,
      'gymLimitReached': instance.gymLimitReached,
      'gymSubmissions': instance.gymSubmissions,
      'gymLimitType': instance.gymLimitType,
      'gymLimitValue': instance.gymLimitValue,
    };
