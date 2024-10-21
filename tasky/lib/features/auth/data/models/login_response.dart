import '../../../../core/api/end_points.dart';

class LoginResponse {
  final String? id;
  final String? accessToken;
  final String? refreshToken;

  LoginResponse({
    this.id,
    this.accessToken,
    this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json[ApiKey.id] as String?,
      accessToken: json[ApiKey.accessToken] as String?,
      refreshToken: json[ApiKey.refreshToken] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.accessToken: accessToken,
      ApiKey.refreshToken: refreshToken,
    };
  }
}
