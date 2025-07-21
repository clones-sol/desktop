import 'package:freezed_annotation/freezed_annotation.dart';

part 'deployment_version.freezed.dart';
part 'deployment_version.g.dart';

enum DeploymentVersionStatus {
  @JsonValue('active')
  active,
  @JsonValue('deprecated')
  deprecated,
}

extension DeploymentVersionStatusExtension on DeploymentVersionStatus {
  String get jsonValue {
    switch (this) {
      case DeploymentVersionStatus.active:
        return 'active';
      case DeploymentVersionStatus.deprecated:
        return 'deprecated';
    }
  }
}

@freezed
class DeploymentVersion with _$DeploymentVersion {
  const factory DeploymentVersion({
    required String versionTag,
    String? customUrl,
    String? encryptedApiKey,
    required DeploymentVersionStatus status,
    required DateTime createdAt,
  }) = _DeploymentVersion;

  factory DeploymentVersion.fromJson(Map<String, dynamic> json) =>
      _$DeploymentVersionFromJson(json);
}
