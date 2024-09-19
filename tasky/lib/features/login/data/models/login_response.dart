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
      id: json['_id'] as String?,
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
