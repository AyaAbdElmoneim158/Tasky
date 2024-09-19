class LoginRequestBody {
  final String? phone;
  final String? password;

  LoginRequestBody({
    this.phone,
    this.password,
  });

  factory LoginRequestBody.fromJson(Map<String, dynamic> json) {
    return LoginRequestBody(
      phone: json['phone'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
    };
  }
}
