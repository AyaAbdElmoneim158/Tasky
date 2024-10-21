import '../../../../core/api/end_points.dart';

class LoginRequestBody {
  final String? phone;
  final String? password;

  LoginRequestBody({
    this.phone,
    this.password,
  });

  factory LoginRequestBody.fromJson(Map<String, dynamic> json) {
    return LoginRequestBody(
      phone: json[ApiKey.phone] as String?,
      password: json[ApiKey.password] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.phone: phone,
      ApiKey.password: password,
    };
  }
}
