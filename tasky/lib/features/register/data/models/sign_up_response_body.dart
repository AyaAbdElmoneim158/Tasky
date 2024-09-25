class SignUpResponseBody {
  final String? phone;
  final String? password;
  final String? displayName;
  final int? experienceYears;
  final String? level;
  final String? address;

  SignUpResponseBody({
    this.phone,
    this.password,
    this.displayName,
    this.experienceYears,
    this.level,
    this.address,
  });

  factory SignUpResponseBody.fromJson(Map<String, dynamic> json) {
    return SignUpResponseBody(
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      displayName: json['display_name'] as String?,
      experienceYears: json['experience_years'] as int?,
      level: json['level'] as String?,
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
      'display_name': displayName,
      'experience_years': experienceYears,
      'level': level,
      'address': address,
    };
  }
}
