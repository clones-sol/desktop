// TrainingPool and related models for Forge endpoints
//
// Migrated from src/lib/types/forge.ts

import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_pool.freezed.dart';
part 'training_pool.g.dart';

enum TokenType { sol, viral, custom }

@freezed
class Token with _$Token {
  const factory Token({
    required TokenType type,
    required String symbol,
    required String address,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}

@freezed
class TrainingPool with _$TrainingPool {
  const factory TrainingPool({
    required String id,
    required String name,
    required TrainingPoolStatus status,
    required int demonstrations,
    required double funds,
    required double solBalance,
    required Token token,
    required String skills,
    String? ownerEmail,
    required String ownerAddress,
    required String depositAddress,
    bool? expanded,
    bool? unsavedSkills,
    double? pricePerDemo,
    bool? unsavedPrice,
    UploadLimit? uploadLimit,
    bool? unsavedUploadLimit,
  }) = _TrainingPool;

  factory TrainingPool.fromJson(Map<String, dynamic> json) =>
      _$TrainingPoolFromJson(json);
}

enum TrainingPoolStatus { live, paused, noFunds, noGas }

@freezed
class UploadLimit with _$UploadLimit {
  const factory UploadLimit({required int type, required String limitType}) =
      _UploadLimit;

  factory UploadLimit.fromJson(Map<String, dynamic> json) =>
      _$UploadLimitFromJson(json);
}

@freezed
class CreatePoolInput with _$CreatePoolInput {
  const factory CreatePoolInput({
    required String name,
    required String skills,
    required Token token,
    required String ownerAddress,
  }) = _CreatePoolInput;

  factory CreatePoolInput.fromJson(Map<String, dynamic> json) =>
      _$CreatePoolInputFromJson(json);
}

@freezed
class UpdatePoolInput with _$UpdatePoolInput {
  const factory UpdatePoolInput({
    required String id,
    TrainingPoolStatus? status,
    String? skills,
    double? pricePerDemo,
    UploadLimit? uploadLimit,
    List<dynamic>? apps, // Use dynamic for now, can be refined
  }) = _UpdatePoolInput;

  factory UpdatePoolInput.fromJson(Map<String, dynamic> json) =>
      _$UpdatePoolInputFromJson(json);
}
