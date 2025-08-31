// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionStateImpl _$$TransactionStateImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      awaitingCallback: json['awaitingCallback'] as bool? ?? false,
      error: json['error'] as String?,
      lastSuccessfulTx: json['lastSuccessfulTx'] as String?,
      currentTransactionType: json['currentTransactionType'] as String?,
      currentSessionId: json['currentSessionId'] as String?,
    );

Map<String, dynamic> _$$TransactionStateImplToJson(
        _$TransactionStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'awaitingCallback': instance.awaitingCallback,
      'error': instance.error,
      'lastSuccessfulTx': instance.lastSuccessfulTx,
      'currentTransactionType': instance.currentTransactionType,
      'currentSessionId': instance.currentSessionId,
    };
