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
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      displayName: json['display_name'] as String?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'display_name': displayName,
      '_id': id,
    };
  }
}
