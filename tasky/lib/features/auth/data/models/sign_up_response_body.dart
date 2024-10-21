import '../../../../core/api/end_points.dart';

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
      phone: json[ApiKey.phone] as String?,
      password: json[ApiKey.password] as String?,
      displayName: json[ApiKey.displayName] as String?,
      experienceYears: json[ApiKey.experienceYears] as int?,
      level: json[ApiKey.level] as String?,
      address: json[ApiKey.address] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.phone: phone,
      ApiKey.password: password,
      ApiKey.displayName: displayName,
      ApiKey.experienceYears: experienceYears,
      ApiKey.level: level,
      ApiKey.address: address,
    };
  }
}
