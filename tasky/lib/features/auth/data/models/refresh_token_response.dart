import '../../../../core/api/end_points.dart';

class RefreshTokenResponse {
  final String? accessToken;
  final String? refreshToken;

  RefreshTokenResponse({
    this.accessToken,
    this.refreshToken,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) {
    return RefreshTokenResponse(
      accessToken: json[ApiKey.accessToken] as String?,
      refreshToken: json[ApiKey.refreshToken] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.accessToken: accessToken,
      ApiKey.refreshToken: refreshToken,
    };
  }
}
