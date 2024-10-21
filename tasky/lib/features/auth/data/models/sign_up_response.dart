import '../../../../core/api/end_points.dart';

class SignUpResponse {
  final String? accessToken;
  final String? refreshToken;
  final String? displayName;
  final String? id;

  SignUpResponse({
    this.accessToken,
    this.refreshToken,
    this.displayName,
    this.id,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      accessToken: json[ApiKey.accessToken] as String?,
      refreshToken: json[ApiKey.refreshToken] as String?,
      displayName: json[ApiKey.displayName] as String?,
      id: json[ApiKey.id] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.accessToken: accessToken,
      ApiKey.refreshToken: refreshToken,
      ApiKey.displayName: displayName,
      ApiKey.id: id,
    };
  }
}
